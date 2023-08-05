
import 'package:flutter/material.dart';

class PageView1 extends StatefulWidget {
  Color color;
  String img;
  PageView1({super.key,required this.color,required this.img});

  @override
  State<PageView1> createState() => _PageView1State(color,img);
}

class _PageView1State extends State<PageView1> {
  Color color;
  String img;
  _PageView1State(this.color,this.img);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(img),
            fit: BoxFit.contain
          )
        ),
      ),
    );
  }
}