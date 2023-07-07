import 'package:flutter/material.dart';
import 'package:flutter_10_sqlite/databases/database_connection.dart';
import 'package:flutter_10_sqlite/databases/notes_model.dart';

class NoteDetail extends StatefulWidget {
  const NoteDetail({super.key});

  @override
  State<NoteDetail> createState() => _NoteDetailState();
}

class _NoteDetailState extends State<NoteDetail> {

  List<int> _pri=[];
  Note note=Note('', 1);
  TextEditingController txt1=TextEditingController();
  TextEditingController txt2=TextEditingController();
  Future<int> _insertNote()async{
  DatabaseConnection dbs=DatabaseConnection();
  int res=await dbs.insertNote(note);
  return res;
  }Future<int> _updateNote()async{
  DatabaseConnection dbs=DatabaseConnection();
  int res=await dbs.updateNote(note);
  return res;
  }
  void _showSnackBar(BuildContext context,String sms){
    final snackbar=SnackBar(content: Text(sms));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
  @override
  void initState() { 
    for(int i=1;i<31;i++){
      _pri.add(i);
    }
  }
  @override
  Widget build(BuildContext context) {
   
    if(ModalRoute.of(context)!.settings.arguments!=null){
      note=ModalRoute.of(context)!.settings.arguments as Note;
      txt1.text=note.title;
      if(note.description!=null)txt2.text=note.description!;
    }
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Color.fromARGB(100, 70, 194, 103),
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Edit Note'),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/paper5.jpg'),fit: BoxFit.fill)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              ListTile(
                title: DropdownButton(
                  items: _pri.map((e) => DropdownMenuItem(child: Text('Priority - $e'),value: e)).toList(), 
                  value:note.priority,
                  onChanged: (e){
                    note.priority=e!;
                    setState(() {
                      if(note.title!='')txt1.text=note.title;
                      if(note.description!=null) txt2.text=note.description!;
                    });
                  }),
              ),
              TextField(
                onChanged: (value) => note.title=value.trim(),
                controller: txt1,
                decoration: InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                minLines: 5,
                maxLines: 10,
                onChanged: (value) => note.description=value,
                controller: txt2,
                decoration: InputDecoration(
                  labelText: 'Description',
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                ),
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(
                    child: note.id==null? ElevatedButton(onPressed: ()async{
                      print(note.toString());
                      if(note.title==''){
                        _showSnackBar(context, 'Title should not be empty');
                      }
                      else{
                        int ii=await _insertNote();
                        if(ii!=0){
                          Navigator.pop(context);
                        }else{
                          print('dbs $ii');
                        }
                      }
                      // Navigator.pop(context);
                    }, child: Text('Save'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.all(15)
                      ),
                    )
                    :ElevatedButton(onPressed: ()async{
                      print(note.toString());
                      if(note.title==''){
                        _showSnackBar(context, 'Title should not be empty');
                      }
                      else{
                        int ii=await _updateNote();
                        if(ii!=0){
                          Navigator.pop(context);
                        }else{
                          print('dbs $ii');
                        }
                      }
                      // Navigator.pop(context);
                    }, child: Text('Update'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.all(15)
                      ),
                    ),
                  ),
                  SizedBox(width: 7,),
                  Expanded(
                    child: ElevatedButton(onPressed: (){
                      Navigator.pop(context);
                    }, child: Text('Cancle'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[600],
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.all(15)
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}