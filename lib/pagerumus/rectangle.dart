
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class Rectangle extends StatefulWidget {
  @override
  _RectangleState createState() => _RectangleState();
}

class _RectangleState extends State<Rectangle> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();


  String akhirluas,akhirkeliling;
  double luas;
  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text(
        "Ok",
        style: TextStyle(color: Colors.redAccent),
      ),
      onPressed: () {
        Navigator.pop(context);
        Navigator.pop(context);
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Rectangle Hasil"),
      content: Text("Luas $akhirluas \nKeliling $akhirkeliling"),
      actions: [
        okButton,
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


  TextEditingController _controllerRectangle = TextEditingController();
  TextEditingController _controllerTinggi = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rectangle'),
      ),
      body:  Form(
        key: _formKey,
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(40,40,40,10),
                child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Panjang sisi wajib diisi';
                      }
                      return null;
                    },
                    controller: _controllerRectangle,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ], // Only numbers ca
                    decoration: InputDecoration(
                      labelText: "panjang sisi",
                    )),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40,0,40,10),
                child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Tinggi wajib diisi';
                      }
                      return null;
                    },
                    controller: _controllerTinggi,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ], // Only numbers ca
                    decoration: InputDecoration(
                      labelText: "tinggi",
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: SizedBox(
                  width: 350.0,
                  height: 45.0,
                  child: new RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        //event /Future/void
                      }
                      setState(() {
                        int panjang= int.parse(_controllerRectangle.text);
                        int tinggi=int.parse(_controllerTinggi.text);
                        int luas = panjang * tinggi;

                        int keliling = 2 *(panjang + tinggi);
                        akhirluas = luas.toString();
                        akhirkeliling = keliling.toString();

                        showAlertDialog(context);

                        showAlertDialog(context);
                      });
                    },
                    child: Text(
                      "Hitung",
                      style: TextStyle(
                        fontSize: 17,
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
      ),

    );
  }
}
