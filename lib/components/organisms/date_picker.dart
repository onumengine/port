import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:port/bloc/scheduler/bloc.dart';
import 'package:port/bloc/scheduler/event.dart';
import 'package:port/bloc/scheduler/state.dart';
import 'package:port/components/atoms/calendar_bubble.dart';
import 'package:port/utility/colors.dart';
import 'package:port/utility/colors_main.dart';

class DatePicker extends StatefulWidget {
  @override
  _DatePickerState createState() => _DatePickerState();
}

///  ## How this calendar should populate the days
///
///  1. Switch to a new month.
///  2. Update the [_currentMonth] variable.
///  3. Check the first weekday of the month.
///  4. Update the [_firstDayOfSelectedMonth] variable.
///  5. Use the variable to calculate the number of days to skip with the method
///     [_getNumberOfDaysToSkip].
///  6. Store this number in a variable [_numberOfDaysToSkip].
///  7. GridBuilder will render empty containers from index 0 to index
///     [_numberOfDaysToSkip - 2]
///  8. GridBuilder will render [CalendarBubble]s from index [_numberOfDaysToSkip - 2]
///     to the number of days in the month
///  9. Find a way to get the number of days in a month
/// 10. Make number of [CalendarBubble]s rendered by GridBuilder equal to the number
///     of days in a month

class _DatePickerState extends State<DatePicker> {
  DateTime _dateTime;
  int _currentWeekday, _currentMonth, _currentYear, _firstDayOfSelectedMonth;
  int _numberOfDaysInSelectedMonth;
  SchedulerBloc _schedulerBloc;

  Map<int, String> _numberToMonthMap = <int, String>{
    1: "Jan",
    2: "Feb",
    3: "Mar",
    4: "Apr",
    5: "May",
    6: "Jun",
    7: "Jul",
    8: "Aug",
    9: "Sep",
    10: "Oct",
    11: "Nov",
    12: "Dec",
  };

  Map<int, String> _numberToWeekdayMap = <int, String>{
    1: "Mon",
    2: "Tue",
    3: "Wed",
    4: "Thu",
    5: "Fri",
    6: "Sat",
    7: "Sun",
  };

  @override
  void initState() {
    super.initState();
    setState(() {
      _dateTime = DateTime.now();
    });
    _currentMonth = _dateTime.month;
    _currentYear = _dateTime.year;
    _setNumberOfDaysInSelectedMonth();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _schedulerBloc = BlocProvider.of<SchedulerBloc>(context);

    return BlocBuilder<SchedulerBloc, SchedulerState>(
      builder: (context, state) {
        if (state is ScheduleState) {
          return FractionallySizedBox(
            widthFactor: 1,
            child: Container(
              height: screenSize.height / 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  SizedBox(height: 12),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RawMaterialButton(
                        child: Icon(
                          CupertinoIcons.chevron_left_2,
                          size: 20,
                        ),
                        elevation: 2,
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(4),
                        fillColor: paleChipBackground,
                        constraints:
                            BoxConstraints(minWidth: 36, minHeight: 36),
                        onPressed: () {
                          /*
                        _decrementYear();
                        _createNewDateTime();
                        _setFirstDayOfSelectedMonth();
                        _setNumberOfDaysInSelectedMonth();
                        */
                          _schedulerBloc.add(YearDecrementEvent());
                        },
                      ),
                      RawMaterialButton(
                        child: Icon(
                          CupertinoIcons.chevron_left,
                          size: 20,
                        ),
                        elevation: 2,
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(2),
                        fillColor: paleChipBackground,
                        constraints:
                            BoxConstraints(minWidth: 36, minHeight: 28),
                        onPressed: () {
                          _decrementMonth();
                          _createNewDateTime();
                          _setFirstDayOfSelectedMonth();
                          _setNumberOfDaysInSelectedMonth();
                        },
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            "${state.selectedYear}",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                          Text("${_numberToMonthMap[state.selectedMonth]}"),
                        ],
                      ),
                      RawMaterialButton(
                        child: Icon(
                          CupertinoIcons.chevron_right,
                          size: 20,
                        ),
                        elevation: 2,
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(2),
                        fillColor: paleChipBackground,
                        constraints:
                            BoxConstraints(minWidth: 36, minHeight: 28),
                        onPressed: () {
                          _incrementMonth();
                          _createNewDateTime();
                          _setFirstDayOfSelectedMonth();
                          _setNumberOfDaysInSelectedMonth();
                        },
                      ),
                      RawMaterialButton(
                        child: Icon(
                          CupertinoIcons.chevron_right_2,
                          size: 20,
                        ),
                        elevation: 2,
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(4),
                        fillColor: paleChipBackground,
                        constraints:
                            BoxConstraints(minWidth: 36, minHeight: 36),
                        onPressed: () {
                          _incrementYear();
                          _createNewDateTime();
                          _setFirstDayOfSelectedMonth();
                          _setNumberOfDaysInSelectedMonth();
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text("M"),
                      Text("T"),
                      Text("W"),
                      Text("T"),
                      Text("F"),
                      Text("S"),
                      Text("S"),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 8),
                      padding: EdgeInsets.all(8),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 7,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                        ),
                        itemBuilder: (context, index) {
                          return index < _getNumberOfDaysToSkip()
                              ? Container()
                              : CalendarBubble(
                                  text:
                                      "${(index - _getNumberOfDaysToSkip()) + 1}",
                                  onTap: () {
                                    print(
                                        "Tapped the calendar bubble ${index + 1}");
                                  },
                                );
                        },
                        itemCount: (_numberOfDaysInSelectedMonth +
                            _getNumberOfDaysToSkip()),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Center(child: Text("Unable to load DatePicker"));
        }
      },
    );
  }

  void _setNumberOfDaysInSelectedMonth() {
    _numberOfDaysInSelectedMonth =
        DateTime(_currentYear, _currentMonth + 1, 0).day;
    print(
        "There are $_numberOfDaysInSelectedMonth days in ${_numberToMonthMap[_currentMonth]}");
  }

  void _setFirstDayOfSelectedMonth() {
    _firstDayOfSelectedMonth = _dateTime.weekday;
    print(
      "First day of ${_numberToMonthMap[_dateTime.month]} is ${_numberToWeekdayMap[_firstDayOfSelectedMonth]}",
    );
  }

  int _getNumberOfDaysToSkip() {
    if (_firstDayOfSelectedMonth == null) {
      _setFirstDayOfSelectedMonth();
    }
    return _firstDayOfSelectedMonth - 1;
  }

  void _createNewDateTime() {
    _dateTime = DateTime(
      _currentYear,
      _currentMonth,
    );
  }

  void _incrementYear() {
    setState(() {
      _currentYear++;
    });
  }

  void _decrementYear() {
    setState(() {
      _currentYear--;
    });
  }

  void _incrementMonth() {
    setState(() {
      if (_currentMonth == 12) {
        _currentMonth = 1;
        _currentYear++;
      } else {
        _currentMonth++;
      }
    });
  }

  void _decrementMonth() {
    setState(() {
      if (_currentMonth == 1) {
        _currentMonth = 12;
        _currentYear--;
      } else {
        _currentMonth--;
      }
    });
  }
}
