import 'package:f_list_data/quote.dart';
import 'package:flutter/material.dart';

class QuoteCard extends StatelessWidget {
  final Quote quote;
  //final void Function()? delete;
  final VoidCallback delete;
  QuoteCard({required this.quote, required this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 30),
      //color: Colors.blueAccent[100],
      clipBehavior: Clip.antiAlias, //rouded border
      elevation: 20,
      shadowColor: Colors.amber,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12)
        )
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black45,Colors.cyan.shade300],
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
          )
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                quote.author,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.red
                ),
              ),
              Text(
                quote.content,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              ElevatedButton.icon(onPressed: delete, icon:  Icon(Icons.delete), label: Text('delete')),
            ],
          ),
        ),
      ),
    );
  }
}
