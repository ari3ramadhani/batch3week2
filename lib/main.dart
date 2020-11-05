import 'package:batch3week2/pagelogin/login.dart';
import 'package:batch3week2/pagerumus/rumus.dart';
import 'package:batch3week2/pageusia/usia.dart';
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 250.0,
                height: 50.0,
                child: RaisedButton(
                  onPressed: () {
                     Navigator.push(context, MaterialPageRoute(builder: (_)=> Usia()));
                  },
                  child: Text(
                    "Usia",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  textColor: Colors.black,
                  color: Colors.lightBlueAccent,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 250.0,
                height: 50.0,
                child: RaisedButton(
                  onPressed: () {
                     Navigator.push(context, MaterialPageRoute(builder: (_)=> Login()));
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  textColor: Colors.black,
                  color: Colors.lightBlueAccent,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 250.0,
                height: 50.0,
                child: RaisedButton(
                  onPressed: () {
                     Navigator.push(context, MaterialPageRoute(builder: (_)=> Rumus()));
                  },
                  child: Text(
                    "Bangun Datar",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  textColor: Colors.black,
                  color: Colors.lightBlueAccent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
