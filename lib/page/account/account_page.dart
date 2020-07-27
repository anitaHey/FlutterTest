import 'package:flutter/material.dart';

// A page when user click "account" in bottomNavigationBar.
class AccountPage extends StatefulWidget {
  AccountPage({Key key}) : super(key: key);

  @override
  _AccountPageState createState() => new _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: <Widget>[
            AppBar(centerTitle: true, title: Text("個人資料")),
            Center(
              child: Text("個人資料"),
            ),
          ],
        ));
  }
}
