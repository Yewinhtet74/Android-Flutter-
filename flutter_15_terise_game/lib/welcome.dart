import 'package:flutter/material.dart';
import 'package:flutter_15_terise_game/home.dart';
import 'package:flutter_15_terise_game/values.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Welcome To Terise Game',
              style: TextStyle(fontSize: 40,color: TetrominoColor[Tetromino.I]),
            ),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHome(boardSize: BoardSize.small,)));
            }, child: Text('Easy',style: TextStyle(fontSize: 20),),
              style: ElevatedButton.styleFrom(
                backgroundColor: TetrominoColor[Tetromino.Z],
                padding: EdgeInsets.symmetric(horizontal: 50,vertical: 20)
              ),
            ),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHome(boardSize: BoardSize.mediun,)));
            }, child: Text('Mediun',style: TextStyle(fontSize: 20),),
              style: ElevatedButton.styleFrom(
                backgroundColor: TetrominoColor[Tetromino.O],
                padding: EdgeInsets.symmetric(horizontal: 50,vertical: 20)
              ),
            ),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHome(boardSize: BoardSize.hard,)));
            }, child: Text('Hard',style: TextStyle(fontSize: 20),),
              style: ElevatedButton.styleFrom(
                backgroundColor: TetrominoColor[Tetromino.L],
                padding: EdgeInsets.symmetric(horizontal: 50,vertical: 20)
              ),
            ),
          ],
        ),
      ),
    );
  }
}