import 'package:flutter/material.dart';
import 'package:joinan_final_teacher_skripsi/main.dart';
import 'package:joinan_final_teacher_skripsi/screens/pertemuanAccepted.dart';
import 'package:joinan_final_teacher_skripsi/services/signIn.dart';
//import 'package:joinan_final_teacher_skripsi/customNavBar.dart';

class Profile extends StatelessWidget {

  final String username;
  Profile({this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Joinan Teacher'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            //'anggrek@gmail.com',
            //username,
            namaUser,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  //Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => SignIn()));
                  Navigator.push(context, new MaterialPageRoute(builder: (context) => PertemuanAccepted(username: username,)));
                },
                color: Colors.blue,
                child: Text(
                  'Daftar Pertemuan',
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => SignIn()));
                },
                color: Colors.red,
                child: Text(
                  'Sign out',
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
