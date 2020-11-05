import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';





class HalamanHome extends StatefulWidget {
  final panggilusername,panggilpasswordnya;

  HalamanHome({@required this.panggilusername,@required this.panggilpasswordnya});

  @override
  _HalamanHomeState createState() => _HalamanHomeState();
}

class _HalamanHomeState extends State<HalamanHome> {


  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("Ok" ,style: TextStyle(color: Colors.redAccent),),
      onPressed: () {
        Navigator.pop(context);
       Navigator.pop(context);
      },
    );
    Widget cancelButton = FlatButton(
      child: Text("Cancel" ,style: TextStyle(color: Colors.blue),),
      onPressed:  () {
        Navigator.pop(context);
        },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Apakah anda yakin keluar"),
      actions: [
        okButton,cancelButton
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Admin",style: TextStyle(fontSize: 24.0),),
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.exit_to_app, color: Colors.white,size: 40,),
              onPressed: (){
                showAlertDialog(context);
              },),
          ],),
        body: Center(

          child: Container(
            
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      border: new Border.all(color: Colors.green[500]),
      boxShadow: [
        BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 1.0),
          offset: Offset(6.0,6.0),
          blurRadius: 6.0,
          spreadRadius: 5.0,
        )
      ],
      color: Colors.lightBlueAccent,
        
      ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Username : ${widget.panggilusername}",style: TextStyle(color: Colors.black,fontSize: 24),),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Password : ${widget.panggilpasswordnya}",style: TextStyle(color: Colors.black,fontSize: 24),),
                ),
              ],
            ),
          ),
        ),

      ),
    );
  }
}