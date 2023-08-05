import 'package:flutter/material.dart';

class DateTimePicker extends StatefulWidget {
  const DateTimePicker({super.key});

  @override
  State<DateTimePicker> createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  DateTime _datetime=DateTime.now();
  void _datePicker(){
    showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(DateTime.now().year-10), 
      lastDate: DateTime(DateTime.now().year+10)).then((value) {
        print(value);
        setState(() {
          _datetime=DateTime(value!.year,value!.month,value!.day,_datetime.hour,_datetime.minute,_datetime.second);
        });
      });
  }
  void _timePicker(){
    showTimePicker(context: context, initialTime: TimeOfDay.now()).then((value) => setState(() {
      _datetime=DateTime(_datetime.year,_datetime.month,_datetime.day,value!.hour,value!.minute,0);
    },));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(_datetime.year.toString()+'-'+_datetime.month.toString()+'-'+_datetime.day.toString(),
              style: TextStyle(
                fontSize: 30
              ),
            ),
            Text(_datetime.hour.toString()+':'+_datetime.minute.toString()+':'+_datetime.second.toString(),
              style: TextStyle(
                fontSize: 30
              ),
            ),
            ElevatedButton(
              onPressed: _datePicker,
              child: Text('Date Picker'),
            ),
            ElevatedButton(
              onPressed: _timePicker,
              child: Text('Time Picker'),
            ),
          ],
        ),
      ),
    );
  }
}