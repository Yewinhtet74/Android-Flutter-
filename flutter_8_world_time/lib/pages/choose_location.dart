import 'package:flutter/material.dart';
import 'package:h_world_time/services/world_locations.dart';
import 'package:h_world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> world_times=[];
  List<WorldTime> wt_search=[];
  bool loading=true;
  
   void getLocations()async{
    List<WorldTime> wts=await getLocation();
    setState(() {
      world_times=wts;
      wt_search=wts;
      loading=false;
    });
    // wts.forEach((wt)async {
    //   await wt.getTime();
    //   print(wt.time+wt.url);
    // },);
  }

  void updateTime(index)async{
    await world_times[index].getTime();
    //print(world_times[index].time);
    Navigator.pop(context,world_times[index]);
    // Navigator.pushReplacementNamed(context, '/home',arguments: world_times[index]);
  }

  void Searching(val){
    print(val);
    List<WorldTime> tem_world_times=[];
    wt_search.forEach((ele) {
      if(ele.location.toLowerCase().contains(val.toString().toLowerCase())){
        tem_world_times.add(ele);
      }
    },);
    setState(() {
      world_times=tem_world_times;
    });
  }
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocations();
    print('location done');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        title: Text('Choose Location'),
        centerTitle: true,
        actions: [
          
        ],
      ),
      body: loading?
        Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitDualRing(
              color: Colors.blueGrey,
              size: 70.0,
            ),
            SizedBox(height: 30,),
            Text('Loading...'),
          ],
        )):
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextField(
                    onChanged: (value) => Searching(value),
                    decoration: InputDecoration(
                      // border: OutlineInputBorder(),
                      // labelText: 'HI',
                      hintText: 'Enter Location',
                      suffixIcon: Icon(Icons.search),
                      contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 10)
                    ),
                
              ),
            ),
            Expanded(
              child: world_times.length==0?
                Column(
                  children: [
                    Expanded(
                      child: Center(child:Text('Location Not Found',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      )),
                    ),
                    SizedBox(height: 350,)
                  ],
                ): 
                ListView.builder(
                itemCount: world_times.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      tileColor: Colors.blue[50],
                      title: Text(world_times[index].location),
                      onTap: () {
                        updateTime(index);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
    );
  }
}