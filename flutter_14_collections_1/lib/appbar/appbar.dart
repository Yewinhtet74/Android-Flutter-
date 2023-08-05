import 'package:flutter/material.dart';

class Appbar extends StatefulWidget {
  const Appbar({super.key});

  @override
  State<Appbar> createState() => AppbarState();
}

class AppbarState extends State<Appbar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.update)),
        title: Text('A P P B A R'),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.access_alarm)),
          IconButton(onPressed: (){}, icon: Icon(Icons.dangerous)),
          IconButton(onPressed: (){}, icon: Icon(Icons.vape_free_outlined)),
          IconButton(onPressed: (){}, icon: Icon(Icons.one_x_mobiledata)),
          IconButton(onPressed: (){}, icon: Icon(Icons.vape_free_outlined)),
        ]
      ),
      body: Center(child: Text('HI APP BAR'),),
    );
  }
}