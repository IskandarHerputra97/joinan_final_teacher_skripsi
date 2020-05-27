import 'package:flutter/material.dart';
import 'package:joinan_final_teacher_skripsi/main.dart';
import 'package:joinan_final_teacher_skripsi/models/listKelas.dart';
import 'package:joinan_final_teacher_skripsi/screens/forumLearning.dart';

class KelasSayaDetail extends StatefulWidget {

  ListKelas listKelas;
  final String username;
  KelasSayaDetail({this.listKelas,this.username});

  @override
  _KelasSayaDetailState createState() => _KelasSayaDetailState();
}

class _KelasSayaDetailState extends State<KelasSayaDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.listKelas.courseName}"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          //Image.network(widget.list[widget.index]['courseImage']),
          Center(
            child: Container(
              width: 300,
              height: 400,
              child: Image.network(
                  widget.listKelas.courseImage,
              ),
            ),
          ),
          //Text(widget.list[widget.index]['courseDescription']),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.listKelas.courseDescription),
          ),
          //Text(widget.list[widget.index]['lecturerName']),
          //Text(widget.listKelas.),
          //Text(widget.list[widget.index]['lecturerDescription']),
          //Text(widget.listKelas.lecturerDescription),
          RaisedButton(
            onPressed: () {
              Navigator.push(context, new MaterialPageRoute(builder: (context) => ForumLearning(listKelas: widget.listKelas)));
              //enrollCourse();
              //addKelasSaya();
              //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=> AvailableCourseDetailEnrolled(availableCourse: widget.availableCourse,username: username,)));
            },
            color: Colors.blue,
            child: Text(
              'Forum',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
