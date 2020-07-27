import 'package:flutter/material.dart';
import 'package:flutterapp/data/place_data.dart';
import 'package:flutterapp/card_style.dart';
import 'package:flutterapp/data/user_data.dart';
import 'package:flutterapp/page/favorite/favorite_folder.dart';

class FavoritePage extends StatefulWidget {
  FavoritePage({Key key}) : super(key: key);

  @override
  _FavoritePageState createState() => new _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  PlaceItems place_instance = PlaceItems.getInstance();
  User currentUser = Users.getInstance().listUser.elementAt(0);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          AppBar(centerTitle: true, title: Text("收藏")),
          Column(
            children: <Widget>[
              for (var folder in currentUser.favorite_folder)
                createFolder(folder),
              for (var place_key in currentUser.favorite.keys)
                if (currentUser.favorite[place_key] == "-1")
                  CardStyle(place_key),
            ],
          ),
        ],
      ),
    );
  }

  Widget createFolder(folder) {
    return Padding(
      padding: EdgeInsets.only(right: 15, left: 15, top: 5, bottom: 5),
      child: SizedBox(
      width: double.infinity,
      child: FlatButton(
        child: Row(
          children: <Widget>[
            Icon(Icons.folder, color: Colors.black26),
            SizedBox(
              width: 10,
            ),
            Text(folder, style: TextStyle(color: Colors.black87)),
          ],
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FavoriteFolder(folder)),
          );
        },
      ),
    ),
    );
  }
}
