import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:port/bloc/scheduler/bloc.dart';
import 'package:port/bloc/scheduler/event.dart';
import 'package:port/bloc/scheduler/state.dart';
import 'package:port/bloc/submit/bloc.dart';
import 'package:port/components/atoms/time_button.dart';
import 'package:port/components/organisms/date_picker.dart';
import 'package:port/screens/submit.dart';
import 'package:port/utility/colors.dart';
import 'package:port/utility/colors_main.dart';

class SchedulerScreen extends StatefulWidget {
  @override
  _SchedulerScreenState createState() => _SchedulerScreenState();
}

class _SchedulerScreenState extends State<SchedulerScreen> {
  SchedulerBloc _schedulerBloc;
  Map<int, String> indicesToTimes = {
    0: "08:30",
    1: "09:00",
    2: "09:30",
    3: "10:00",
    4: "10:30",
    5: "11:00",
  };

  @override
  void initState() {
    super.initState();
    _schedulerBloc = BlocProvider.of<SchedulerBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(CupertinoIcons.back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Pick day and time",
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: BlocBuilder<SchedulerBloc, SchedulerScreenState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      return DatePicker();
                    },
                    childCount: 1,
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Container(
                        height: 50,
                        padding: EdgeInsets.all(12),
                        margin:
                        EdgeInsets.only(top: 40, bottom: 20, left: 4, right: 4),
                        decoration: BoxDecoration(
                          color: colorOrangeChip,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          "Paris (GMT+2)",
                          style: TextStyle(
                            color: orangeChipTextColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.1,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Choose time",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
                SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 26,
                    crossAxisSpacing: 26,
                    childAspectRatio: 2 / 1,
                  ),
                  delegate: SliverChildBuilderDelegate(
                          (context, index) {
                        return TimeButton(
                          label: indicesToTimes[index],
                          onTap: () {
                            _schedulerBloc.add(TimeSelectionEvent());
                          },
                        );
                      },
                    childCount: indicesToTimes.keys.length,
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      SizedBox(height: 30),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Choose duration",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
                SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 26,
                    crossAxisSpacing: 26,
                    childAspectRatio: 1.6774,
                  ),
                  delegate: SliverChildListDelegate(
                      [
                        Container(
                          height: 62,
                          width: screenSize.width / 14,
                          decoration: BoxDecoration(
                            color: paleChipBackground,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              "30mins",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: chipTextColorDisabled,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 62,
                          width: screenSize.width / 14,
                          decoration: BoxDecoration(
                            color: paleChipBackground,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              "1hr",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: chipTextColorDisabled,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 62,
                          width: screenSize.width / 14,
                          decoration: BoxDecoration(
                            color: paleChipBackground,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              "2hrs",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: chipTextColorDisabled,
                              ),
                            ),
                          ),
                        ),
                      ]
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      SizedBox(height: 110),
                    ],
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Container(
                        height: 54,
                        decoration: BoxDecoration(
                          color: opPrimaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextButton(
                          child: Text(
                            "Proceed",
                            style: TextStyle(
                              color: white,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BlocProvider<SubmitBloc>(
                                  create: (context) => SubmitBloc(),
                                  child: SubmitScreen(),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 40),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
