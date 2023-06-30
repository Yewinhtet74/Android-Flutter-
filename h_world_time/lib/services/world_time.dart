
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location;
  String time='';
  String flag;
  String url;
  bool dayTime=true;

  WorldTime({required this.location, required this.flag,required this.url});

  Future<void> getTime() async{
    try{
      Response response=await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
      Map data=jsonDecode(response.body);
      DateTime now=DateTime.parse(data['utc_datetime']);
      String offset=data['utc_offset'];
      now=now.add(Duration(hours: int.parse(offset.substring(1,3)),minutes: int.parse(offset.substring(4,))));
      // print(now);
      dayTime=now.hour>6 && now.hour<18 ? true : false;
      //return now.toString();
      time=DateFormat.jm().format(now);
    }catch (e){
      //return 'Could not get time.';
      print(e);
      time=e.toString();
      // time='Could not get time.';
    }
  }
}