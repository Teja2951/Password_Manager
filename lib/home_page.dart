import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_demo/database.dart';
import 'package:hive_demo/show_data.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  
  //final _myTeja = Hive.box('Teja');
  
  final _meraData = Hive.box('meraList');
  Database db = Database();

  
  void initState() {
    super.initState();

    if(_meraData.get('meraList') == null){
      db.initializeData();
    }else{
      db.loadData();
    }
  }


  final _controller = TextEditingController();
  final _controller2 = TextEditingController(); 

  //String inputText = 'abcd';

  void addData(String S,String Z) {
    setState(() {
      //db.inputText += S;
      db.pswd.add([
        S,Z
      ]);
    });
    _controller.clear();
    _controller2.clear();
    db.storeData();
  }

  void deleteData() {
    setState(() {
      //db.inputText = '';
      db.pswd = [];
    });
    db.storeData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(controller: _controller,),
            TextField(controller: _controller2),
            MaterialButton(onPressed: () => addData(_controller.text,_controller2.text),child: Text("Add Data"),),
            MaterialButton(onPressed: deleteData,child: Text('Delete Data'),),
            MaterialButton(onPressed: () => Navigator.push(context,MaterialPageRoute(
              builder: (context)=> 
              ShowData(
                //data: db.inputText,
                pswd: db.pswd,
              )
              )
              ),
            child: Text('Show Data'),),
          ],
        ),
      ),
    );
  }
}