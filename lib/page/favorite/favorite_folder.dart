import 'package:flutter/material.dart';
import 'package:flutterapp/card_style.dart';
import 'package:flutterapp/data/user_data.dart';

// Folder create in collection when user add the classify folder.
class FavoriteFolder extends StatelessWidget {
  User currentUser = Users.getInstance().listUser.elementAt(0);
  String folder_name;
  FavoriteFolder(this.folder_name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(folder_name),
        ),
        body: Column(
          children: <Widget>[
            for (var place_key in currentUser.favorite.keys)
              if (currentUser.favorite[place_key] == folder_name)
                CardStyle(place_key),
          ],
        ),
    );
  }
}