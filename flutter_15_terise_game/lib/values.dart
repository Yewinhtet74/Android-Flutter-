import 'package:flutter/material.dart';

// int row=15;
// int column=20;

enum Tetromino{
  L,J,I,O,S,Z,T
}

Map<Tetromino,Color> TetrominoColor={
  Tetromino.L:Color.fromARGB(255, 0,30,255),
  Tetromino.J:Color(0xFF9D00FF),
  Tetromino.I:Color.fromARGB(255, 251,255,255),
  Tetromino.O:Color.fromARGB(255,116,238,21),
  Tetromino.Z:Color.fromARGB(255,240,0,255),
  Tetromino.S:Color.fromARGB(255,77,238,234),
  Tetromino.T:Color.fromARGB(255,255,231,0),
};

enum BoardSize{
  small,mediun,hard
}

Map<BoardSize,List> BoardSizeValue={
  BoardSize.small:[10,15],
  BoardSize.mediun:[15,20],
  BoardSize.hard:[20,25]
};
Map<BoardSize,int> BoardSizeSpeed={
  BoardSize.small:700,
  BoardSize.mediun:500,
  BoardSize.hard:300
};