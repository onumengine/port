import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:port/bloc/categories/bloc.dart';
import 'package:port/bloc/categories/event.dart';
import 'package:port/bloc/categories/state.dart';
import 'package:port/bloc/notifications/bloc.dart';
import 'package:port/bloc/organizations/bloc.dart';
import 'package:port/components/atoms/searchbar.dart';
import 'package:port/components/molecules/category_card.dart';
import 'package:port/screens/notifications.dart';
import 'package:port/screens/organizations.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  CategoriesBloc _categoriesBloc;

  @override
  void initState() {
    _categoriesBloc = BlocProvider.of<CategoriesBloc>(context);
    super.initState();
    _categoriesBloc.add(CategoriesFetchEvent());
  }

  Map<String, String> _categories = {
    "Banks": "lib/vectors/bank_icon.svg",
    "Restaurants": "lib/vectors/restaurants_icon.svg",
    "Hospitals": "lib/vectors/hospital_icon.svg",
    "Gyms": "lib/vectors/gyms_icon.svg",
    "Schools": "lib/vectors/schools_icon.svg",
    "Churches": "lib/vectors/church_icon.svg",
    "Shops": "lib/vectors/shop_icon.svg",
    "Stores": "lib/vectors/store_icon.svg",
  };

  List<String> _semanticLabels = [
    "Bank icon",
    "Restaurant icon",
    "Hospital icon",
    "Gym icon",
    "School icon",
    "Church icon",
    "Shop icon",
    "Store icon",
  ];

  double _getHorizontalPadding(double screenWidth) {
    if (screenWidth < 592) {
      return 20;
    } else if (screenWidth > 592 && screenWidth < 1000) {
      return 40;
    } else if (screenWidth > 1000) {
      return 3;
    }
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
          "Choose Category",
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: BlocBuilder<CategoriesBloc, CategoriesState>(
        builder: (BuildContext context, CategoriesState state) {
          if (state is CategoriesFetchedState) {
            return Container(
              height: screenSize.height,
              width: screenSize.width,
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    elevation: 0,
                    expandedHeight: 100,
                    automaticallyImplyLeading: false,
                    flexibleSpace: Padding(
                      padding: EdgeInsets.only(
                        top: 20,
                        bottom: 40,
                        left: _getHorizontalPadding(screenSize.width),
                        right: _getHorizontalPadding(screenSize.width),
                      ),
                      child: SearchBar(),
                    ),
                    floating: true,
                  ),
                  SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      childAspectRatio: 4 / 5,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        if (_isAnOddNumber(index)) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: CategoryCard(
                              iconPath:
                                  _categories.values.toList().elementAt(index),
                              semanticLabel: _semanticLabels[index],
                              categoryName: _categories.keys.toList()[index],
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        BlocProvider<OrganizationsBloc>(
                                      create: (context) => OrganizationsBloc(),
                                      child: OrganizationsScreen(),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        } else {
                          return Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: CategoryCard(
                              iconPath:
                                  _categories.values.toList().elementAt(index),
                              semanticLabel: _semanticLabels[index],
                              categoryName: _categories.keys.toList()[index],
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        BlocProvider<OrganizationsBloc>(
                                      create: (context) => OrganizationsBloc(),
                                      child: OrganizationsScreen(),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        }
                      },
                      childCount: _semanticLabels.length,
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      <Widget>[
                        SizedBox(height: 50),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else if (state is CategoriesFetchingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ErrorState) {
            return Center(
              child: Text("Unable to fetch categories"),
            );
          } else {
            return Center();
          }
        },
      ),
    );
  }

  bool _isAnOddNumber(int index) {
    return (index % 2) != 0;
  }
}
