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
import 'package:port/utility/colors_main.dart';

class UsersScreen extends StatefulWidget {
  String userOrganizationId;
  String userOrganizationName;

  UsersScreen({
    @required this.userOrganizationId,
    @required this.userOrganizationName,
  });

  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  UsersBloc _usersBloc;

  @override
  void initState() {
    super.initState();
    _usersBloc = BlocProvider.of<UsersBloc>(context);
    _usersBloc.add(
      UsersFetchEvent(
        usersOrganizationId: widget.userOrganizationId,
        usersOrganizationName: widget.userOrganizationName,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UsersBloc, UsersScreenState>(
      listener: (context, state) {
        if (state is SubmittedState) {
          print("THE BLOC HAS YIELDED SUBMITTED_STATE");
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
        }
      },
      builder: (context, state) {
        if (state is FetchingUsersState) {
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
            ),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is PopulatedUsersState) {
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
                        state.userOrganizationName,
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
            body: ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 30),
              itemBuilder: (context, index) => UserCard(
                imagePath: "images/mike.svg",
                name: state.users.elementAt(index)["name"],
                jobTitle: state.users.elementAt(index)["title"],
                onTap: () {
                  _usersBloc.add(
                    UserSubmitEvent(
                      selectedUserId: state.users.elementAt(index)["org_id"],
                    ),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MultiBlocProvider(
                        providers: [
                          BlocProvider<SchedulerBloc>(
                            create: (context) => SchedulerBloc(),
                          ),
                          BlocProvider<DatePickerBloc>(
                            create: (context) => DatePickerBloc(),
                          )
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
            ),
          );
        } else if (state is FetchingErrorState) {
          return Scaffold(
              body: Center(
            child: CircularProgressIndicator(),
          ));
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
