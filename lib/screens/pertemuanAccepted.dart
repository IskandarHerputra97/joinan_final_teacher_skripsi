import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:joinan_final_teacher_skripsi/main.dart';
import 'package:joinan_final_teacher_skripsi/models/acceptedPertemuan.dart';
import 'package:joinan_final_teacher_skripsi/models/listKelas.dart';
import 'package:joinan_final_teacher_skripsi/models/requestPertemuan.dart';
import 'package:http/http.dart' as http;
import 'package:joinan_final_teacher_skripsi/screens/daftarPertemuanDetail.dart';

class PertemuanAccepted extends StatefulWidget {

  PertemuanAccepted({this.username});
  final String username;
  //RequestPertemuan requestPertemuan;

  @override
  _PertemuanAcceptedState createState() => _PertemuanAcceptedState();
}

class _PertemuanAcceptedState extends State<PertemuanAccepted> {

//  List<AcceptedPertemuan> _acceptedPertemuans = List<AcceptedPertemuan>();
//
//  Future<List<AcceptedPertemuan>> fetchAcceptedPertemuans() async {
//    var url = 'http://192.168.64.2/my_store/get_accepted_pertemuan.php';
//    var response = await http.get(url);
//
//    var acceptedPertemuans = List<AcceptedPertemuan>();
//
//    if (response.statusCode == 200) {
//      var acceptedPertemuansJson = json.decode(response.body);
//      for (var acceptedPertemuanJson in acceptedPertemuansJson) {
//        acceptedPertemuans.add(AcceptedPertemuan.fromJson(acceptedPertemuanJson));
//      }
//    }
//    return acceptedPertemuans;
//  }

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
        if(requestPertemuanJson['emailTeacher'] == emailUser && requestPertemuanJson['status'] == "accepted") {
          requestPertemuans.add(
              RequestPertemuan.fromJson(requestPertemuanJson));
        }
      }
    }
    return requestPertemuans;
  }

  List<ListKelas> _listKelass = List<ListKelas>();

  Future<List<ListKelas>> fetchListKelas() async {
    //var url = 'https://api.myjson.com/bins/rd8y2';
    //var url = 'https://api.myjson.com/bins/yd80e';
    var url = 'http://$myIP/joinan/get_kelas_teacher.php';
    var response = await http.get(url);

    var listKelass = List<ListKelas>();

    if (response.statusCode == 200) {
      var listKelassJson = json.decode(response.body);
      for (var listKelasJson in listKelassJson) {
        if(listKelasJson['teacherID'] == idUser) {
          listKelass.add(ListKelas.fromJson(listKelasJson));
        }
      }
    }
    return listKelass;
  }

  @override
  void initState() {
    fetchRequestPertemuans().then((value) {
      setState(() {
        _requestPertemuans.addAll(value);
      });
    });

    fetchListKelas().then((value) {
      setState(() {
        _listKelass.addAll(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //title: Text(widget.username),
          title: Text('Daftar Pertemuan'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: <Widget>[
                              //Text('Request dari ${_requestPertemuans[index].emailStudent}'),
                              Text('Request dari ${_requestPertemuans[index].namaStudent}'),
                              //Text(_requestPertemuans[index].jam),
                              //Text(_requestPertemuans[index].lokasi),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  //SizedBox(width: 80.0),
                                  RaisedButton(
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => PertemuanAcceptedDetail(requestPertemuan: _requestPertemuans[index],index:index,username: emailUser,)));
                                    },
                                    color: Colors.blue,
                                    child: Text(
                                      'Cek detail',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  //SizedBox(width: 20.0),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: _requestPertemuans.length,
                    ),
            ),
          ],
        )
    );
  }
}

class PertemuanAcceptedDetail extends StatefulWidget {

  //AcceptedPertemuan acceptedPertemuan;
  RequestPertemuan requestPertemuan;
  int index;
  final String username;
  PertemuanAcceptedDetail({this.requestPertemuan,this.index,this.username});

  @override
  _PertemuanAcceptedDetailState createState() => _PertemuanAcceptedDetailState();
}

class _PertemuanAcceptedDetailState extends State<PertemuanAcceptedDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data pertemuan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: <Widget>[
              //Text(widget.requestPertemuan.emailStudent),
              //Text(widget.requestPertemuan.namaCourse),
              //Text(widget.requestPertemuan.tanggal),
              //Text(widget.requestPertemuan.jam),
              //Text(widget.requestPertemuan.lokasi),
              Text(widget.requestPertemuan.namaStudent),
              Text(widget.requestPertemuan.emailStudent),
              Text(widget.requestPertemuan.namaCourse),
              Text(widget.requestPertemuan.tanggal),
              Text(widget.requestPertemuan.jam),
              Text(widget.requestPertemuan.lokasi),
            ],
          ),
        ),
      ),
    );
  }
}