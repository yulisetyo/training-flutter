// ignore_for_file: file_names, avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget> [
          // menu -menu yang ditampilkan
          _drawerHeader(),
          _drawerItem(
            icon: Icons.folder,
            text: 'MyFolder',
            onTap: () => print('Tap on MyFolder'),
          ),
          _drawerItem(
            icon: Icons.groups_outlined,
            text: 'Shared Itmes',
            onTap: () => print('Tap on Shared Items'),
          ),
          _drawerItem(
            icon: Icons.access_time_outlined,
            text: 'Recent Items',
            onTap: () => print('Tap on Recent Items'),
          ),
          _drawerItem(
            icon: Icons.delete,
            text: 'Deleted Item',
            //onTap: () => print('Tap on Deleted Item'),
            onTap: () {
              Navigator.pushNamed(context, '/about');
            }
          ),
        ],
      ),
    );
  }
}

Widget _drawerHeader() {
  return UserAccountsDrawerHeader(
    decoration: BoxDecoration(
      image: const DecorationImage(
        image: AssetImage('./assets/images/image_1.jpg'),
        fit: BoxFit.cover,
      ), 
    ),
    accountName: Text('Yuli'), 
    accountEmail: Text('yuli.setyo@gmail.com'),
    currentAccountPicture: ClipOval(
      child: Image(
        image: AssetImage('./assets/images/user_1.png'),
        fit: BoxFit.cover,
      ),
    ),
    // ignore: prefer_const_literals_to_create_immutables
    otherAccountsPictures: [
      ClipOval(
        child: Image(
          image: AssetImage('./assets/images/user_2.png'),
          fit: BoxFit.cover,
        )
      ),
      ClipOval(
        child: Image(
          image: AssetImage('./assets/images/user_x.jpg'),
          fit: BoxFit.cover,
        )
      ),
    ],
  );
}

Widget _drawerItem({IconData? icon, String? text, GestureTapCallback? onTap}) {
  return ListTile(
    title: Row(
      children: <Widget> [
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: Text(
            text!, 
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
    onTap: onTap,
  );
}

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Page'),
      ),
      body: Center(
        child: Row(
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Back to HomePage'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/contact');
              },
              child: Text('Tap to ContactPage'),
            ),
          ],
        ),
      ),
    );
  }
}