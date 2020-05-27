//import 'package:flutter/material.dart';
//import 'package:joinan_final_teacher_skripsi/customNavBar.dart';
//import 'package:joinan_final_teacher_skripsi/main.dart';
//import 'package:joinan_final_teacher_skripsi/models/listKelas.dart';
//import 'package:joinan_final_teacher_skripsi/models/requestPertemuan.dart';
//import 'package:joinan_final_teacher_skripsi/screens/daftarPertemuan.dart';
//import 'package:joinan_final_teacher_skripsi/screens/forumLearning.dart';
//import 'package:http/http.dart' as http;
//
//class DaftarPertemuanDetail extends StatefulWidget {
//
//  RequestPertemuan requestPertemuan;
//  int index;
//  final String username;
//  DaftarPertemuanDetail({this.requestPertemuan,this.index,this.username});
//
//  @override
//  _DaftarPertemuanDetailState createState() => _DaftarPertemuanDetailState();
//}
//
//class _DaftarPertemuanDetailState extends State<DaftarPertemuanDetail> {
//
////  Future<List> _acceptPertemuan() {
////    var url = "http://192.168.64.2/my_store/accept_pertemuan.php";
////
////    http.post(url, body: {
////      "emailStudent": widget.requestPertemuan.emailStudent,
////      "emailTeacher": "teacher@gmail.com",
////      "namaTeacher": widget.requestPertemuan.emailTeacher,
////      "namaCourse": widget.requestPertemuan.namaCourse,
////      "tanggal": widget.requestPertemuan.tanggal,
////      "jam": widget.requestPertemuan.jam,
////      "lokasi": widget.requestPertemuan.lokasi
////    });
////    print(widget.requestPertemuan.emailStudent);
////    print(widget.requestPertemuan.emailTeacher);
////    print(widget.requestPertemuan.namaTeacher);
////    print(widget.requestPertemuan.namaCourse);
////    print(widget.requestPertemuan.tanggal);
////    print(widget.requestPertemuan.jam);
////    print(widget.requestPertemuan.lokasi);
////  }
//
//  void deleteData() {
//    var url = 'http://192.168.64.2/my_store/delete_data.php';
//    http.post(url, body: {
//      //"pertemuanID": tempPertemuanID.toString(),
//      "pertemuanID": widget.requestPertemuan.pertemuanID.toString(),
//    });
//    print(widget.requestPertemuan.pertemuanID);
//    print(widget.requestPertemuan.emailStudent);
//    print(widget.requestPertemuan.emailTeacher);
//    print(widget.requestPertemuan.namaTeacher);
//    print(widget.requestPertemuan.namaCourse);
//    print(widget.requestPertemuan.tanggal);
//    print(widget.requestPertemuan.jam);
//    print(widget.requestPertemuan.lokasi);
//  }
//
//  void _acceptPertemuan() {
//    var url = 'http://192.168.64.2/my_store/accept_pertemuan.php';
//
//    http.post(url,body: {
//      "pertemuanID": widget.requestPertemuan.pertemuanID.toString(),
//      "status": "accepted"
//    });
//  }
//
//  void _rejectPertemuan() {
//    var url = 'http://192.168.64.2/my_store/reject_pertemuan.php';
//
//    http.post(url,body: {
//      "pertemuanID": widget.requestPertemuan.pertemuanID.toString(),
//      "status": "rejected"
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        //title: Text("${widget.listKelas.courseName}"),
//        title: Text('Daftar pertemuan detail'),
//      ),
//      body: Padding(
//        padding: const EdgeInsets.all(20.0),
//        child: Column(
//          children: <Widget>[
//            Text(widget.requestPertemuan.emailStudent),
//            Text(widget.requestPertemuan.namaCourse),
//            Text(widget.requestPertemuan.tanggal),
//            Text(widget.requestPertemuan.jam),
//            Text(widget.requestPertemuan.lokasi),
//            Row(
//              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//              children: <Widget>[
//                RaisedButton(
//                  onPressed: () {
//                    _acceptPertemuan();
//                    //deleteData();
//                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CustomNavBar(username: username,)));
//                  },
//                  color: Colors.blue,
//                  child: Text(
//                    'Terima',
//                    style: TextStyle(
//                      color: Colors.white,
//                    ),
//                  ),
//                ),
//                RaisedButton(
//                  onPressed: () {
//                    //deleteData();
//                    _rejectPertemuan();
//                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CustomNavBar(username: username,)));
//                  },
//                  color: Colors.red,
//                  child: Text(
//                    'Tolak',
//                    style: TextStyle(
//                      color: Colors.white,
//                    ),
//                  ),
//                ),
//              ],
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}

import 'package:flutter/material.dart';
import 'package:joinan_final_teacher_skripsi/customNavBar.dart';
import 'package:joinan_final_teacher_skripsi/main.dart';
import 'package:joinan_final_teacher_skripsi/models/listKelas.dart';
import 'package:joinan_final_teacher_skripsi/models/requestPertemuan.dart';
import 'package:joinan_final_teacher_skripsi/screens/daftarPertemuan.dart';
import 'package:joinan_final_teacher_skripsi/screens/forumLearning.dart';
import 'package:http/http.dart' as http;

class DaftarPertemuanDetail extends StatefulWidget {

  RequestPertemuan requestPertemuan;
  int index;
  final String username;
  DaftarPertemuanDetail({this.requestPertemuan,this.index,this.username});

  @override
  _DaftarPertemuanDetailState createState() => _DaftarPertemuanDetailState();
}

class _DaftarPertemuanDetailState extends State<DaftarPertemuanDetail> {

//  Future<List> _acceptPertemuan() {
//    var url = "http://192.168.64.2/my_store/accept_pertemuan.php";
//
//    http.post(url, body: {
//      "emailStudent": widget.requestPertemuan.emailStudent,
//      "emailTeacher": "teacher@gmail.com",
//      "namaTeacher": widget.requestPertemuan.emailTeacher,
//      "namaCourse": widget.requestPertemuan.namaCourse,
//      "tanggal": widget.requestPertemuan.tanggal,
//      "jam": widget.requestPertemuan.jam,
//      "lokasi": widget.requestPertemuan.lokasi
//    });
//    print(widget.requestPertemuan.emailStudent);
//    print(widget.requestPertemuan.emailTeacher);
//    print(widget.requestPertemuan.namaTeacher);
//    print(widget.requestPertemuan.namaCourse);
//    print(widget.requestPertemuan.tanggal);
//    print(widget.requestPertemuan.jam);
//    print(widget.requestPertemuan.lokasi);
//  }

  void deleteData() {
    var url = 'http://$myIP/joinan/delete_data.php';
    http.post(url, body: {
      //"pertemuanID": tempPertemuanID.toString(),
      "pertemuanID": widget.requestPertemuan.pertemuanID.toString(),
    });
    print(widget.requestPertemuan.pertemuanID);
    print(widget.requestPertemuan.emailStudent);
    print(widget.requestPertemuan.emailTeacher);
    print(widget.requestPertemuan.namaTeacher);
    print(widget.requestPertemuan.namaCourse);
    print(widget.requestPertemuan.tanggal);
    print(widget.requestPertemuan.jam);
    print(widget.requestPertemuan.lokasi);
  }

  void _acceptPertemuan() {
    var url = 'http://$myIP/joinan/accept_pertemuan.php';

    http.post(url,body: {
      "pertemuanID": widget.requestPertemuan.pertemuanID.toString(),
      "status": "accepted"
    });
  }

  void _rejectPertemuan() {
    var url = 'http://$myIP/joinan/reject_pertemuan.php';

    http.post(url,body: {
      "pertemuanID": widget.requestPertemuan.pertemuanID.toString(),
      "status": "rejected"
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text("${widget.listKelas.courseName}"),
        title: Text('Daftar pertemuan detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Text(widget.requestPertemuan.emailStudent),
            Text(widget.requestPertemuan.namaCourse),
            Text(widget.requestPertemuan.tanggal),
            Text(widget.requestPertemuan.jam),
            Text(widget.requestPertemuan.lokasi),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    _acceptPertemuan();
                    //deleteData();
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CustomNavBar(username: emailUser,)));
                  },
                  color: Colors.blue,
                  child: Text(
                    'Terima',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    //deleteData();
                    _rejectPertemuan();
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CustomNavBar(username: emailUser,)));
                  },
                  color: Colors.red,
                  child: Text(
                    'Tolak',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
