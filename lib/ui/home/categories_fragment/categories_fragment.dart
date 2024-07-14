import 'package:flutter/material.dart';
import 'package:news_app/ui/widgets/category_widget.dart';

typedef OnCategoryItemClicked = void Function(CategoryItem);

class CategoriesFragment extends StatelessWidget {
  OnCategoryItemClicked onCategoryItemClicked;

  CategoriesFragment({required this.onCategoryItemClicked});

  List<CategoryItem> categoriesList = CategoryItem.getCategoriesList();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 35, vertical: 36),
      child: Column(
        children: [
          Text(
            'Pick your category\nof interest',
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Color(0xFF4F5A69)),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: .8),
              itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    onCategoryItemClicked(categoriesList[index]);
                  },
                  child: CategoryWidget(
                      categoryItem: categoriesList[index], index: index)),
              itemCount: categoriesList.length,
            ),
          )
        ],
      ),
    );
  }
}
