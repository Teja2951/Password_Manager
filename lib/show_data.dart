import 'package:flutter/material.dart';
import 'package:hive_demo/pswd_tile.dart';

class ShowData extends StatefulWidget{
  final List pswd;
  //final String data;

  ShowData({
    super.key,
    //required this.data,
    required this.pswd,
    });

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemCount: widget.pswd.length,
          itemBuilder: (context,index) {
            return Tile(
              name: widget.pswd[index][0],
              p: widget.pswd[index][1],
            );
          },
        ),
      ),
    );
  }
}