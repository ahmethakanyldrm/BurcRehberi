import 'package:burc_rehberi/burc_liste.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'models/burc.dart';

class BurcDetay extends StatefulWidget {
  int gelenIndex;

  BurcDetay(this.gelenIndex);

  @override
  _BurcDetayState createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  Burc secilenBurc;
  Color baskinRenk;
  PaletteGenerator paletteGenerator;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    secilenBurc = BurcListesi.tumBurclar[widget.gelenIndex];
    baskinRengiBul();
  }
  void baskinRengiBul(){
    Future<PaletteGenerator> fPaletGenerator =
    PaletteGenerator.fromImageProvider(
        AssetImage("images/" + secilenBurc.burcBuyukResim));
    fPaletGenerator.then((value) {
      paletteGenerator = value;
      setState(() {
        baskinRenk=paletteGenerator.vibrantColor.color;
      });
      //paletteGenerator.dominantColor.color;
    });
  }


  @override
  Widget build(BuildContext context) {




    return Scaffold(
      primary: true,
      body: CustomScrollView(
        primary: true,
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            //  primary: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "images/" + secilenBurc.burcBuyukResim,
                fit: BoxFit.cover,
              ),
            ),
            centerTitle: true,
            backgroundColor: baskinRenk!=null? baskinRenk : Colors.pink,
            title: Text(secilenBurc.burcAdi + " Burcu ve Özellikleri"),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(8.0),
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: SingleChildScrollView(
                child: Text(
                  secilenBurc.burcDetayi,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
