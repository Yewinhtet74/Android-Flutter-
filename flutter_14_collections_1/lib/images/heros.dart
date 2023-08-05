import 'package:flutter/material.dart';

class Heros extends StatefulWidget {
  const Heros({super.key});

  @override
  State<Heros> createState() => _HerosState();
}

class _HerosState extends State<Heros> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Wrap(
          direction: Axis.horizontal,
          children: [
            Column(
              children: [
                Tooltip(message: 'Clik Next to see',
                verticalOffset: 70,
                height: 50,
                child: Hero(tag: 'img', child: Image.asset('assets/bp.png',width: 200,))),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>SecScreens(name: 'assets/bp.png',tags: 'img',)));
                }, child: Text('Next')),
              ],
            ),
            Column(
              children: [
                Tooltip(message: 'Clik bellow',child: Hero(tag: 'img2', child: Image.asset('assets/bp.jpg',width: 200,))),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>SecScreens(name: 'assets/bp.jpg',tags: 'img2',)));
                }, child: Text('Next')),
              ],
            ),
            Column(
              children: [
                Tooltip(message: 'Clik me',child: Hero(tag: 'img3', child: Image.asset('assets/bp3.png',width: 200,))),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>SecScreens(name: 'assets/bp3.png',tags: 'img3',)));
                }, child: Text('Next')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SecScreens extends StatefulWidget {
  final String name;
  final String tags;
  const SecScreens({super.key,required this.name, required this.tags});

  @override
  State<SecScreens> createState() => _SecScreensState(name,tags);
}

class _SecScreensState extends State<SecScreens> {
  final String name;
  final String tags;
  _SecScreensState( this.name, this.tags);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(tag: tags, child: Image.asset(name,)),
            Text(name),
          ],
        ),
      ),
    );
  }
}