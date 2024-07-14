import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  CategoryItem categoryItem;
  int index;

  CategoryWidget({required this.categoryItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: categoryItem.bgColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
            bottomLeft: Radius.circular(index.isEven ? 25 : 0),
            bottomRight: Radius.circular(index.isEven ? 0 : 25),
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            categoryItem.imagePath,
            height: 116,
          ),
          Text(
            categoryItem.title,
            style: TextStyle(
                fontWeight: FontWeight.w400, fontSize: 18, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class CategoryItem {
  String id;
  String title;
  String imagePath;
  Color bgColor;

  CategoryItem(
      {required this.id,
      required this.title,
      required this.imagePath,
      required this.bgColor});

  static List<CategoryItem> getCategoriesList() {
    return [
      CategoryItem(
          id: 'sports',
          title: 'Sports',
          imagePath: 'assets/images/sports.png',
          bgColor: Color(0xFFC91C22)),
      CategoryItem(
          id: 'general',
          title: 'General',
          imagePath: 'assets/images/Politics.png',
          bgColor: Color(0xFF003E90)),
      CategoryItem(
          id: 'health',
          title: 'Health',
          imagePath: 'assets/images/health.png',
          bgColor: Color(0xFFED1E79)),
      CategoryItem(
          id: 'business',
          title: 'Business',
          imagePath: 'assets/images/bussines.png',
          bgColor: Color(0xFFCF7E48)),
      CategoryItem(
          id: 'technology',
          title: 'Technology',
          imagePath: 'assets/images/environment.png',
          bgColor: Color(0xFF4882CF)),
      CategoryItem(
          id: 'science',
          title: 'Science',
          imagePath: 'assets/images/science.png',
          bgColor: Colors.amber),
      CategoryItem(
          id: 'entertainment',
          title: 'Entertainment',
          imagePath: 'assets/images/environment.png',
          bgColor: Colors.green),
    ];
  }
}
