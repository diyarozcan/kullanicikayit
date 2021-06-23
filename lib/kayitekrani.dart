import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kullanicikayit/anasayfa.dart';

class KayitEkrani extends StatefulWidget {
  @override
  _KayitEkraniState createState() => _KayitEkraniState();
}

class _KayitEkraniState extends State<KayitEkrani> {
  // kayıt parametreleri tutucular
  late String email, sifre;

  var _formAnahtari = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("KULLANICI GİRİŞ"),
        centerTitle: true,
      ),
      body: Form(
        key: _formAnahtari,
        child: Container(
          padding: EdgeInsets.all(12.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                  onChanged: (alinanMail) {
                    setState(() {
                      email = alinanMail;
                    });
                  },
                  validator: (alinanMail){
                    return alinanMail!.contains("@")? null : "Mail geçersiz";
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Email Girin..",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  onChanged: (alinanSifre) {
                    sifre = alinanSifre;
                  },
                  validator: (alinanSifre){
                    return alinanSifre!.length >= 6 ? null : "En az 6 karakter";
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Şifre Girin..",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      kayitEkle();
                    },
                    child: Text("Kayıt ol"),
                    style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    )),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                      onTap: () {

                      }, child: Text("Zaten hesabım var...")),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void kayitEkle() {
    if (_formAnahtari.currentState!.validate())
      {
        FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: sifre).then((user){
         Navigator.push(context, MaterialPageRoute(builder: (_)=>AnaSayfa()));
        }).catchError((hata){
           Fluttertoast.showToast(msg: hata);
        });
      }
  }
}
