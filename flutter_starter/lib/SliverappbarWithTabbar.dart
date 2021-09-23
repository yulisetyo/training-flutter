// ignore_for_file: prefer_const_constructors_in_immutables, file_names, prefer_const_constructors, duplicate_ignore, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class SliverappbarWithTabbar extends StatefulWidget {
  @override
  _SliverappbarWithTabbarState createState() => _SliverappbarWithTabbarState();
}

class _SliverappbarWithTabbarState extends State<SliverappbarWithTabbar> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return SafeArea(
      child: Scaffold(
        body: DefaultTabController(
          length: 3,
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  pinned: false,
                  expandedHeight: 250.0,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text(
                      'Technologies',
                      textScaleFactor: 1,
                    ),
                    background: Image.asset(
                      'assets/images/image_1.jpg',
                      fit: BoxFit.cover,
                    ),
                    stretchModes: [StretchMode.zoomBackground],
                  ),
                ),
                SliverPersistentHeader(
                  delegate: MySliverPersistentHeaderDelegate(
                    TabBar(
                      tabs: [
                        Tab(
                          icon: Icon(Icons.home),
                        ),
                        Tab(
                          icon: Icon(Icons.contact_mail),
                        ),
                        Tab(
                          icon: Icon(Icons.games),
                        ),
                      ],
                    ),
                  ),
                  pinned: true,
                ),
              ];
            },
            body: TabBarView(
              children: [
                Icon(
                  Icons.home,
                  size: 150.0,
                ),
                Icon(
                  Icons.contact_mail,
                  size: 150.0,
                ),
                Icon(
                  Icons.games,
                  size: 150.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  MySliverPersistentHeaderDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: _tabBar,
    );
  }

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
