import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_15_terise_game/pieces.dart';
import 'package:flutter_15_terise_game/values.dart';
import 'package:flutter_15_terise_game/pixels.dart';
import 'package:flutter_15_terise_game/welcome.dart';

class MyHome extends StatefulWidget {
  BoardSize boardSize;
  MyHome({super.key, required this.boardSize});

  @override
  State<MyHome> createState() => _MyHomeState(row:BoardSizeValue[boardSize]![0],column:BoardSizeValue[boardSize]![1],speed: BoardSizeSpeed[boardSize]!);
}

class _MyHomeState extends State<MyHome> with SingleTickerProviderStateMixin{
  int row;int column;
  int speed;
  int _score=0;
  Pieces currentPiece=Pieces(row: 10,column: 15);
  List<Color?> gameboard=[],gameboard2=[];
  Timer? timer,downbtn;
  AnimationController? _iconController;
  List last_tetromino=[];
  String? _info;

  _MyHomeState({required this.row,required this.column, required this.speed});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _iconController=AnimationController(vsync: this,duration: Duration(seconds: 1));
    currentPiece=Pieces(row: row, column: column);
    gameboard=List.generate((row*column), (i) => null);
    _startGame();
    giveInfo('Game Start',2500);
  }

  void giveInfo(String ss,int milli){
    setState(() {
      _info=ss;
    });
    if(milli!=0){
      Future.delayed(Duration(milliseconds: milli)).then((value){setState(() {
        _info=null;
      });});
    }
  }

  void _startGame(){
    Duration framerate=Duration(milliseconds: speed);
    gameloop(framerate);
  }
  void gameloop(Duration framerate){
    timer =Timer.periodic(framerate, (timer) { 
      if(!checkLanding()){
        setState(() {
          currentPiece.movePiece(AxisDirection.down);
        });
      }else{

      }
    });
  }
  bool checkCollision(AxisDirection direction){
    switch(direction){
      case AxisDirection.down:
        for(int i=0;i<currentPiece.position.length;i++){
          if(currentPiece.position[i]>=row*(column-1))return true;
        } break;
      case AxisDirection.left:
        for(int i=0;i<currentPiece.position.length;i++){
          if(currentPiece.position[i]%row<1)return true;
        } break;
      case AxisDirection.right:
        for(int i=0;i<currentPiece.position.length;i++){
          if(currentPiece.position[i]%row>row-2)return true;
        } break;
      default: return false;
    }
    return false;
  }
  bool checkGameboard(AxisDirection direction){
    for(int i=0;i<currentPiece.position.length;i++){
      if(direction==AxisDirection.down && (currentPiece.position[i]+row>=0 && currentPiece.position[i]+row<row*column && gameboard[currentPiece.position[i]+row]!=null))return true;
      else if(direction==AxisDirection.left && (currentPiece.position[i]-1>=0 && currentPiece.position[i]-1<row*column && gameboard[currentPiece.position[i]-1]!=null))return true;
      else if(direction==AxisDirection.right && (currentPiece.position[i]+1>=0 &&currentPiece.position[i]+1<row*column && gameboard[currentPiece.position[i]+1]!=null))return true;
    }
    return false;
  }
  bool checkLanding(){
    if(checkCollision(AxisDirection.down) || checkGameboard(AxisDirection.down)){
      int plus_count=0;
      currentPiece.position.forEach((element) { 
        if(element>=0 && element<row*column){
          gameboard[element]=getTetrominoColor(currentPiece.type!);
          plus_count++;
        }
       });
       checkFillLine();

       print('landed');
       if(downbtn!=null) downbtn!.cancel();
       
       if(plus_count==0) gameOver();

       if(last_tetromino.length>1)  last_tetromino.removeAt(0);
       last_tetromino.add(currentPiece.type);
       do{
        currentPiece.newRandomPiece();

       }while(last_tetromino.contains(currentPiece.type));
       return true;
    }
    return false;
  }

  void checkFillLine(){
    int count=0;
    for(int i=0;i<row*column;i=i+row){
      bool fill=true;
      for(int j=i;j<i+row;j++){
        if(gameboard[j]==null){fill=false;break;}
      }
      print(i.toString()+' - '+(i+row-1).toString()+' '+fill.toString());
      if(fill){
        count++;
        //change color
        setState(() {
          print('OK');
        for(int z=i;z<i+row;z++){
          gameboard[z]=Color(0xFFFF5733);
        }
        });
        Future.delayed(Duration(milliseconds: 300)).then((value) => setState(() {
          print('HERE');
          for(int k=i-1;k>=0;k--){
            gameboard[k+row]=gameboard[k];
          }
          // _score+=row;
        }));
        
      }
    }
    if(count>0){
      int added=calculateScore(count);
      _score+=added;
      giveInfo('+'+added.toString(),1500);
    }
  }

  void gameOver(){
    if(timer!.isActive) timer!.cancel();
    showDialog(context: context, builder: (context)=>AlertDialog(
                title: Column(
                  children: [
                    Center(child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                      child: Text('Game Over',style: TextStyle(color: Colors.red,fontSize: 60),),
                    )),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Score ',style: TextStyle(fontSize: 50,color: Colors.white60)),
                            Text(_score.toString(),style: TextStyle(fontSize: 60,color: Colors.greenAccent.shade700))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                
                // contentPadding: EdgeInsets.all(4),
                actionsAlignment: MainAxisAlignment.spaceEvenly,
                actionsPadding: EdgeInsets.symmetric(vertical: 40),
                actions: [
                  IconButton(onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>WelcomePage()));}, icon: Icon(Icons.home_filled,size: 50,)),
                  IconButton(onPressed: (){
                    _score=0;
                    currentPiece.newRandomPiece();
                    gameboard=List.generate((row*column), (i) => null);
                    last_tetromino.clear();
                    giveInfo('Game Start',2500);
                    _startGame();
                    Navigator.pop(context);
                  }, icon: Icon(Icons.replay,size: 50,)),
                ],
    ));
  }

  int calculateScore(int line_count){
    if(line_count==1) return row;
    return line_count*row+calculateScore(line_count-1);
  }

  Color getTetrominoColor(Tetromino t){
    return TetrominoColor[t]!!;
  }
  void moveLeftOrRight(AxisDirection direction){
    if(timer!.isActive){
    if(!checkCollision(direction) && !checkGameboard(direction)){
      setState(() {
        currentPiece.movePiece(direction);
      });
    }

    }

  }
  void _rotatePiece(){
    // print('START');
    // print(currentPiece.position);
    // currentPiece.rotatePiece();
    // print(currentPiece.position);
    // currentPiece.rotatePiece();
    // print(currentPiece.position);
    // currentPiece.rotatePiece();
    // print(currentPiece.position);
    // currentPiece.rotatePiece();
    if(timer!.isActive){
    setState(() {
      currentPiece.rotatePiece(gameboard);
    });

    }
  
  }

  void play_pause(){
    if(timer!.isActive){
      timer!.cancel();print('IF');
      _iconController!.forward();
      setState(() {
        gameboard2=List.from(gameboard);
        gameboard=List.generate((row*column), (i) => null);
      });
      giveInfo('Pause', 0);
    }else{
        print('Else');_startGame();
        _iconController!.reverse();
        setState(() {
          gameboard=List.from(gameboard2);
        });
        giveInfo('Resume', 1000);
      }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer!.cancel();
    timer;
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    // row=15;column=20;
    // print(currentPiece.position);
    double height=MediaQuery.of(context).size.width/row*column;
    print('Display');
    return Scaffold(
      body: SafeArea(child: Column(
        children: [
          GestureDetector(
            onTap: _rotatePiece,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  // color: Colors.grey.shade900,
                  width: double.infinity,
                  height: height,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      border: Border(bottom: BorderSide(width: 3,color: Colors.redAccent.shade700))
                    ),
                  ),
                Container(
                  height:height,
                  child: GridView.builder(
                    itemCount: row*column,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: row),
                    itemBuilder: (context, index) => Pixels(index: index,
                      color: gameboard[index]!=null? gameboard[index]!: currentPiece.position.contains(index)?getTetrominoColor(currentPiece.type!): Colors.transparent,
                    ),
                  ),
                ),
                Text(_info==null?'':_info!,
                  style: TextStyle(fontSize: 100,color: Colors.greenAccent.shade700),
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 50,
            child: Center(
              // child: Text('Score '+_score.toString(),style: TextStyle(fontSize: 25),),
              child: RichText(text: TextSpan(
                style: TextStyle(fontSize: 25),
                children: [
                    TextSpan(text: 'Score '),
                    TextSpan(text:_score.toString(),style: TextStyle(fontSize: 30,color: Colors.greenAccent.shade700))
                  ]
              )),
            ),
          ),
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: ()=>moveLeftOrRight(AxisDirection.left),
                        onLongPress: () {
                          // print('STart');
                          downbtn=Timer.periodic(Duration(milliseconds: 10), (timer) { 
                            moveLeftOrRight(AxisDirection.left);
                          });
                        },
                        onLongPressUp: () {
                          // print('END');
                          if(downbtn!=null)downbtn!.cancel();
                        },
                        child: SizedBox(height: double.infinity,child: 
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: ElevatedButton(onPressed: ()=>moveLeftOrRight(AxisDirection.left), child: Icon(Icons.chevron_left),
                              style:ElevatedButton.styleFrom(
                                primary:Colors.grey.shade700
                              )
                            ),
                          )
                        ),
                      ),
                     ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => moveLeftOrRight(AxisDirection.right),
                        onLongPress: () {
                          // print('STart');
                          downbtn=Timer.periodic(Duration(milliseconds: 10), (timer) { 
                            moveLeftOrRight(AxisDirection.right);
                          });
                        },
                        onLongPressUp: () {
                          // print('END');
                          if(downbtn!=null)downbtn!.cancel();
                        },
                        child: SizedBox(height: double.infinity,child: 
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: ElevatedButton(onPressed: ()=> moveLeftOrRight(AxisDirection.right), child: Icon(Icons.chevron_right,),
                              style:ElevatedButton.styleFrom(
                                primary:Colors.grey.shade700
                              ),
                              
                            ),
                          )
                        ),
                      ),
                     ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: play_pause,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.black54,
                        child: CircleAvatar(
                          radius: 47,
                          backgroundColor: Colors.grey.shade700,
                          child:AnimatedIcon(icon: AnimatedIcons.pause_play, progress: _iconController!,color: Colors.white,)
                          
                          ),
                      ),
                    ),
                    GestureDetector(
                      onTap: ()=>moveLeftOrRight(AxisDirection.down),
                      onLongPress: () {
                        // print('STart');
                        downbtn=Timer.periodic(Duration(milliseconds: 10), (timer) { 
                          moveLeftOrRight(AxisDirection.down);
                        });
                      },
                      onLongPressUp: () {
                        // print('END');
                        if(downbtn!=null)downbtn!.cancel();
                      },
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.black54,
                        child: CircleAvatar(
                          radius: 47,
                          backgroundColor: Colors.grey.shade700,
                          child: Icon(Icons.arrow_downward,color: Colors.white,)
                          
                          ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ))
    );
  }
}
//                     Expanded(
//                       child: GestureDetector(
//                         onTap: ()=> moveLeftOrRight(AxisDirection.left),
//                         child: AbsorbPointer(
//                           child: Padding(
//                             padding: const EdgeInsets.all(2.0),
//                             child: Container(
//                               height: double.infinity,
//                               decoration: BoxDecoration(
//                                 color: Colors.grey.shade700
//                               ),
//                               child: IconButton(
//                                 onPressed: (){}, icon: Icon(Icons.chevron_left),
//                               )
//                             ),
//                           ),
//                         ),
//                       )
//                     ),
//                     Expanded(
//                       child: GestureDetector(
//                         onTap: ()=> moveLeftOrRight(AxisDirection.right),
//                         child: AbsorbPointer(
//                           child: Padding(
//                             padding: const EdgeInsets.all(2.0),
//                             child: Container(
//                               height: double.infinity,
//                               decoration: BoxDecoration(
//                                 color: Colors.grey.shade700
//                               ),
//                               child: IconButton(
//                                 onPressed: (){}, icon: Icon(Icons.chevron_right),
//                               )
//                             ),
//                           ),
//                         ),
//                       )
//                     ),