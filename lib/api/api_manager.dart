import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api/model/news_response/NewsResponse.dart';
import 'package:news_app/api/model/sources_response/SourcesResponse.dart';

class ApiManager {
  static const String baseUrl = 'newsapi.org';
  static const String apiKey = 'be69a84c535c43928fdad67c7cd21548';

  static Future<SourcesResponse> getSources(String categoryId) async {
    var url = Uri.http(baseUrl, '/v2/top-headlines/sources', {
      'apiKey': apiKey,
      'category': categoryId,
    });
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
    return sourcesResponse;
  }

  static Future<NewsResponse> getNews(String sourceId,
      {String? searchText}) async {
    //GET https://newsapi.org/v2/top-headlines?country=us&apiKey=be69a84c535c43928fdad67c7cd21548

    var url = Uri.https(baseUrl, '/v2/everything', {
      'apiKey': apiKey,
      'sources': sourceId,
      'searchIn': searchText,
    });
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    NewsResponse newsResponse = NewsResponse.fromJson(json);
    return newsResponse;
  }
}

//https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY
