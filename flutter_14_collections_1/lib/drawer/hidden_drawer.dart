import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({super.key});

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      initPositionSelected: 0,
      screens: [
        ScreenHiddenDrawer(
          ItemHiddenMenu(name: 'Home', baseStyle: TextStyle(), selectedStyle: TextStyle(),colorLineSelected: Colors.black),
          Scaffold(body: Center(child: Text('Hello Home'),),),
        ),
        ScreenHiddenDrawer(
          ItemHiddenMenu(name: 'Contact', baseStyle: TextStyle(), selectedStyle: TextStyle(),colorLineSelected: Colors.black),
          Scaffold(body: Center(child: Text('Hello Contact'),),)
        ),
        ScreenHiddenDrawer(
          ItemHiddenMenu(name: 'Setting', baseStyle: TextStyle(), selectedStyle: TextStyle(),colorLineSelected: Colors.deepPurple),
          Scaffold(body: Center(child: Text('Hello Setting'),),)
        ),
      ], 
      backgroundColorMenu: Colors.pinkAccent.shade200,
      slidePercent:50,
      contentCornerRadius: 20,
      );
  }
}