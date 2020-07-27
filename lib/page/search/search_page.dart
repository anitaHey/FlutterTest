import 'package:flutter/material.dart';
import 'package:flutterapp/page/search/search_result.dart';
import 'package:flutterapp/page/search/search_delegate.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => new _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: <Widget>[
      SliverAppBar(
        pinned: true,
        title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(width: 32.0, height: 0.0),
              Text('景點搜尋'), // 2nd wrap your widget in Center
              IconButton(
                  icon: new Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: (){
                    showSearch(context: context, delegate: SearchPageDelegate());
                  })
            ]),
        centerTitle: true,
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return SearchResult();
          },
          childCount: 1,
        ),
      ),
    ]);
  }
}
