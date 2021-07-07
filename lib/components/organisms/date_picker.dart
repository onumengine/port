import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:port/bloc/date_picker/bloc.dart';
import 'package:port/bloc/date_picker/event.dart';
import 'package:port/bloc/date_picker/state.dart';
import 'package:port/components/atoms/calendar_bubble.dart';
import 'package:port/utility/colors.dart';

/// NEW FEATURE:
/// Make it impossible to select a date that comes before the current date
///
/// HOW:
/// Load the current date in initState
/// Disable the decrement buttons
/// Disable the date bubbles before the current day bubble
/// That way, it will be impossible to decrement the date below the current date

class DatePicker extends StatefulWidget {
  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  int _calendarBubbleNumber;
  DatePickerBloc _datePickerBloc;

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

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _datePickerBloc = BlocProvider.of<DatePickerBloc>(context);

    return BlocConsumer<DatePickerBloc, DatePickerState>(
      listener: (context, state) {
        // TODO
      },
      buildWhen: (previous, current) {
        // TODO: Implement buildWhen
      },
      builder: (context, state) {
        if (state is DatePickerState) {
          return FractionallySizedBox(
            widthFactor: 1,
            child: Container(
              height: (screenSize.height / 2) + 50,
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
                        onPressed: (_isInCurrentYear(state)) ? null : () {
                          _datePickerBloc.add(YearDecrementEvent());
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
                        onPressed: (_isInCurrentMonth(state) && _isInCurrentYear(state)) ? null : () {
                          _datePickerBloc.add(MonthDecrementEvent());
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
                          _datePickerBloc.add(MonthIncrementEvent());
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
                          _datePickerBloc.add(YearIncrementEvent());
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text("S"),
                      Text("M"),
                      Text("T"),
                      Text("W"),
                      Text("T"),
                      Text("F"),
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
                        itemBuilder: (context, indexOfCalendarBubble) {
                          _calendarBubbleNumber = (indexOfCalendarBubble -
                                  state.weekdayToRenderFrom) +
                              1;
                          return indexOfCalendarBubble <
                                  state.weekdayToRenderFrom
                              ? Container()
                              : CalendarBubble(
                                  child: (_calendarBubbleNumber ==
                                          state.selectedDay)
                                      ? Text(
                                          "$_calendarBubbleNumber",
                                          style: TextStyle(
                                            color: opBackgroundColor,
                                          ),
                                        )
                                      : Text(
                                          "$_calendarBubbleNumber",
                                          style: TextStyle(
                                            color: (indexOfCalendarBubble <
                                                    (DateTime.now().day +
                                                        state
                                                            .weekdayToRenderFrom -
                                                        1))
                                                ? Colors.white
                                                : primaryTextColor,
                                          ),
                                        ),
                                  color: (_calendarBubbleNumber ==
                                          state.selectedDay)
                                      ? appBarTitleColor
                                      : paleCircleAvatarBackground,
                                  onTap: (indexOfCalendarBubble <
                                          (DateTime.now().day +
                                              state.weekdayToRenderFrom -
                                              1))
                                      ? () {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                  "Sorry. You can only fix an appointment today or after today"),
                                            ),
                                          );
                                        }
                                      : () {
                                          _datePickerBloc.add(
                                            DaySelectionEvent(
                                                (indexOfCalendarBubble -
                                                        state
                                                            .weekdayToRenderFrom) +
                                                    1),
                                          );
                                        },
                                );
                        },
                        itemCount: (state.itemCount),
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

  bool _isInCurrentMonth(DatePickerState state) {
    return (state.selectedMonth == DateTime.now().month);
  }

  bool _isInCurrentYear(DatePickerState state) {
    return (state.selectedYear == DateTime.now().year);
  }
}
