// ignore_for_file: prefer_const_constructors, unused_import, use_key_in_widget_constructors, unnecessary_new

import 'package:flutter/material.dart';
import './nav-drawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard Demo',
      home: NavigationDrawerDemo(),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/about': (context) => AboutPage(),
      }
    );
  }
}

class NavigationDrawerDemo extends StatefulWidget {

  @override
  _NavigationDrawerDemoState createState() => _NavigationDrawerDemoState();
}

class _NavigationDrawerDemoState extends State<NavigationDrawerDemo> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => _scaffoldKey.currentState!.openDrawer(),
          icon: Icon(Icons.menu),
        ),
        title: Text('Dashboard Demo'),
        actions: <Widget>[
          IconButton(
            onPressed: () => _scaffoldKey.currentState!.openEndDrawer(),
            icon: Icon(Icons.menu),
          ),
        ],
      ),
      drawer: DrawerWidget(),
      endDrawer: DrawerWidget(),
    );
  }
}