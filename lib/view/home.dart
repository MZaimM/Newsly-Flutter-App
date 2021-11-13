import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:newsly/view/page/business/businessNews.dart';
import 'package:newsly/view/drawer.dart';
import 'package:newsly/view/page/general/generalNews.dart';
import 'package:newsly/view/page/health/healthNews.dart';
import 'package:newsly/view/page/sport/sportNews.dart';
import 'package:newsly/view/page/technology/technologyNews.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // NewsList news = NewsList();
    // NewsHeadlines newsHeadlines = NewsHeadlines();
    Widget _bagianTabBar = TabBar(
        isScrollable: true,
        unselectedLabelColor: Colors.blue,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: Colors.blue),
        tabs: <Widget>[
          Tab(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                //border: Border.all(color: Colors.blue)
              ),
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: Text("General"),
                ),
              ),
            ),
          ),
          Tab(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                //border: Border.all(color: Colors.blue)
              ),
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: Text("Technology"),
                ),
              ),
            ),
          ),
          Tab(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                //border: Border.all(color: Colors.blue)
              ),
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: Text("Business"),
                ),
              ),
            ),
          ),
          Tab(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                //border: Border.all(color: Colors.blue)
              ),
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: Text("Health"),
                ),
              ),
            ),
          ),
          Tab(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                //border: Border.all(color: Colors.blue)
              ),
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: Text("Sport"),
                ),
              ),
            ),
          ),
        ]);

    return DefaultTabController(
        length: 5,
        child: Scaffold(
            appBar: AppBar(
              title: Center(
                  child: Text(
                'Newsly',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.blue[700]),
              )),
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(color: Colors.black),
              elevation: 0,
              bottom: PreferredSize(
                preferredSize: new Size(200.0, 52),
                child: Container(
                    margin: EdgeInsets.only(left: 16, right: 16),
                    child: _bagianTabBar),
              ),
              actions: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 0),
                  child: IconButton(
                      onPressed: () {},
                      icon: Image.asset('images/icon_user.png')),
                )
              ],
            ),
            backgroundColor: Colors.white,
            drawer: DrawerMenu(),
            body: TabBarView(
              children: <Widget>[
                GeneralNews(),
                TechnologyNews(),
                BusinessNews(),
                HealthNews(),
                SportNews()
              ],
            )));
  }
}
