import 'package:flutter/material.dart';
import 'package:flutterstarter/provider/HomeProvider.dart';
import 'package:flutterstarter/shareds/Theme.dart';
import 'package:flutterstarter/views/BaseView.dart';
import 'package:flutterstarter/views/Course.dart';
import 'package:flutterstarter/views/Home.dart';
import 'package:flutterstarter/views/ListCourse.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabSelection);
  }

  _handleTabSelection() {
    setState(() {
      _currentIndex = _tabController.index;
    });
  }


  @override
  Widget build(BuildContext context) {

    return BaseView<HomeProvider>(
      onModelReady: (model) => model.main(),
      builder: (context, provider, child) {
        return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: colorPrimary,
              onTap: (index){
                setState(() {
                  _currentIndex = index;
                  _tabController.index = index;
                });
              },
              currentIndex: _currentIndex,
              items: [
                BottomNavigationBarItem(
                  icon: new Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: new Icon(Icons.person),
                  label: 'Course',
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.book),
                    label: 'List Course'
                )
              ],
            ),
          body: SafeArea(
            child: TabBarView(
              controller: _tabController,
              children: [
                Home(),
                Course(),
                ListCourse(),
              ],
            ),
          ),
        );
      },
    );
  }
}
