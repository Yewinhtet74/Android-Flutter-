import 'package:flutter/material.dart';
import 'package:flutter_15_terise_game/home.dart';
import 'package:flutter_15_terise_game/values.dart';
import 'package:flutter_15_terise_game/database_connection.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int? highscore;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // callDB();
    getHighScore();
  }

  void getHighScore()async{
    List ans=await _getAll();
    print(ans);
    if(ans.length>0){
    Map scores=ans[0];
    setState(() {
      highscore=scores['score'];
    });
    }
  }

  // void callDB()async{
    
  //   _insertScore(120);
  //   // _insertScore(1500);
  //   print('HERE');
  //   List ans=await _getAll();
  //   print(ans);
  //   Map scores=ans[0];
  //   _updateScore(12345,scores['id']);
  //   ans=await _getAll();
  //   print(ans);
  // }
  Future<List> _getAll()async{
  DatabaseConnection dbs=DatabaseConnection();
  // dbs.deleteAll();
  List res=await dbs.getAll();
  return res;
  }
  @override
  Widget build(BuildContext context) {
    getHighScore();
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black87,
          image: DecorationImage(image: AssetImage('assets/bg.jpeg',),fit: BoxFit.cover,opacity:0.8)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Teris Game',
                style: TextStyle(fontSize: 50,color: TetrominoColor[Tetromino.I]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('High Score ',style: TextStyle(fontSize: 35,color: Colors.white60)),
                  Text(highscore==null?'0':highscore.toString(),style: TextStyle(fontSize: 40,color: TetrominoColor[Tetromino.Z]))
                ],),
              ElevatedButton(onPressed: ()async{
                await Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHome(boardSize: BoardSize.small,)));
                getHighScore();
              }, child: Text('Easy',style: TextStyle(fontSize: 20,color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: TetrominoColor[Tetromino.L],
                  padding: EdgeInsets.symmetric(horizontal: 50,vertical: 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7))
                ),
              ),
              ElevatedButton(onPressed: ()async{
                await Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHome(boardSize: BoardSize.mediun,)));
                getHighScore();
              }, child: Text('Mediun',style: TextStyle(fontSize: 20,color: Colors.grey.shade900),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: TetrominoColor[Tetromino.O],
                  padding: EdgeInsets.symmetric(horizontal: 50,vertical: 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7))
                ),
              ),
              ElevatedButton(onPressed: ()async{
                await Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHome(boardSize: BoardSize.hard,)));
                getHighScore();
              }, child: Text('Hard',style: TextStyle(fontSize: 20,color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: TetrominoColor[Tetromino.Z],
                  padding: EdgeInsets.symmetric(horizontal: 50,vertical: 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7))
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}