//import 'package:flutter/material.dart';
//
//import 'package:http/http.dart' as http;
//import 'package:joinan_final_teacher_skripsi/customNavBar.dart';
//import 'dart:async';
//import 'dart:convert';
//import 'package:joinan_final_teacher_skripsi/services/register.dart';
//
//class SignIn extends StatefulWidget {
//
//  final Function toggleView;
//  SignIn({this.toggleView});
//
//  @override
//  _SignInState createState() => _SignInState();
//}
//
//class _SignInState extends State<SignIn> {
//
//  //final AuthService _auth = AuthService();
//  final _formKey = GlobalKey<FormState>();
//  //bool loading = false;
//  String userEmail;
//
//  //text field state
//  String email = '';
//  String password = '';
//  String error = '';
//
//  String getUserEmail() {
//    userEmail = email;
//    print('getUserEmail : $userEmail');
//    return userEmail;
//  }
//
//  //baru
//  // Getting value from TextField widget.
//  final emailController = TextEditingController();
//  final passwordController = TextEditingController();
//
//  Future userLogin() async {
//    //Showing CircularProgressIndicator.
//    setState(() {
//      //loading = true;
//    });
//
//    // SERVER LOGIN API URL
//    var url = 'https://flutter-examples.000webhostapp.com/login_user.php';
//
//    // Store all data with Param Name.
//    var data = {'email': email, 'password' : password};
//
//    // Starting Web API Call.
//    var response = await http.post(url, body: json.encode(data));
//
//    // Getting Server response into variable.
//    var message = jsonDecode(response.body);
//
//    if(message == 'Login Matched') {
//      setState(() {
//        //loading = false;
//      });
//
//      //Navigator.push(context, MaterialPageRoute(builder: (context) => CustomNavBar()));
//    } else {
//      // If Email or Password did not Matched.
//      // Hiding the CircularProgressIndicator.
//      setState(() {
//        //loading = false;
//      });
//    }
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('Sign in'),
//        centerTitle: true,
//        actions: <Widget>[
//          FlatButton.icon(
//            onPressed: () {
//              //widget.toggleView();
//              Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => Register()));
//            },
//            icon: Icon(Icons.person),
//            label: Text('Register'),
//          )
//        ],
//      ),
//      body: Container(
//        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
//        child: Form(
//          key: _formKey,
//          child: Column(
//            children: <Widget>[
//              Text(
//                'JOINAN MOBILE LEARNING',
//                style: TextStyle(
//                  color: Colors.blue,
//                  fontSize: 24.0,
//                  fontWeight: FontWeight.bold,
//                ),
//              ),
//              SizedBox(height: 20.0),
//              TextFormField(
//                validator: (val) => val.isEmpty ? 'Enter an email' : null,
//                onChanged: (val) {
//                  setState(() {
//                    email = val;
//                  });
//                },
//              ),
//              SizedBox(height: 20.0),
//              TextFormField(
//                obscureText: true,
//                validator: (val) => val.length < 6 ? 'Password minimal 6 karakter' : null,
//                onChanged: (val) {
//                  setState(() {
//                    password = val;
//                  });
//                },
//              ),
//              SizedBox(height: 20.0),
//              RaisedButton(
////                 onPressed: () async {
////                   if(_formKey.currentState.validate()) {
////                     print(email);
////                     print(password);
////                     getUserEmail();
//// //                    setState(() {
//// //                      loading = true;
//// //                    });
////                     dynamic result = await _auth.signInWithEmailAndPassword(email, password);
////                     if(result == null) {
////                       setState(() {
////                         error = 'Could not sign in with those credentials';
////                         loading = false;
////                       });
////                     }
////                   }
////                 },
//                onPressed: () {
//                  //userLogin();
//                  Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => CustomNavBar()));
//                },
//                color: Colors.blue,
//                child: Text(
//                  'Sign in',
//                  style: TextStyle(
//                    color: Colors.white,
//                  ),
//                ),
//              ),
//              SizedBox(height: 12.0),
//              Text(
//                error,
//                style: TextStyle(
//                  color: Colors.red,
//                  fontSize: 14.0,
//                ),
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:joinan_final_teacher_skripsi/main.dart';

class SignIn extends StatefulWidget {

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {


  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  String msg = '';

  Future<List> _login() async {
    final response = await http.post("http://$myIP/joinan/login_teacher.php", body: {
      "email": email.text,
      "password": password.text,
    });

    print(response.body);

    var dataUser = json.decode(response.body);

    if(dataUser.length==0){
      setState(() {
        msg = "Login gagal";
      });
    }else{
      Navigator.pushReplacementNamed(context, '/CustomNavBar');
    }
    setState(() {
      idUser = dataUser[0]['id'];
      emailUser = dataUser[0]['email'];
      namaUser = dataUser[0]['nama'];
    });

    return dataUser;
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/Register');
            },
            icon: Icon(Icons.person),
            label: Text('Register'),
          )
        ],
      ),
      body: Container(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Input email di sini'
                  ),
                  validator: (value) {
                    if(value.isEmpty) {
                      return 'Username tidak sesuai';
                    } else {
                      return null;
                    }
                  },
                  controller: email,
                ),
                Text(
                  'Password',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Input password di sini',
                  ),
                  validator: (value) {
                    if(value.isEmpty) {
                      return 'Password tidak sesuai';
                    }
                    return null;
                  },
                  controller: password,
                ),
                RaisedButton(
                  onPressed: () {
                    if(_formKey.currentState.validate()) {
                      _login();
                    }
                  },
                  color: Colors.blue,
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  msg,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 28.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
