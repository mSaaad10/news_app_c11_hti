import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/api/model/sources_response/Source.dart';
import 'package:news_app/ui/home/news_list_widget/news_details_view_model.dart';
import 'package:news_app/ui/home/news_list_widget/news_item_widget.dart';

class NewsListWidget extends StatefulWidget {
  Source source;

  NewsListWidget({required this.source});

  @override
  State<NewsListWidget> createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
  NewsDetailsViewModel viewModel = NewsDetailsViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.loadNews(widget.source.id ?? '');
  }

  @override
  void didUpdateWidget(covariant NewsListWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    viewModel.loadNews(widget.source.id ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsDetailsViewModel, NewsDetailsState>(
      bloc: viewModel,
      builder: (context, state) {
        switch (state) {
          case LoadingState():
            return Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.message),
                  CircularProgressIndicator(),
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
                        viewModel.loadNews(widget.source.id ?? '');
                      },
                      child: Text('Try Again'))
                ],
              ),
            );
          case SuccessState():
            return Expanded(
              child: ListView.builder(
                  itemBuilder: (context, index) =>
                      NewsItemWidget(news: state.newsList![index]),
                  itemCount: state.newsList?.length),
            );
        }
      },
    );
  }
}
