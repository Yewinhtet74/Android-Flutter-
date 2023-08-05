
import 'package:flutter/material.dart';
import 'package:h_world_time/services/world_time.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  WorldTime wt=WorldTime(location: '', flag: '', url: '');

  List<String> spr_str(String ss){
  var sp=ss.lastIndexOf('/');
    return[ss.substring(0,sp),ss.substring(sp+1)];
  }
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print('reach home');
  }
  @override
  Widget build(BuildContext context) {
    wt = wt.url==''? ModalRoute.of(context)!.settings.arguments as WorldTime : wt;
    // print('build home');
    // print(wt?.time);
    String img=wt.dayTime ? 'assets/day.jpg':'assets/night.jpg';
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('$img'),
            fit: BoxFit.cover,
          )
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 150),
          child: Column(
            children: [
              ElevatedButton.icon(
                style: ButtonStyle(padding:  MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 25,vertical: 10))),
                onPressed: () async{
                  WorldTime res=await Navigator.pushNamed(context, '/choose_loc') as WorldTime;
                  setState(() {
                    // print('In state');
                    // print(res.time);
                    wt=res;
                    // print(wt.time);
                  });
                },
                // onPressed: () {
                //   Navigator.pushNamed(context, '/choose_loc');
                // },
                icon: Icon(Icons.edit_location_sharp), 
                label: Text('Edit location',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(height: 120.0,),
              Text(spr_str(wt.location)[0],
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: wt.dayTime? Colors.black:Colors.white,
                ),
              ),
              Text(spr_str(wt.location)[1],
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: wt.dayTime? Colors.black:Colors.white,
                ),
              ),
              Text(wt.time,
                style: TextStyle(
                  fontSize: 70,
                  color: wt.dayTime? Colors.black:Colors.white,
                ),
              ),
              Row(),
            ],
          ),
        ),
      ),
    );
  }
}