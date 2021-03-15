import 'package:burc_rehberi/burc_detay.dart';
import 'package:burc_rehberi/burc_liste.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     // initialRoute: "/burcListesi",
      routes: {
        "/": (context)=>BurcListesi(),
        "/burcListesi": (context)=>BurcListesi(),
       // "/burcDetay/123" :(context)=>BurcDetay(1),
      },
      onGenerateRoute: (RouteSettings settings){
        List<String>pathElemanlari=settings.name.split("/"); // /burcDetay/1
        if(pathElemanlari[1]=="burcDetay"){
          return MaterialPageRoute(builder: (context)=>BurcDetay(int.parse(pathElemanlari[2])));
        }
        return null;
      },
      title: "Burç Rehberi",
      theme: ThemeData(
        primarySwatch: Colors.pink
      ),
     // home: BurcListesi(),
    );
  }
}
