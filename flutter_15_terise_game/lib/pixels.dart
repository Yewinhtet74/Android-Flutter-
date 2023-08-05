import 'package:flutter/material.dart';

class Pixels extends StatelessWidget {
  int index;
  Color color;
  Pixels({super.key,required this.index, required this.color});

  @override
  Widget build(BuildContext context) {
    // if(color==Colors.red)print('RED');
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        // child: Text(index.toString(),style: TextStyle(color: Colors.grey[800]),),
        decoration: BoxDecoration(
          color:  color,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: Color.fromARGB(25,0,0,0))
        ),
      ),
    );
  }
}