import 'package:batch3week2/login.dart';
import 'package:batch3week2/rumus.dart';
import 'package:batch3week2/usia.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Week2"),

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (_)=> Usia()));
              },
              child: Text(
                "Usia",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              textColor: Colors.black,
              color: Colors.lightBlueAccent,
            ),

            RaisedButton(
              onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (_)=> Login()));
              },
              child: Text(
                "Login",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              textColor: Colors.black,
              color: Colors.lightBlueAccent,
            ),

            RaisedButton(
              onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (_)=> Rumus()));
              },
              child: Text(
                "Bangun Datar",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              textColor: Colors.black,
              color: Colors.lightBlueAccent,
            ),
          ],
        ),
      ),
    );
  }
}
