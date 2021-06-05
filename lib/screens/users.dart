import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:port/bloc/date_picker/bloc.dart';
import 'package:port/bloc/scheduler/bloc.dart';
import 'package:port/bloc/users/bloc.dart';
import 'package:port/bloc/users/event.dart';
import 'package:port/bloc/users/state.dart';
import 'package:port/components/molecules/user_card.dart';
import 'package:port/screens/scheduler.dart';
import 'package:port/utility/colors.dart';
import 'package:port/utility/colors_main.dart';

class UsersScreen extends StatefulWidget {
  String userOrganizationId;

  UsersScreen({@required this.userOrganizationId});

  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  UsersBloc _usersBloc;

  @override
  void initState() {
    super.initState();
    print("YOUR ORGANIZATION PATH IS ${widget.userOrganizationId}");
    _usersBloc = BlocProvider.of<UsersBloc>(context);
    _usersBloc.add(UsersFetchEvent(usersOrganizationId: widget.userOrganizationId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(CupertinoIcons.back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Users",
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 212,
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: colorOrangeChip,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  "Bank of America",
                  style: TextStyle(
                    color: Color(0xFFFD9453),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: BlocBuilder<UsersBloc, UsersScreenState>(
        builder: (context, state) {
          if (state is FetchingUsersState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PopulatedUsersState) {
            return ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 30),
              itemBuilder: (context, index) => UserCard(
                imagePath: "images/mike.svg",
                name: state.users.elementAt(index)["name"],
                jobTitle: state.users.elementAt(index)["title"],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MultiBlocProvider(
                        providers: [
                          BlocProvider<SchedulerBloc>(
                              create: (context) => SchedulerBloc()),
                          BlocProvider<DatePickerBloc>(
                              create: (context) => DatePickerBloc()),
                        ],
                        child: SchedulerScreen(),
                      ),
                    ),
                  );
                },
              ),
              separatorBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Divider(
                  indent: 20,
                  endIndent: 20,
                ),
              ),
              itemCount: state.users.length,
            );
          } else if (state is FetchingErrorState) {
            return Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.error),
                SizedBox(height: 20),
                Text(
                  state.errorMessage,
                  style: TextStyle(
                    color: paleTextColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
