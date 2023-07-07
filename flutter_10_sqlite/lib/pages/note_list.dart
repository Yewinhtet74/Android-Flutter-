import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_10_sqlite/databases/database_connection.dart';
import 'package:flutter_10_sqlite/databases/notes_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  List notes=[];
  List<Color> _colors=[Color(0xFFFF0000),Color(0xFFFF2A00),Color(0xFFFF5B00),Color(0xFFFFC600),Color(0xFFFFC600),
                      Color(0xFFC6FF00),Color(0xFFC6FF00),Color(0xFF90FF00),Color(0xFF002AFF),Color(0xFF2AFF00),
                      Color(0xFF00FF00),Color(0xFF00FF2A),Color(0xFF00FF5B),Color(0xFF00FF90),Color(0xFF00FFC6),
                      Color(0xFF00FFFF),Color(0xFF00C6FF),Color(0xFF0090FF),Color(0xFF005BFF),Color(0xFF002AFF002AFF),
                      Color.fromARGB(255, 2, 31, 176), Color.fromARGB(255, 2, 25, 142),Color.fromARGB(255, 1, 16, 89),Colors.black,Colors.black54,
                      Colors.black45,Colors.black38,Colors.black26,Colors.black12,Colors.grey.shade200];

  void show()async{
    print('reach');
    DatabaseConnection dbs=DatabaseConnection();
    // // dbs.insertTest();
    // Note note=Note('title',1,);
    // dbs.deleteAll();
    // await dbs.insertNote(note);
    // await dbs.insertNote(note);
    notes=await dbs.getAllNote();
    print('done');
    setState(() {
      
    });
  }
   Future _deleteNote(BuildContext context, Note note)async{
    DatabaseConnection dbs=DatabaseConnection();
    int res=await dbs.deleteNote(note);
    res==0? _showSnackBar(context,'Fail delete note'):_showSnackBar(context, 'Delete successfully');
    show();
  }
  void _showSnackBar(BuildContext context,String sms){
    final snackbar=SnackBar(content: Text(sms));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
  AlertDialog _alertDialog (context,index){
    return AlertDialog(
                title: Text('Delete A Note ?',style: TextStyle(color: Colors.red),),
                content: Text('Once you delete your node, it can\'t be recover.'),
                contentPadding: EdgeInsets.all(40),
                actions: [
                  TextButton(onPressed: (){
                    Navigator.pop(context);
                  }, child: Text('Cancle')),
                  TextButton(onPressed: (){
                     _deleteNote(context,notes[index]);
                    Navigator.pop(context);
                  }, child: Text('Delete',style: TextStyle(color: Colors.red)))
                ],
              );
  }
  @override
  void initState() {
    // TODO: implement initState
    // show();
  }
  @override
  Widget build(BuildContext context) {
    if(notes.length==0){
    notes= ModalRoute.of(context)!.settings.arguments as List;
    }
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Color.fromARGB(100, 70, 194, 103),
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/paper3.jpg'),fit: BoxFit.fill)),
        child: notes.length==0? 
        Center(child: Text('No Notes'),)
        :ListView.builder(itemCount: notes.length,itemBuilder: (content,index){
        return Card(child: Dismissible(
          key: ValueKey(notes[index].id),
          background: Container(color: Colors.greenAccent,child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.delete_forever_sharp,color: Colors.white,),
                Text('Delete Note',style: TextStyle(color: Colors.white),),
              ],
            ),
          ),),
          secondaryBackground: Container(color: Colors.red[400],child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.delete_forever_sharp,color: Colors.white,),
                Text('Delete Note',style: TextStyle(color: Colors.white),),
              ],
            ),
          ),),
          onDismissed: (direction) {
            // setState(() {
              
            // });
          },
          confirmDismiss: (direction) async{
            if(direction==DismissDirection.startToEnd){ 
              await Navigator.pushNamed(context, '/detail',arguments: notes[index]);
              show();
            }else{
              return showDialog(context: context, builder: (context)=>_alertDialog(context, index));
            }
          },
          child: ListTile(
            onTap: () async {
              await Navigator.pushNamed(context, '/detail',arguments: notes[index]);
              show();
            },
            leading: CircleAvatar(
              backgroundColor: _colors[notes[index].priority-1],
              child: Center(child: Text(notes[index].priority.toString(),style: TextStyle(color:Colors.white))),
            ),
            title: Text(notes[index].title,
              style: TextStyle(fontSize: 20),
            ),
            subtitle: Text(notes[index].description==null?'':notes[index].description!,
              style: TextStyle(color: const Color.fromARGB(255, 108, 108, 108)),
            ),
            trailing: GestureDetector(
              // onTap:() => _deleteNote(content,notes[index]),
              onTap: () => showDialog(context: context, builder: (context)=>_alertDialog(context, index),
              barrierDismissible: true,
              ),
              child: Icon(Icons.delete,color: Colors.redAccent,),
            ),
          ),
        ),);
      }),) ,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(1000,10, 140, 44),
        foregroundColor: Colors.white,
        onPressed: ()async{
          await Navigator.pushNamed(context,'/detail');
          show();
        },
        tooltip: 'Add Note',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
