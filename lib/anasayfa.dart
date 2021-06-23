
import 'package:flutter/material.dart';
import 'package:kullanicikayit/hakkinda.dart';

class AnaSayfa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('ANASAYFA'),
      ),
      body: Center(
        child: Container(
          color: Colors.teal,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage('assets/images/selcuk.jpg',),
                   // backgroundColor: Colors.white,
                  )),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  color: Colors.indigoAccent,
                  child: new GestureDetector(
                    child: new Text('RESMİ İNDİRMEK İÇİN TEK TIKLAYIN', style: TextStyle(fontSize: 20.0),),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                          new SnackBar(content: new Text('RESİM İNDİRİLİYOR..', style: TextStyle(fontSize: 20.0),)));
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  color: Colors.indigoAccent,
                  child: new GestureDetector(
                    child: new Text('BEĞENMEK İÇİN ÇİFT TIKLAYINIZ', style: TextStyle(fontSize: 20.0),),
                    onDoubleTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                          new SnackBar(content: new Text('RESMİ BEĞENDİNİZ <3', style: TextStyle(fontSize: 20.0),)));
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  color: Colors.indigoAccent,
                  child: new GestureDetector(
                    child: new Text('DÖNDÜRMEK İCİN BASILI TUTUNUZ', style: TextStyle(fontSize: 20.0),),
                    onTapUp: (a) {
                      ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                          content: new Text(a.toString() + ' RESİM DÖNDÜRÜLEMEDİ', style: TextStyle(fontSize: 20.0),)));
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  color: Colors.indigoAccent,
                  child: new GestureDetector(
                    child: new Text('TIKLADIĞINIZDA RESİM DEĞİŞSİN', style: TextStyle(fontSize: 20.0),),
                    onTapDown: (a) {
                      ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                          content: new Text(a.toString() + ' RESİM DEĞİŞTİRİLEMEDİ', style: TextStyle(fontSize: 20.0),)));
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  color: Colors.indigoAccent,
                  child: new GestureDetector(
                    child: new Text('YAKINLAŞTIRMAK İÇİN UZUN BASINIZ', style: TextStyle(fontSize: 20.0),),
                    onLongPress: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                          new SnackBar(content: new Text('FOTOĞRAF YAKINLAŞTIRILIYOR..', style: TextStyle(fontSize: 20.0),)));
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                     MaterialPageRoute(builder: (context) => Hakkinda()),
                    );
                  },
                  child: Text('HAKKINDA', style: TextStyle(fontSize: 20.0),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}