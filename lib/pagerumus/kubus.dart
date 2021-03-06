import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class Kubus extends StatefulWidget {
  @override
  _KubusState createState() => _KubusState();
}

class _KubusState extends State<Kubus> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  String akhirluas,akhirkeliling;
  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text(
        "Ok",
        style: TextStyle(color: Colors.redAccent),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Kubus Hasil"),
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


  TextEditingController _controllerkubus = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kubus'),
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
                    controller: _controllerkubus,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ], // Only numbers ca
                    decoration: InputDecoration(
                      labelText: "panjang sisi",
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
                        akhirluas =_controllerkubus.text;
                        int masukan= int.parse(akhirluas);
                        int luas = masukan * masukan;

                        int keliling = masukan * 4;
                        akhirluas = luas.toString();
                        akhirkeliling = keliling.toString();

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
