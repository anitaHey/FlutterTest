import 'package:flutter/material.dart';
import 'package:flutterapp/data/place_data.dart';
import 'package:flutterapp/data/user_data.dart';

// Page which will display viewpoint detail.
// Add the collect feature, and can classify the collections.
class PlaceDetail extends StatefulWidget {
  int placeId;
  PlaceDetail({Key key, this.placeId}) : super(key: key);

  @override
  _PlaceDetailState createState() => new _PlaceDetailState(placeId);
}

class _PlaceDetailState extends State<PlaceDetail> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  List<PlaceItem> listItems = PlaceItems.getInstance().listItems;
  User currentUser = Users.getInstance().listUser.elementAt(0);
  PlaceItem current_place;
  int place_id;

  _PlaceDetailState(int placeId) {
    place_id = placeId;
    current_place = listItems.elementAt(placeId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text(current_place.title),
      ),
      body: Center(
        child: IconButton(
          icon: place_favorite(),
          onPressed: () {
            bool tem = currentUser.favorite.containsKey(place_id);
            if (!tem) {
              add_favorite(context);
            } else {
              setState(() {
                currentUser.favorite.remove(place_id);
              });
              final snackBar = new SnackBar(content: new Text("已經景點從收藏中移除"));
              _scaffoldKey.currentState.showSnackBar(snackBar);
            }
          },
        ),
      ),
    );
  }

  // Change icon when user click it to favorite.
  Widget place_favorite() {
    return (currentUser.favorite.containsKey(place_id))
        ? Icon(
            Icons.favorite,
            color: Colors.red,
          )
        : Icon(
            Icons.favorite_border,
            color: Colors.grey,
          );
  }

  Future<void> add_favorite(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('加入收藏'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              FlatButton(
                child: Text("直接收藏"),
                onPressed: () {
                  setState(() {
                    currentUser.favorite[place_id] = "-1";
                  });
                  Navigator.of(context).pop();
                  final snackBar = new SnackBar(content: new Text("已將景點加入收藏中"));
                  _scaffoldKey.currentState.showSnackBar(snackBar);
                },
              ),
              for (var folder in currentUser.favorite_folder)
                FlatButton(
                  child: Text(folder),
                  onPressed: () {
                    setState(() {
                      currentUser.favorite[place_id] = folder;
                    });
                    Navigator.of(context).pop();
                    final snackBar = new SnackBar(
                        content: new Text("已將景點加入 '$folder' 收藏資料夾中"));
                    _scaffoldKey.currentState.showSnackBar(snackBar);
                  },
                ),
              FlatButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.add, color: Colors.blue),
                    Text("建立收藏分類", style: TextStyle(color: Colors.blue)),
                  ],
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  add_folder(context);
                },
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('確定'),
              onPressed: () {
                setState(() {
                  currentUser.favorite[place_id] = "-1";
                });
                Navigator.of(context).pop();
                final snackBar = new SnackBar(content: new Text("已將景點加入收藏中"));
                _scaffoldKey.currentState.showSnackBar(snackBar);
              },
            ),
          ],
        );
      },
    );
  }

  // Add a folder to collection.
  Future<void> add_folder(BuildContext context) {
    final TextEditingController folderController = new TextEditingController();

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('建立收藏分類'),
          content: Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: folderController,
              decoration: InputDecoration(hintText: '請輸入分類名稱'),
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('確定'),
              onPressed: () {
                String new_folder = folderController.text;
                setState(() {
                  currentUser.favorite_folder.add(new_folder);
                  currentUser.favorite[place_id] = new_folder;
                });
                Navigator.of(context).pop();
                final snackBar = new SnackBar(
                    content: new Text("已將景點加入 '$new_folder' 收藏資料夾中"));
                _scaffoldKey.currentState.showSnackBar(snackBar);
              },
            ),
          ],
        );
      },
    );
  }
}
