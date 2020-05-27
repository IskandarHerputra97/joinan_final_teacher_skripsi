//import 'dart:convert';
//
//import 'package:flutter/material.dart';
//import 'package:joinan_final_teacher_skripsi/main.dart';
//import 'package:joinan_final_teacher_skripsi/models/requestPertemuan.dart';
//import 'package:http/http.dart' as http;
//
//class DaftarPertemuan extends StatefulWidget {
//
//  DaftarPertemuan({this.username});
//  final String username;
//  RequestPertemuan requestPertemuan;
//
//  @override
//  _DaftarPertemuanState createState() => _DaftarPertemuanState();
//}
//
//class _DaftarPertemuanState extends State<DaftarPertemuan> {
//
//  //var tempPertemuanID;
//
//  List<RequestPertemuan> _requestPertemuans = List<RequestPertemuan>();
//
//  Future<List<RequestPertemuan>> fetchRequestPertemuans() async {
//    //var url = 'https://api.myjson.com/bins/rd8y2';
//    //var url = 'https://api.myjson.com/bins/yd80e';
//    var url = 'http://192.168.64.2/my_store/get_daftar_pertemuan.php';
//    var response = await http.get(url);
//
//    var requestPertemuans = List<RequestPertemuan>();
//
//    if (response.statusCode == 200) {
//      var requestPertemuansJson = json.decode(response.body);
//      for (var requestPertemuanJson in requestPertemuansJson) {
//        requestPertemuans.add(RequestPertemuan.fromJson(requestPertemuanJson));
//      }
//    }
//    return requestPertemuans;
//  }
//
//  Stream<List<RequestPertemuan>> _pertemuan() {
//    return Stream.fromFuture(fetchRequestPertemuans());
//}
//
//  void acceptPertemuan() {
//    var url = 'http://192.168.64.2/my_store/accept_pertemuan.php';
//    http.post(url,body: {
//      "pertemuanID": widget.requestPertemuan.pertemuanID.toString(),
//      "emailStudent": widget.requestPertemuan.emailStudent.toString(),
//      "emailTeacher": widget.requestPertemuan.emailTeacher.toString(),
//      "namaTeacher": widget.requestPertemuan.namaTeacher.toString(),
//      "namaCourse": widget.requestPertemuan.namaCourse.toString(),
//      "tanggal": widget.requestPertemuan.tanggal.toString(),
//      "jam": widget.requestPertemuan.jam.toString(),
//      "lokasi": widget.requestPertemuan.lokasi.toString()
//    });
//  }
//
//
//  void deleteData() {
//    var url = 'http://192.168.64.2/my_store/delete_data.php';
//    http.post(url, body: {
//      //"pertemuanID": tempPertemuanID.toString(),
//      "pertemuanID": widget.requestPertemuan.pertemuanID.toString(),
//    });
//  }
//
//  @override
//  void initState() {
//    fetchRequestPertemuans().then((value) {
//      setState(() {
//        _requestPertemuans.addAll(value);
//      });
//    });
//    super.initState();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(widget.username),
//      ),
//        body: Column(
//          children: <Widget>[
//            Expanded(
//              child: StreamBuilder<List<RequestPertemuan>>(
//                stream: _pertemuan(),
//                builder: (context, snapshot) {
//                  return ListView.builder(
//                    itemBuilder: (context, index) {
//                      return Column(
//                        children: <Widget>[
//                          Text(_requestPertemuans[index].tanggal),
//                          Text(_requestPertemuans[index].jam),
//                          Text(_requestPertemuans[index].lokasi),
//                          Row(
//                            //mainAxisAlignment: MainAxisAlignment.center,
//                            children: <Widget>[
//                              SizedBox(width: 80.0),
//                              RaisedButton(
//                                onPressed: () {},
//                                color: Colors.blue,
//                                child: Text(
//                                  'Terima',
//                                  style: TextStyle(
//                                    color: Colors.white,
//                                  ),
//                                ),
//                              ),
//                              SizedBox(width: 20.0),
//                              RaisedButton(
//                                onPressed: () {
//                                  setState(() {
//                                    //tempPertemuanID = _requestPertemuans[index].pertemuanID;
//                                  });
//                                  //deleteData();
//                                  //print('pertemuan ID : ${_requestPertemuans[0].pertemuanID}');
//                                  //print('tempPertemuanID = $tempPertemuanID');
//                                  //print('delete data');
//                                },
//                                color: Colors.red,
//                                child: Text(
//                                  'Tolak',
//                                  style: TextStyle(
//                                    color: Colors.white,
//                                  ),
//                                ),
//                              ),
//                            ],
//                          ),
//                        ],
//                      );
//                    },
//                    itemCount: _requestPertemuans.length,
//                  );
//                }
//              ),
//            ),
////            RaisedButton(
////              onPressed: () {
////                fetchRequestPertemuans();
////              },
////              color: Colors.green,
////              child: Text(
////                'Refresh',
////                style: TextStyle(
////                  color: Colors.white,
////                ),
////              ),
////            ),
//          ],
//        )
//    );
//  }
//}
//
//

//import 'dart:convert';
//
//import 'package:flutter/material.dart';
//import 'package:joinan_final_teacher_skripsi/main.dart';
//import 'package:joinan_final_teacher_skripsi/models/requestPertemuan.dart';
//import 'package:http/http.dart' as http;
//import 'package:joinan_final_teacher_skripsi/screens/daftarPertemuanDetail.dart';
//
//class DaftarPertemuan extends StatefulWidget {
//
//  DaftarPertemuan({this.username});
//  final String username;
//  RequestPertemuan requestPertemuan;
//
//  @override
//  _DaftarPertemuanState createState() => _DaftarPertemuanState();
//}
//
//class _DaftarPertemuanState extends State<DaftarPertemuan> {
//
//  //var tempPertemuanID;
//
//  List<RequestPertemuan> _requestPertemuans = List<RequestPertemuan>();
//
//  Future<List<RequestPertemuan>> fetchRequestPertemuans() async {
//    //var url = 'https://api.myjson.com/bins/rd8y2';
//    //var url = 'https://api.myjson.com/bins/yd80e';
//    var url = 'http://192.168.64.2/my_store/get_daftar_pertemuan.php';
//    var response = await http.get(url);
//
//    var requestPertemuans = List<RequestPertemuan>();
//
//    if (response.statusCode == 200) {
//      var requestPertemuansJson = json.decode(response.body);
//      for (var requestPertemuanJson in requestPertemuansJson) {
//        requestPertemuans.add(RequestPertemuan.fromJson(requestPertemuanJson));
//      }
//    }
//    return requestPertemuans;
//  }
//
//  Stream<List<RequestPertemuan>> _pertemuan() {
//    return Stream.fromFuture(fetchRequestPertemuans());
//  }
//
//  void acceptPertemuan() {
//    var url = 'http://192.168.64.2/my_store/accept_pertemuan.php';
//    http.post(url,body: {
//      "pertemuanID": widget.requestPertemuan.pertemuanID.toString(),
//      "emailStudent": widget.requestPertemuan.emailStudent.toString(),
//      "emailTeacher": widget.requestPertemuan.emailTeacher.toString(),
//      "namaTeacher": widget.requestPertemuan.namaTeacher.toString(),
//      "namaCourse": widget.requestPertemuan.namaCourse.toString(),
//      "tanggal": widget.requestPertemuan.tanggal.toString(),
//      "jam": widget.requestPertemuan.jam.toString(),
//      "lokasi": widget.requestPertemuan.lokasi.toString()
//    });
//  }
//
//  void deleteData() {
//    var url = 'http://192.168.64.2/my_store/delete_data.php';
//    http.post(url, body: {
//      //"pertemuanID": tempPertemuanID.toString(),
//      "pertemuanID": widget.requestPertemuan.pertemuanID.toString(),
//    });
//  }
//
//  @override
//  void initState() {
//    fetchRequestPertemuans().then((value) {
//      setState(() {
//        _requestPertemuans.addAll(value);
//      });
//    });
//    super.initState();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        appBar: AppBar(
//          title: Text(widget.username),
//        ),
//        body: Column(
//          children: <Widget>[
//            Expanded(
//              child: StreamBuilder<List<RequestPertemuan>>(
//                  stream: _pertemuan(),
//                  builder: (context, snapshot) {
//                    return ListView.builder(
//                      itemBuilder: (context, index) {
//                        return Padding(
//                          padding: const EdgeInsets.all(12.0),
//                          child: Column(
//                            children: <Widget>[
//                              Text('Request dari ${_requestPertemuans[index].emailStudent}'),
//                              //Text(_requestPertemuans[index].jam),
//                              //Text(_requestPertemuans[index].lokasi),
//                              Row(
//                                mainAxisAlignment: MainAxisAlignment.center,
//                                children: <Widget>[
//                                  //SizedBox(width: 120.0),
//                                  RaisedButton(
//                                    onPressed: () {
//                                      Navigator.push(context, MaterialPageRoute(builder: (context) => DaftarPertemuanDetail(requestPertemuan: _requestPertemuans[index],index:index,username: username,)));
//                                    },
//                                    color: Colors.blue,
//                                    child: Text(
//                                      'Cek detail',
//                                      style: TextStyle(
//                                        color: Colors.white,
//                                      ),
//                                    ),
//                                  ),
//                                  //SizedBox(width: 20.0),
////                                RaisedButton(
////                                  onPressed: () {
////                                    setState(() {
////                                      //tempPertemuanID = _requestPertemuans[index].pertemuanID;
////                                    });
////                                    //deleteData();
////                                    //print('pertemuan ID : ${_requestPertemuans[0].pertemuanID}');
////                                    //print('tempPertemuanID = $tempPertemuanID');
////                                    //print('delete data');
////                                  },
////                                  color: Colors.red,
////                                  child: Text(
////                                    'Tolak',
////                                    style: TextStyle(
////                                      color: Colors.white,
////                                    ),
////                                  ),
////                                ),
//                                ],
//                              ),
//                            ],
//                          ),
//                        );
//                      },
//                      itemCount: _requestPertemuans.length,
//                    );
//                  }
//              ),
//            ),
////            RaisedButton(
////              onPressed: () {
////                fetchRequestPertemuans();
////              },
////              color: Colors.green,
////              child: Text(
////                'Refresh',
////                style: TextStyle(
////                  color: Colors.white,
////                ),
////              ),
////            ),
//          ],
//        )
//    );
//  }
//}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:joinan_final_teacher_skripsi/customNavBar.dart';
import 'package:joinan_final_teacher_skripsi/main.dart';
import 'package:joinan_final_teacher_skripsi/models/requestPertemuan.dart';
import 'package:http/http.dart' as http;
import 'package:joinan_final_teacher_skripsi/screens/daftarPertemuanDetail.dart';

class DaftarPertemuan extends StatefulWidget {

  DaftarPertemuan({this.username});
  final String username;
  RequestPertemuan requestPertemuan;

  @override
  _DaftarPertemuanState createState() => _DaftarPertemuanState();
}

class _DaftarPertemuanState extends State<DaftarPertemuan> {

  //var tempPertemuanID;

  List<RequestPertemuan> _requestPertemuans = List<RequestPertemuan>();

  Future<List<RequestPertemuan>> fetchRequestPertemuans() async {
    //var url = 'https://api.myjson.com/bins/rd8y2';
    //var url = 'https://api.myjson.com/bins/yd80e';
    var url = 'http://$myIP/joinan/get_daftar_pertemuan.php';
    var response = await http.get(url);

    var requestPertemuans = List<RequestPertemuan>();

    if (response.statusCode == 200) {
      var requestPertemuansJson = json.decode(response.body);
      for (var requestPertemuanJson in requestPertemuansJson) {
        if(requestPertemuanJson['emailTeacher'] == emailUser && requestPertemuanJson['status'] == 'waiting') {
          requestPertemuans.add(
              RequestPertemuan.fromJson(requestPertemuanJson));
        }
      }
    }
    return requestPertemuans;
  }

  Stream<List<RequestPertemuan>> _pertemuan() {
    return Stream.fromFuture(fetchRequestPertemuans());
  }

//  void acceptPertemuan() {
//    var url = 'http://192.168.64.2/my_store/accept_pertemuan.php';
//    http.post(url,body: {
//      "pertemuanID": widget.requestPertemuan.pertemuanID.toString(),
//      "emailStudent": widget.requestPertemuan.emailStudent.toString(),
//      "emailTeacher": widget.requestPertemuan.emailTeacher.toString(),
//      "namaTeacher": widget.requestPertemuan.namaTeacher.toString(),
//      "namaCourse": widget.requestPertemuan.namaCourse.toString(),
//      "tanggal": widget.requestPertemuan.tanggal.toString(),
//      "jam": widget.requestPertemuan.jam.toString(),
//      "lokasi": widget.requestPertemuan.lokasi.toString()
//    });
//  }
//
//  void deleteData() {
//    var url = 'http://192.168.64.2/my_store/delete_data.php';
//    http.post(url, body: {
//      //"pertemuanID": tempPertemuanID.toString(),
//      "pertemuanID": widget.requestPertemuan.pertemuanID.toString(),
//    });
//  }

  void _acceptPertemuan(index) {
    var url = 'http://$myIP/joinan/accept_pertemuan.php';

    http.post(url,body: {
      //"pertemuanID": widget.requestPertemuan.pertemuanID,
      "pertemuanID": _requestPertemuans[index].pertemuanID,
      "status": "accepted"
    });
    //print(widget.requestPertemuan.pertemuanID);
    print(_requestPertemuans[index].pertemuanID);

//    setState(() {
//      _requestPertemuans = List.from(_requestPertemuans);
//    });
    Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => CustomNavBar(username: widget.username,)));
  }

  void _rejectPertemuan(index) {
    var url = 'http://$myIP/joinan/reject_pertemuan.php';

    http.post(url,body: {
      //"pertemuanID": widget.requestPertemuan.pertemuanID,
      "pertemuanID": _requestPertemuans[index].pertemuanID,
      "status": "rejected"
    });
    //print(widget.requestPertemuan.pertemuanID);
    print(_requestPertemuans[index].pertemuanID);

//    setState(() {
//      _requestPertemuans = List.from(_requestPertemuans);
//    });

    Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => CustomNavBar(username: widget.username,)));
  }

  @override
  void initState() {
    fetchRequestPertemuans().then((value) {
      setState(() {
        _requestPertemuans.addAll(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text("${widget.listKelas.courseName}"),
        //title: Text('Daftar pertemuan detail'),
        //title: Text(emailUser),
        title: Text('Halo, $namaUser'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: _requestPertemuans.length,
          itemBuilder: (context,index) {
            return Column(
              children: <Widget>[
                Text('Request oleh ${_requestPertemuans[index].namaStudent}'),
                //Text(widget.requestPertemuan.emailStudent),
                Text(_requestPertemuans[index].emailStudent),
                //Text(widget.requestPertemuan.namaCourse),
                Text(_requestPertemuans[index].namaCourse),
                //Text(widget.requestPertemuan.tanggal),
                Text(_requestPertemuans[index].tanggal),
                //Text(widget.requestPertemuan.jam),
                Text(_requestPertemuans[index].jam),
                //Text(widget.requestPertemuan.lokasi),
                Text(_requestPertemuans[index].lokasi),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {
                        _acceptPertemuan(index);
                        //deleteData();
                        //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CustomNavBar(username: username,)));
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
                        _rejectPertemuan(index);
                        //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CustomNavBar(username: username,)));
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
            );
          }
        ),
      ),
    );
  }
}