import 'package:flutter/material.dart';

class Tabbar extends StatefulWidget {
  const Tabbar({super.key});

  @override
  State<Tabbar> createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3,child: Scaffold(
      appBar: AppBar(
        title: Text('Tab Bar'),
        backgroundColor: Colors.blueGrey,
        bottom: TabBar(
          tabs:[
            Tab(child: Icon(Icons.home_repair_service)),
            Tab(child: Icon(Icons.abc)),
            Tab(child: Icon(Icons.ac_unit_sharp)),
          ],
          indicatorColor: Colors.black87,
          labelColor: Colors.amber,
          unselectedLabelColor: Colors.black87,
        ),
      ),
      body: TabBarView(children: [
        Container(child: Center(child: Text('home'),),),
        Container(child: Center(child: Text('contact'),),),
        Container(child: Center(child: Text('service'),),),
      ])
    ));
  }
}