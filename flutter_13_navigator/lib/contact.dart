import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  int _count=0;
  void action_btn(){
    setState(() {
      _count++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('$_count'),
          ElevatedButton(onPressed: action_btn, child: Text('Tap'))
        ],
      )),
    );
  }
}