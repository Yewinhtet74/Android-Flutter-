import 'dart:math';

import 'package:flutter_15_terise_game/values.dart';
import 'package:flutter/material.dart';

class Pieces{
  Tetromino? type;
  List<int> position=[];
  int rotate=0;
  int row=10,column=15;
  Map<Tetromino,List> rme={};
  BoardSize boardSize;
  Pieces({required this.boardSize,required this.row,required this.column}){
    
  rme={
    Tetromino.L:[
        [-1,0,1,row-1],
        [row,0,-row,-row-1],
        [-1,0,1,-row+1],
        [-row,0,row,row+1]
      ],
      Tetromino.J:[
        [1,0,-1,-row-1],
        [row,0,-row,-row+1],
        [-1,0,1,row+1],
        [-row,0,row,row-1]
      ],
      Tetromino.I:[
        [1,0,-1,-2],
        [row,0,-row,-2*row]
      ],
      Tetromino.O:[[1,0,row,row+1]],
      Tetromino.S:[
        [-row,0,1,row+1],
        [1,0,row,row-1],
        [row,0,-1,-row-1],
        [-1,0,-row,-row+1]
      ],
      Tetromino.Z:[
        [row,0,1,-row+1],
        [-1,0,row,row+1],
        [-row,0,-1,row-1],
        [1,0,-row,-row-1]
      ],
      Tetromino.T:[
        [-1,0,1,row],
        [-row,0,-1,row],
        [-row,0,-1,1],
        [-row,0,1,row]
      ]
  };
    newRandomPiece();
    }
  void init_piece(){
    int mid=(row/2).floor()-1-2*row;
    // position=rme[type]![0];
    switch(type){
      case Tetromino.L:position=[mid-row,mid,mid+row,mid+row+1];break;
      case Tetromino.J:position=[mid+1-row,mid+1,mid+row,mid+1+row];break;
      case Tetromino.I:position=[mid+row,mid,mid-row,mid-2*row];break;
      case Tetromino.O:position=[mid,mid+1,mid+row,mid+row+1];break;
      case Tetromino.S:position=[mid-1,mid,mid-row,mid-row+1];break;
      case Tetromino.Z:position=[mid-row-1,mid,mid-row,mid+1];break;
      case Tetromino.T:position=[mid-row,mid,mid+1,mid+row];break;
      default:
    }
  } 

  void movePiece(AxisDirection direction){
    switch(direction){
      case AxisDirection.down:
      // print('Before'+position.toString());
        for(int i=0;i<position.length;i++){
          position[i]+=row;
        }
      // print('After'+position.toString());
        break;
      case AxisDirection.left:
        for(int i=0;i<position.length;i++){
          position[i]--;
        }
        break;
        case AxisDirection.right:
        for(int i=0;i<position.length;i++){
          position[i]++;
        }
        break;

      default:
    }

  }

  void newRandomPiece(){
    switch(boardSize){
      case BoardSize.small:
        type=Tetromino.values[Random().nextInt(3)<2?Random().nextInt(2):Random().nextInt(Tetromino.values.length)];break;
      case BoardSize.hard:
        type=Tetromino.values[Random().nextInt(3)<2?Random().nextInt(Tetromino.values.length-2)+2:Random().nextInt(Tetromino.values.length)];break;
      default:
        type=Tetromino.values[Random().nextInt(Tetromino.values.length)];break;
    }
    
    // type=Tetromino.O;
    init_piece();
    rotate=0;
    for(int i=0;i<Random().nextInt(4);i++){
      rotatePiece([]);
    }
  }


  void rotatePiece(List gameboard){
    if(rme[type]!.length>1){
    List<int>newPos=List.of(rme[type]![rotate]);
    print('start'+rotate.toString());
    print(newPos);
    for(int i=0;i<newPos.length;i++){
      newPos[i]+=position[1];
    }
    print(newPos);
    rotate=(rotate+1)%(rme[type]!.length);
    if(checkVaildRotate(newPos,gameboard))  position=newPos;
    print('end'+rotate.toString());

    }
  }
bool checkVaildRotate(List<int> list, List gamboard){
  List list2=[];
  for(int i=0;i<list.length;i++){
    if(list[i]>=0 && list[i]<gamboard.length && gamboard[list[i]]!=null) return false; 
    list2.add(list[i]%row);
  }
  if(list2.contains(0) && list2.contains(row-1)) return false;
  
  return true;
}
}
