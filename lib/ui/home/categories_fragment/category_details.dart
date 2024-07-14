import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/ui/home/categories_fragment/category_details_view_model.dart';
import 'package:news_app/ui/home/categories_fragment/sources_tabs.dart';
import 'package:news_app/ui/widgets/category_widget.dart';

class CategoryDetails extends StatefulWidget {
  CategoryItem categoryItem;

  CategoryDetails({required this.categoryItem});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  CategoryDetailsViewModel viewModel = CategoryDetailsViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.loadSources(widget.categoryItem.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryDetailsViewModel, CategoryDetailsState>(
      bloc: viewModel,
      builder: (context, state) {
        switch (state) {
          case LoadingState():
            return Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: Colors.green,
                  ),
                  Text(state.message),
                ],
              ),
            );

          case ErrorState():
            return Center(
                child: Column(
              children: [
                Text(state.errorMessage ?? ''),
                ElevatedButton(
                    onPressed: () {
                      viewModel.loadSources(widget.categoryItem.id);
                    },
                    child: Text('Try again')),
              ],
            ));

          case SuccessState():
            {
              return SourcesTabs(sourcesList: state.sourcesList!);
            }
        }
      },
    );
  }
}
