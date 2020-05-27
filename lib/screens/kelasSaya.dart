import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:joinan_final_teacher_skripsi/main.dart';
import 'package:joinan_final_teacher_skripsi/models/listKelas.dart';
import 'package:joinan_final_teacher_skripsi/models/requestPertemuan.dart';
import 'package:http/http.dart' as http;
import 'package:joinan_final_teacher_skripsi/screens/kelasSayaDetail.dart';

class KelasSaya extends StatefulWidget {

  final String username;
  KelasSaya({this.username});

  @override
  _KelasSayaState createState() => _KelasSayaState();
}

class _KelasSayaState extends State<KelasSaya> {

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
          title: Text('Joinan Teacher'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, bottom: 8.0, left: 8.0, right: 8.0),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 25.0,
                          backgroundImage: NetworkImage(
                              _listKelass[index].courseImage),
                        ),
                        title: Text(_listKelass[index].courseName),
                        //subtitle: Text(_listKelass[index].cour),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => KelasSayaDetail(listKelas: _listKelass[index],username: emailUser,)));
                        },
                      ),
                    ),
                  );
                },
                itemCount: _listKelass.length,
              ),
            ),
          ],
        )
    );
  }
}
