import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterstarter/provider/HomeProvider.dart';
import 'package:flutterstarter/views/BaseView.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with SingleTickerProviderStateMixin {
  int _currentIndex = 1;
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
                  label: 'Alumni',
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.book),
                    label: 'Course'
                )
              ],
            ),
          body: SafeArea(
            child: TabBarView(
              controller: _tabController,
            ),
          ),
        );
      },
    );
  }
}
