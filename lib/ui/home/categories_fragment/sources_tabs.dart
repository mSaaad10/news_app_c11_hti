import 'package:flutter/material.dart';
import 'package:news_app/api/model/sources_response/Source.dart';
import 'package:news_app/ui/home/news_list_widget/news_details.dart';

import 'package:news_app/ui/widgets/source_item_widget.dart';

class SourcesTabs extends StatefulWidget {
  List<Source> sourcesList;

  SourcesTabs({required this.sourcesList});

  @override
  State<SourcesTabs> createState() => _SourcesTabsState();
}

class _SourcesTabsState extends State<SourcesTabs> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
            length: widget.sourcesList.length,
            child: TabBar(
                onTap: (index) {
                  selectedIndex = index;
                  print(selectedIndex);
                  setState(() {});
                },
                indicatorColor: Colors.transparent,
                isScrollable: true,
                tabs: widget.sourcesList
                    .map(
                      (source) => SourceItemWidget(
                          source: source,
                          isSelected: widget.sourcesList.indexOf(source) ==
                              selectedIndex),
                    )
                    .toList())),
        NewsListWidget(source: widget.sourcesList[selectedIndex]),
      ],
    );
  }
}
