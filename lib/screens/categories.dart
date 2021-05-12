import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:port/components/atoms/searchbar.dart';
import 'package:port/components/molecules/category_card.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
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
      body: Container(
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
                  return CategoryCard(
                    iconPath: _categories.values.toList().elementAt(index),
                    semanticLabel: _semanticLabels[index],
                    categoryName: _categories.keys.toList()[index],
                  );
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
      ),
    );
  }
}
