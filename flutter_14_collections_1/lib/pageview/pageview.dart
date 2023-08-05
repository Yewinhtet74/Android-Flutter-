
import 'package:flutter/material.dart';
import 'package:flutter_14_collections_1/pageview/pages.dart';

class PageViews extends StatefulWidget {
  const PageViews({super.key});

  @override
  State<PageViews> createState() => _PageViewsState();
}

class _PageViewsState extends State<PageViews> {
  final _controller=PageController(
    initialPage: 1
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        scrollDirection: Axis.vertical,
        children: [
          PageView1(color: Colors.red,img:'assets/bp.png'),
          PageView1(color: Colors.green,img:'assets/bp1.png'),
          PageView1(color: Colors.black,img:'assets/bp2.png'),
          PageView1(color: Colors.white,img:'assets/bp3.png'),
          PageView1(color: Colors.pink,img:'assets/bp4.png'),
          PageView1(color: Colors.black,img:'assets/bp5.png'),
          PageView1(color: Colors.white,img:'assets/bp6.png'),
          PageView1(color: Colors.pink,img:'assets/bp7.png')
        ],
      ),
    );
  }
}