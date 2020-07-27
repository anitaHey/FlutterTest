import 'package:flutter/material.dart';
import 'package:flutterapp/page/search/search_page.dart';
import 'package:flutterapp/page/favorite/favorite_page.dart';
import 'package:flutterapp/page/account/account_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: BottomNavigationController(),
      ),
    );
  }
}

class BottomNavigationController extends StatefulWidget {
  BottomNavigationController({Key key}) : super(key: key);

  @override
  _BottomNavigationControllerState createState() =>
      _BottomNavigationControllerState();
}

class _BottomNavigationControllerState
    extends State<BottomNavigationController> {
  int _currentIndex = 0;
  final pages = [SearchPage(), FavoritePage(), AccountPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: <BottomNavigationBarItem> [
          BottomNavigationBarItem(icon: Icon(Icons.search), title: Text('景點搜尋')),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), title: Text('收藏')),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), title: Text('個人資料')),
        ],
        fixedColor: Colors.blueAccent,
        onTap: _onItemClick,
      ),
    );
  }

  void _onItemClick(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
