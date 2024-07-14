import 'package:flutter/material.dart';
import 'package:news_app/ui/home/categories_fragment/categories_fragment.dart';
import 'package:news_app/ui/home/categories_fragment/category_details.dart';
import 'package:news_app/ui/home/home_drawer.dart';
import 'package:news_app/ui/home/settings_fragment/settings_fragment.dart';
import 'package:news_app/ui/widgets/category_widget.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedWidget = CategoriesFragment(
      onCategoryItemClicked: onCategoryItemClicked,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/bg_pattern.png')),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            'Route News App',
          ),
        ),
        drawer: HomeDrawer(
          onDrawerItemClicked: onDrawerItemClicked,
        ),
        body: selectedWidget,
      ),
    );
  }

  late Widget selectedWidget = CategoriesFragment(
    onCategoryItemClicked: onCategoryItemClicked,
  );

  void onDrawerItemClicked(DrawerItem item) {
    switch (item) {
      case DrawerItem.categories:
        {
          selectedWidget = CategoriesFragment(
            onCategoryItemClicked: onCategoryItemClicked,
          );
        }
      case DrawerItem.settings:
        {
          selectedWidget = SettingsFragment();
        }
    }
    Navigator.pop(context);
    setState(() {});
  }

  void onCategoryItemClicked(CategoryItem categoryItem) {
    selectedWidget = CategoryDetails(
      categoryItem: categoryItem,
    );
    setState(() {});
  }
}
