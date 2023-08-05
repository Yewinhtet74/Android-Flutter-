import 'package:flutter/material.dart';
import 'package:flutter_14_collections_1/test/test.dart';

class DrawerW extends StatefulWidget {
  const DrawerW({super.key});

  @override
  State<DrawerW> createState() => _DrawerWState();
}

class _DrawerWState extends State<DrawerW> {
  int _selected=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawerEnableOpenDragGesture: false,
      appBar: AppBar(),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {setState(() {
              _selected=0;Navigator.pop(context);
            }); }, child: Text('Home')),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: () {setState(() {
              _selected=1;Navigator.pop(context);
            }); }, child: Text('Contact')),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){Navigator.pop(context);}, child: Text('Close '))
          ],
        ),
      ),
      body: Center(child: [Builder(builder:(context) {
        return ElevatedButton(child: Text('open drawer'),onPressed: (){Scaffold.of(context).openDrawer();},);
      },),
        Text('Contact')
      ][_selected]
      ),
    );
  }
}