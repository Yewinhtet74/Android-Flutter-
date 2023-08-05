import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> _widges=[];
  @override
  void initState() {
    _widges=[
    ElevatedButton(onPressed: (){
    Navigator.pushNamed(context, '/test');
    }, child: Text('Test')),
    ElevatedButton(onPressed: (){Navigator.pushNamed(context, '/appbar');}, child: Text('App Bar')),
    ElevatedButton(onPressed: (){Navigator.pushNamed(context, '/drawer');}, child: Text('Drawer')),
    ElevatedButton(onPressed: (){Navigator.pushNamed(context, '/hiddendrawer');}, child: Text('Hidden Drawer')),
    ElevatedButton(onPressed: (){Navigator.pushNamed(context, '/sliverappbar');}, child: Text('Sliver Appbar')),
    ElevatedButton(onPressed: (){Navigator.pushNamed(context, '/tabbar');}, child: Text('Tab Bar')),
    ElevatedButton(onPressed: (){Navigator.pushNamed(context, '/timer');}, child: Text('Timer')),
    ElevatedButton(onPressed: (){Navigator.pushNamed(context, '/pageview');}, child: Text('PageView')),
    ElevatedButton(onPressed: (){Navigator.pushNamed(context, '/input');}, child: Text('Input')),
    ElevatedButton(onPressed: (){Navigator.pushNamed(context, '/ani_icon');}, child: Text('Animated Icon')),
    ElevatedButton(onPressed: (){Navigator.pushNamed(context, '/date_time');}, child: Text('Date & Time Picker')),
    ElevatedButton(onPressed: (){Navigator.pushNamed(context, '/listwheel');}, child: Text('List Wheel Scroll View')),
    ElevatedButton(onPressed: (){Navigator.pushNamed(context, '/reorderable');}, child: Text('Reorderable List View')),
    ElevatedButton(onPressed: (){Navigator.pushNamed(context, '/fadeinimage');}, child: Text('Fade In Image')),
    ElevatedButton(onPressed: (){Navigator.pushNamed(context, '/hero');}, child: Text('Hero')),
    ElevatedButton(onPressed: (){Navigator.pushNamed(context, '/aboutdialog');}, child: Text('About Dialog')),
    Row()
  ];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: ListView.builder(itemCount: _widges.length,itemBuilder: (context,index){return _widges[index];}),
        )
      ),
    );
  }
}