import 'dart:async';

import 'package:flutter/material.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  int _time=5;
  TextEditingController txt1=TextEditingController();
  void _start(){
    Timer.periodic(Duration(seconds: 1), (timer) {
      if(_time>0){
        _time--;
    txt1.text=_time.toString();
      }else{
        timer.cancel();
      }
      
     });
  }
  @override
  void initState() {
    // TODO: implement initState
    txt1.text=_time.toString();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 90),
            child: TextField(
              onChanged: (value) => _time=int.parse(value),
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 60),
              textAlign: TextAlign.center,
              controller: txt1,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Colors.grey.shade100,
                    filled: true,
                  ),
            ),
          ),
          ElevatedButton(onPressed: _start, child: Text('START')),
          Row()
        ],
      ),
    );
  }
}