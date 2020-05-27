import 'dart:convert';

import 'package:flutter/material.dart';
//import 'package:joinan_final_skripsi/main.dart';
//import 'package:joinan_final_skripsi/models/availableCourse.dart';
import 'package:http/http.dart' as http;
import 'package:joinan_final_teacher_skripsi/main.dart';
import 'package:joinan_final_teacher_skripsi/models/forum.dart';
//import 'package:joinan_final_skripsi/screens/pelajaran/availableCourseDetail.dart';
import 'package:intl/intl.dart';
import 'package:joinan_final_teacher_skripsi/models/kelasTeacher.dart';
import 'package:joinan_final_teacher_skripsi/models/listKelas.dart';

class ForumLearning extends StatefulWidget {

 ForumLearning({this.username,this.listKelas});
  final String username;
  ListKelas listKelas;

  var now = new DateTime.now();
  var newTime = new DateFormat.yMMMMd().add_jm().format(DateTime.now());

  @override
  _ForumLearningState createState() => _ForumLearningState();
}

class _ForumLearningState extends State<ForumLearning> {

  TextEditingController postForum = TextEditingController();

//  Future<List<dynamic>> getForum() async {
//    final response = await http.get('http://192.168.64.2/my_store/getForum.php');
//
//    return json.decode(response.body);
//  }

  List<Forum>  _forum = List<Forum>();

  Future<List<Forum>> fetchForum() async {
    var url = 'http://$myIP/joinan/getForum.php';

    var response = await http.get(url);

    var forums = List<Forum>();

    if(response.statusCode == 200) {
      var forumsJson = json.decode(response.body);
      for(var forumJson in forumsJson) {
        if(forumJson['courseID'] == widget.listKelas.courseID) {
          forums.add(Forum.fromJson(forumJson));
        }
      }
    }
    return forums;
  }

  Future<List> _postForum() async {
    var url = "http://$myIP/joinan/postForum.php";

    http.post(url, body: {
      "courseID": widget.listKelas.courseID.toString(),
      "userEmail": emailUser,
      "postContent": postForum.text,
      "timePosted": widget.newTime
    });

    Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => ForumLearning(listKelas: widget.listKelas)));
  }

  @override
  void initState() {
    //print(widget.listKelas.courseID);
    fetchForum().then((value) {
      setState(() {
        _forum.addAll(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //title: Text('$username'),
          //title: Text('${widget.newTime}'),
          title: Text('Forum ${widget.listKelas.courseName}'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: FutureBuilder<List>(
                  future: fetchForum(),
                  builder: (context, snapshot){
                    if(snapshot.hasError){
                      print(snapshot.error);
                    }else if(snapshot.hasData){
                      return ListView.builder(
                        itemCount: _forum==null ? 0 : _forum.length,
                        itemBuilder: (context, i) {
                          //return Text(list[i]['item_name']);
                          return Container(
                            padding: EdgeInsets.all(10.0),
                            child: GestureDetector(
                              onTap: ()=>Navigator.of(context).push(
                                  MaterialPageRoute(
                                    //builder: (BuildContext context)=> Detail(list: list, index: i)
                                  )
                              ),
                              child: Card(
                                child: ListTile(
                                  //title: Text("${list[i]['userEmail']} - ${list[i]['timePosted']}"),
                                  //title: Text("${list[i]['userEmail']} - ${list[i]['timePosted']}"),
                                  title: Text("${_forum[i].userEmail} - ${_forum[i].timePosted}"),
                                  //title: Text("${list[i]['userEmail']} - ${formattedD}"),
                                  //subtitle: Text("${list[i]['postContent']}"),
                                  subtitle: Text("${_forum[i].postContent}"),
                                ),
                              ),
                            ),
                          );
                        },
                      );;
                    }
                    return Text('loading');
                  }
              ),
            ),
            TextField(
              controller: postForum,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  hintText: 'Input post di sini'
              ),
            ),
            RaisedButton(
              onPressed: () {
                _postForum();
              },
              color: Colors.blue,
              child: Text(
                'Post',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            //Text('${widget.formattedDate}'),
          ],
        )
    );
  }
}

class ForumList extends StatelessWidget {

  final List list;
  final Forum forum;
  ForumList({this.list,this.forum});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list==null ? 0 : list.length,
      itemBuilder: (context, i) {
        //return Text(list[i]['item_name']);
        return Container(
          padding: EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: ()=>Navigator.of(context).push(
                MaterialPageRoute(
                  //builder: (BuildContext context)=> Detail(list: list, index: i)
                )
            ),
            child: Card(
              child: ListTile(
                //title: Text("${list[i]['userEmail']} - ${list[i]['timePosted']}"),
                //title: Text("${list[i]['userEmail']} - ${list[i]['timePosted']}"),
                title: Text("${forum.userEmail} - ${forum.timePosted}"),
                //title: Text("${list[i]['userEmail']} - ${formattedD}"),
                //subtitle: Text("${list[i]['postContent']}"),
                subtitle: Text("${forum.postContent}"),
              ),
            ),
          ),
        );
      },
    );
  }
}