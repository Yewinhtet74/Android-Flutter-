import'package:flutter/material.dart';

class Reorderables extends StatefulWidget {
  const Reorderables({super.key});

  @override
  State<Reorderables> createState() => _ReorderablesState();
}

class _ReorderablesState extends State<Reorderables> {

  List mytile=[0,1,2,3,4,5,6];

  void _reorderstate(int oldIn,int newIn){
    setState(() {
      if(oldIn<newIn)newIn--;
    final a =mytile.removeAt(oldIn);
    print(mytile[0]);
    mytile.insert(newIn, a);
    print(mytile);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ReorderableListView(
          header: Center(child: Text('header')),
          children: [
            for(final i in mytile)
              Padding(
                  key: Key(i.toString()),
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(i.toString()),
                  tileColor: Colors.grey.shade800,
                ),
              )
          ],
          onReorder: _reorderstate,
        ),
      ),
    );
  }
}