import 'package:flutter/material.dart';
import 'package:flutter_10_sqlite/databases/database_connection.dart';
import 'package:flutter_10_sqlite/databases/notes_model.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getData() async{
    DatabaseConnection dbs=DatabaseConnection();
    List notes=await dbs.getAllNote();
    Navigator.pushReplacementNamed(context, '/home',arguments: notes);
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    // print('done');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration:BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/paper2.jpg'),fit: BoxFit.fill),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SpinKitWaveSpinner(
                color: Colors.blue,
                size: 70.0,
              ),
              SizedBox(height: 30,),
              Text('Loading...')
            ],
          ),
        ),
      ),
    );
  }
}