import 'package:flutter/material.dart';

class PostSquare extends StatelessWidget {
final String title;
  PostSquare({required this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              height: 200,
              color: Colors.black26,
              child: Center(
                child:Text(title,
                style: TextStyle(fontSize: 30),) ,
              ) ,
            ),
          );
  }
}

class StoryCircle extends StatelessWidget {
  final String title;
  StoryCircle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.pinkAccent),
                child: Center(child: Text(title, style: TextStyle(fontSize: 20),),) ,
              ),
            );
  }
}