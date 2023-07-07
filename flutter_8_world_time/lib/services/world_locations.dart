import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:h_world_time/services/world_time.dart';

Future<List<WorldTime>> getLocation() async{
  try{
      Response response=await get(Uri.parse("http://worldtimeapi.org/api/timezone"));
      var data=jsonDecode(response.body);
      List<WorldTime> wts = [];
      data.forEach((ele) => 
        wts.add(WorldTime(location: ele.toString().replaceAll('_', ' '), flag: ele, url: ele))
    );
    return wts;
    }catch (e){
      return [];
    }
}