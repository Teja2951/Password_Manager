import 'package:flutter/material.dart';

class Tile extends StatelessWidget{
  final String name;
  final String p;
  Tile({super.key, required this.name, required this.p});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(name),
          Text(p),
        ],
      ),
    );
  }
}