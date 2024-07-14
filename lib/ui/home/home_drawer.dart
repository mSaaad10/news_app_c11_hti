import 'package:flutter/material.dart';
import 'package:news_app/style/my_theme_data.dart';

typedef OnDrawerItemClicked = void Function(DrawerItem);

class HomeDrawer extends StatelessWidget {
  OnDrawerItemClicked onDrawerItemClicked;
  static const int categories = 0;
  static const int settings = 1;

  HomeDrawer({required this.onDrawerItemClicked});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 110,
              color: MyThemeData.primaryColor,
              child: Text(
                'News App!',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              )),
          InkWell(
            onTap: () {
              onDrawerItemClicked(DrawerItem.categories);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.list,
                    size: 28,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Categories',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              onDrawerItemClicked(DrawerItem.settings);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.settings,
                    size: 28,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Settings',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum DrawerItem {
  categories,
  settings,
}
