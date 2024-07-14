import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/api/model/news_response/news.dart';

class NewsItemWidget extends StatelessWidget {
  News news;

  NewsItemWidget({required this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(22)),
            child: CachedNetworkImage(
              imageUrl: news.urlToImage ?? '',
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4),
            child: Text(
              news.title ?? ' ',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 12),
            ),
          ),
          Text(
            news.description ?? ' ',
            style: TextStyle(fontSize: 12),
          ),
          Container(
              alignment: Alignment.bottomRight,
              child: Text(
                news.publishedAt ?? '',
                style: TextStyle(fontSize: 12, color: Colors.grey),
                textAlign: TextAlign.right,
              ))
        ],
      ),
    );
  }
}
