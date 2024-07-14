import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/api/model/news_response/news.dart';

class NewsDetailsViewModel extends Cubit<NewsDetailsState> {
  NewsDetailsViewModel() : super(LoadingState(message: 'Loading...'));

  void loadNews(String sourceId) async {
    emit(LoadingState(message: 'Loading...'));
    try {
      var response = await ApiManager.getNews(sourceId);
      if (response.status == 'error') {
        emit(ErrorState(errorMessage: response.message));
      } else {
        emit(SuccessState(newsList: response.articles));
      }
    } catch (e) {
      emit(ErrorState(errorMessage: e.toString()));
    }
  }
}

sealed class NewsDetailsState {}

class LoadingState extends NewsDetailsState {
  String message;

  LoadingState({required this.message});
}

class ErrorState extends NewsDetailsState {
  String? errorMessage;

  ErrorState({this.errorMessage});
}

class SuccessState extends NewsDetailsState {
  List<News>? newsList;

  SuccessState({this.newsList});
}
