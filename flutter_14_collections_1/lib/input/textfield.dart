import 'package:flutter/material.dart';

class TextFields extends StatefulWidget {
  const TextFields({super.key});

  @override
  State<TextFields> createState() => _TextFieldsState();
}

class _TextFieldsState extends State<TextFields> {
  String txt='';
  TextEditingController _txtController = TextEditingController();
  TextEditingController _txtController2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(txt),
            TextField(
              controller: _txtController,
              decoration: InputDecoration(
                hintText: 'Your Name',
                border: OutlineInputBorder(),
                labelText: 'Name',
                suffixIcon: IconButton(onPressed: (){
                  _txtController.clear();
                },icon: Icon(Icons.clear,)),
              ), 
            ),
            TextField(
              controller: _txtController2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Your Age',
                border: OutlineInputBorder(),
                labelText: 'Age',
                suffixIcon: IconButton(onPressed: (){
                  _txtController2.clear();
                },icon: Icon(Icons.clear,)),
              ), 
            ),
            ElevatedButton(onPressed: (){
              setState(() {
                if(_txtController.text.trim()=='' || _txtController2.text.trim()=='' ){
                  txt='Inputs should not be empty';
                }else{
                  txt='I\'m '+_txtController.text+'. \n My age is '+_txtController2.text;
                }
              });
            }, child: Text('Generate'))
          ]
        ),
      ),
    );
  }
}