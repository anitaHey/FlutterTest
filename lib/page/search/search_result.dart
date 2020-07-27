import 'package:flutter/material.dart';
import 'package:flutterapp/data/place_data.dart';
import 'package:flutterapp/card_style.dart';

class SearchResult extends StatefulWidget {
  SearchResult({Key key}) : super(key: key);

  @override
  _SearchResultState createState() => new _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  PlaceItems place_instance = PlaceItems.getInstance();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Column(
        children: <Widget>[
          for (var item in place_instance.listItems)
            CardStyle(item.id),
        ],
      ),
    );
  }
}
