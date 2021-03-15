

import 'package:burc_rehberi/utils/strings.dart';
import 'package:flutter/material.dart';

import 'models/burc.dart';

class BurcListesi extends StatelessWidget {
 static List<Burc> tumBurclar;

  @override
  Widget build(BuildContext context) {
    tumBurclar = veriKaynaginiHazirla();
    return Scaffold(
      appBar: AppBar(
        title: Text("Burç Rehberi"),
      ),
      body: listeyiHazirla(),
    );
  }

  List<Burc> veriKaynaginiHazirla() {
    List<Burc> burclar = [];
    for (int i = 0; i < 12; i++) {
      String kucukResim = Strings.BURC_ADLARI[i].toLowerCase() + "${i + 1}.png";
      String buyukResim =
          Strings.BURC_ADLARI[i].toLowerCase() + "_buyuk" + "${i + 1}.png";

      Burc eklenecekBurc = Burc(
          Strings.BURC_ADLARI[i],
          Strings.BURC_TARIHLERI[i],
          Strings.BURC_GENEL_OZELLIKLERI[i],
          kucukResim,
          buyukResim);
      burclar.add(eklenecekBurc);
    }
    return burclar;
  }

  Widget listeyiHazirla() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return tekSatirBurcWidget(context, index);
      },
      itemCount: tumBurclar.length,
    );
  }

  Widget tekSatirBurcWidget(BuildContext context, int index) {
    Burc oanListeyeEklenenBurc = tumBurclar[index];
    return Card(
      elevation: 4,
      child: Padding(
        padding:  EdgeInsets.all(8.0),
        child: ListTile(
          onTap:(){
            Navigator.pushNamed(context, "/burcDetay/$index");
          } ,
          leading: Image.asset(
            "images/" + oanListeyeEklenenBurc.burcKucukResim,
            width: 64,
            height: 64,
          ),
          title: Text(
            oanListeyeEklenenBurc.burcAdi,
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: Colors.pink.shade500),
          ),
          subtitle:  Padding(
            padding:  EdgeInsets.symmetric(vertical: 8),
            child: Text(
              oanListeyeEklenenBurc.burcTarihi,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Colors.black38),
            ),
          ),
          trailing: Icon(Icons.arrow_forward_ios,color: Colors.pink,),
        ),
      ),
    );
  }
}
