import 'package:flutter/material.dart';
import 'package:flutterapp/data/place_data.dart';
import 'package:flutterapp/card_style.dart';

// SearchDelegate when user click the search icon.
class SearchPageDelegate extends SearchDelegate {
  List<PlaceItem> listItems = PlaceItems.getInstance().listItems;
  List<int> suggestList = new List<int>();

  @override
  ThemeData appBarTheme(BuildContext context) => Theme.of(context);

  @override
  List<Widget> buildActions(BuildContext context) {
    return[
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          suggestList.clear();
          query = '';
        }
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: (){
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return SingleChildScrollView(
      child: new Column(
        children: <Widget>[
          for (var num in suggestList)
            CardStyle(listItems.elementAt(num).id),
        ],
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    suggestList.clear();
    for (int i = 0; i < listItems.length; i++) {
      String title = listItems.elementAt(i).title;
      String subtitle = listItems.elementAt(i).subtitle;
      if (query.length>0 && (title.toLowerCase().contains(query.toLowerCase()) || subtitle.toLowerCase().contains(query.toLowerCase())) ){
        suggestList.add(i);
      }
    }

    return SingleChildScrollView(
      child: new Column(
        children: <Widget>[
          for (var num in suggestList)
            CardStyle(listItems.elementAt(num).id),
        ],
      ),
    );
  }
}