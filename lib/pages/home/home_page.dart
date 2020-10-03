/* 
Add bottom navigation bar with four tabs.
1. Deals
2. Explore
3. Cart
4. Profile

And link with respective page. Add routes in main.dart
 */


import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
    );
  }
}
