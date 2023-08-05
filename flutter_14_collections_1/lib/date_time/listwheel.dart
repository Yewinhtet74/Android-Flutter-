import 'package:flutter/material.dart';

class ListWheels extends StatefulWidget {
  const ListWheels({super.key});

  @override
  State<ListWheels> createState() => _ListWheelsState();
}

class _ListWheelsState extends State<ListWheels> {
  int hour=1;
  int minute=0;
  String time='AM';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Container(
                  child: Text(hour.toString()+' : '+minute.toString().padLeft(2,'0')+'  '+time,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.pink.shade100
                    ),
                  ),
              ),
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      color: Colors.grey[800],
                      height: 80,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: ListWheelScrollView.useDelegate(
                          itemExtent: 80, 
                          perspective: 0.01,
                          diameterRatio: 2,
                          physics: FixedExtentScrollPhysics(),
                          onSelectedItemChanged: (value) {setState(() {
                            hour=value+1;
                          });},
                          childDelegate: ListWheelChildBuilderDelegate(
                            childCount: 12,
                            builder: ((context, index) {
                              return Container(
                                // color: Colors.pink,
                                child: Text((index+1).toString(),
                                    style: TextStyle(fontSize: 80,
                                      color: hour==index+1?Colors.white:Colors.white54
                                    ),
                                  ),
                              );
                            })
                          )
                        ),
                      ),
                      Text(':',style: TextStyle(fontSize: 80),),
                      Expanded(
                        child: ListWheelScrollView.useDelegate(
                          itemExtent: 80, 
                          perspective: 0.01,
                          diameterRatio: 2,
                          physics: FixedExtentScrollPhysics(),
                          onSelectedItemChanged: (value) {
                            setState(() {
                              minute=value;
                            });
                          },
                          childDelegate: ListWheelChildBuilderDelegate(
                            childCount: 60,
                            builder: ((context, index) {
                              return Container(
                                // color: Colors.pink,
                                child: Text(index.toString().padLeft(2,'0'),
                                    style: TextStyle(fontSize: 80,
                                      color: minute==index?Colors.white:Colors.white54
                                    ),
                                  ),
                              );
                            })
                          )
                        ),
                      ),
                      Text(' ',style: TextStyle(fontSize: 80),),
                      Expanded(
                        child: ListWheelScrollView(
                          itemExtent: 80, 
                          perspective: 0.01,
                          diameterRatio: 2,
                          physics: FixedExtentScrollPhysics(),
                          onSelectedItemChanged: (value) {setState(() {
                            time=value==1?'PM':'AM';
                          });},
                          children: [
                            Container(
                                // color: Colors.pink,
                                child: Text('AM',
                                    style: TextStyle(fontSize: 80,
                                      color: time=='AM'?Colors.white:Colors.white54
                                    ),
                                  ),
                            ),
                            Container(
                                // color: Colors.pink,
                                child: Text('PM',
                                    style: TextStyle(fontSize: 80,
                                      color: time=='PM'?Colors.white:Colors.white54
                                    ),
                                  ),
                            ),
                              
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}