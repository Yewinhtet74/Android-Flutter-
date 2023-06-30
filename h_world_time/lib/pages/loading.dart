import 'package:flutter/material.dart';
import 'package:h_world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getTime() async{
    WorldTime wt=WorldTime(location: 'Asia/Yangon', flag: 'Asia/Yangon', url: 'Asia/Yangon');
    await wt.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: wt);
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTime();
    print('done');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitFadingCircle(
              color: Colors.blue,
              size: 70.0,
            ),
            SizedBox(height: 30,),
            Text('Loading...')
          ],
        ),
      ),
    );
  }
}