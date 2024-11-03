import 'package:hive/hive.dart';

class Database {

  final _myTeja = Hive.box('meraList');
  //String inputText = '';
  List pswd = [];

  void initializeData() {
    //inputText = 'default';
    pswd = [['google','12']];
  }

  void loadData() {
    //inputText = _myTeja.get('myDairy');
    pswd = _myTeja.get('meraList');
  }

  void storeData() {
    //_myTeja.put('myDairy', inputText);
    _myTeja.put('meraList', pswd);
  }

  // String getData() {
  //   return _myTeja.get('myDairy');
  // }
  
}