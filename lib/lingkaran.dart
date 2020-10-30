
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class Lingkaran extends StatefulWidget {
  @override
  _LingkaranState createState() => _LingkaranState();
}

class _LingkaranState extends State<Lingkaran> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();


  String akhir;
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
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Hasilnya"),
      content: Text("Luas lingkaran $akhir"),
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


  TextEditingController _controllerLingkaran = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lingkaran'),
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
                    controller: _controllerLingkaran,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ], // Only numbers ca
                    decoration: InputDecoration(
                      labelText: "panjang jari- jari",
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: SizedBox(
                  width: 350.0,
                  height: 45.0,
                  child: new RaisedButton(
                    onPressed: () { if (_formKey.currentState.validate()) {
                      //event /Future/void
                    }
                      setState(() {
                        akhir =_controllerLingkaran.text;
                        int ari= int.parse(akhir);
                        luas = 3.14 * ari;
                        akhir= luas.toString();

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
