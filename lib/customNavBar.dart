import 'package:flutter/material.dart';
import 'package:joinan_final_teacher_skripsi/main.dart';
import 'package:joinan_final_teacher_skripsi/screens/daftarPertemuan.dart';
import 'package:joinan_final_teacher_skripsi/screens/daftarPertemuanDetail.dart';
import 'package:joinan_final_teacher_skripsi/screens/kelasSaya.dart';
import 'package:joinan_final_teacher_skripsi/screens/profile.dart';
import 'package:joinan_final_teacher_skripsi/screens/test.dart';

class CustomNavBar extends StatefulWidget {

  CustomNavBar({this.username});
  final String username;

  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {

  int _currentIndex = 0;
  final tabs = [
    DaftarPertemuan(username: emailUser,),
    //DaftarPertemuanDetail(username: username),
    KelasSaya(username: emailUser),
    Profile(username: emailUser,),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Daftar Pertemuan'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.class_),
            title: Text('Kelas Saya'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_identity),
            title: Text('Profil Saya'),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
