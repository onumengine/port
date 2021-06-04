import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:port/bloc/organizations/bloc.dart';
import 'package:port/bloc/organizations/event.dart';
import 'package:port/bloc/organizations/state.dart';
import 'package:port/bloc/users/bloc.dart';
import 'package:port/components/atoms/searchbar.dart';
import 'package:port/components/molecules/organization_card.dart';
import 'package:port/screens/users.dart';
import 'package:port/utility/colors_main.dart';

class OrganizationsScreen extends StatefulWidget {
  String categoryId;

  OrganizationsScreen({this.categoryId});

  @override
  _OrganizationsScreenState createState() => _OrganizationsScreenState();
}

class _OrganizationsScreenState extends State<OrganizationsScreen> {
  OrganizationsBloc _organizationsBloc;

  @override
  void initState() {
    super.initState();
    _organizationsBloc = BlocProvider.of<OrganizationsBloc>(context);
    _organizationsBloc
        .add(OrganizationsFetchEvent(categoryId: widget.categoryId));
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
          "Choose Organization",
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset("lib/vectors/location_icon.svg"),
            onPressed: () {
              print("Pressed location icon");
            },
          ),
        ],
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
      body: BlocBuilder<OrganizationsBloc, OrganizationsState>(
        builder: (context, state) {
          if (state is OrganizationsFetchingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is PopulatedOrganizationsState) {
            return CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  elevation: 0,
                  expandedHeight: 100,
                  automaticallyImplyLeading: false,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.only(
                        top: 20, bottom: 40, left: 20, right: 20),
                    child: SearchBar(),
                  ),
                  floating: true,
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return OrganizationCard(
                        organizationSymbol: "B",
                        organizationName: state.organizations.elementAt(index)["name"],
                        distanceFromUser: 2,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BlocProvider<UsersBloc>(
                                create: (context) => UsersBloc(),
                                child: UsersScreen(),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    childCount: state.organizations.length,
                  ),
                ),
              ],
            );
          } else if (state is OrganizationsFetchingErrorState) {
            return GestureDetector(
              onTap: () {
                _organizationsBloc.add(OrganizationsFetchEvent());
              },
              child: Center(
                child: Text("Couldn't fetch categories. Tap to retry"),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  double _getHorizontalPadding(double screenWidth) {
    if (screenWidth < 592) {
      return 20;
    } else if (screenWidth > 592 && screenWidth < 1000) {
      return 40;
    } else if (screenWidth > 1000) {
      return 3;
    }
  }
}
