import 'package:burc_rehberi/burc_liste.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Burç Rehberi",
      theme: ThemeData(
        primarySwatch: Colors.pink
      ),
      home: BurcListesi(),
    );
  }
}
