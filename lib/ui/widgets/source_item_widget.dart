import 'package:flutter/material.dart';
import 'package:news_app/api/model/sources_response/Source.dart';

class SourceItemWidget extends StatelessWidget {
  Source source;
  bool isSelected;

  SourceItemWidget({required this.source, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      decoration: BoxDecoration(
          color: isSelected ? Colors.green : Colors.transparent,
          borderRadius: BorderRadius.circular(26),
          border: Border.all(
              color: isSelected ? Colors.transparent : Colors.green, width: 2)),
      child: Text(
        source.name ?? '',
        style: TextStyle(color: isSelected ? Colors.white : Colors.green),
      ),
    );
  }
}
