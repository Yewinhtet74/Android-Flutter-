import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: '123',
    home: Home(),

  ));
}

class  Home extends StatefulWidget {
  const Home ({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _count=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello '),
        centerTitle: true,
        backgroundColor: Colors.red[600],
      ),
      backgroundColor: Colors.red[200],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CircleAvatar(
              backgroundColor: Colors.amber[900],
              backgroundImage: AssetImage('assets/bp.png'),
              radius: 80.0,
            ),
            Divider(
              height: 10.0,
              thickness: 5,
              color: Colors.black45,
              indent: 10,
              endIndent: 20,
            ),
            Text('$_count'),
            Myname(name:'name2'),
            SizedBox(height: 8.0,),
            Myname( name:'Hi'),
            
            Icon(
              Icons.cabin,
              color: Colors.amber,
              size: 50.0,
            ),
            ElevatedButton(
              onPressed: (){print('Thank u');}, 
              child: Text('Click'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber
              ),
            ),
            ElevatedButton.icon(onPressed: (){print('OK thank u');}, icon: Icon(Icons.bluetooth_audio), label: Text('HI'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),),
            IconButton(onPressed: (){print('HAHA');}, icon: Icon(Icons.hail_outlined)),
            OutlinedButton(onPressed: (){}, child: Text('Outline'),
            style: OutlinedButton.styleFrom(side: BorderSide(width: 5,color: Colors.blue)),),
            TextButton(onPressed: (){}, child: Text('TEXT'))
        ],),
        
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            _count+=1;
          });
        },
        child: Text('add',
          style: TextStyle(
            color: Colors.black,
            fontStyle: FontStyle.italic,
          ),
        ),
        backgroundColor: Colors.red[400],

      ),
    );
  }
}

class Myname extends StatelessWidget {
  final String name;
   const Myname({super.key,required this.name});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
            decoration:BoxDecoration(color: Colors.blueGrey),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(name),
            
            ),
          );
  }
}