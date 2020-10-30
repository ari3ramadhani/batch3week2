import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Usia extends StatefulWidget {
  @override
  _UsiaState createState() => _UsiaState();
}

class _UsiaState extends State<Usia> {
  final FocusNode tgl = FocusNode();
  final FocusNode bln = FocusNode();
  final FocusNode thn = FocusNode();


  TextEditingController controllerTanggal = TextEditingController();
  TextEditingController controllerBulan = TextEditingController();
  TextEditingController controllerTahun = TextEditingController();

  String akhir;
  int tanggalnya = 0, bulannya = 0, tahunnya = 0;

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
      title: Text("Selisihnya"),
      content: Text(akhir),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Usia"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(35.0),
            child: Row(
              children: <Widget>[
                Flexible(
                    child: TextFormField(
                        focusNode: tgl,
                        controller: controllerTanggal,
                        keyboardType: TextInputType.number,
                        onChanged: (val) {
                          if (controllerTanggal.text.length == 2) {
                            FocusScope.of(context).requestFocus(bln);
                          }
                        },
                        decoration: InputDecoration(
                          labelText: "Tanggal",
                          //icon: Icon(Icons.phone_iphone)
                        ))),
                Text("/",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                Flexible(
                    child: TextFormField(
                        focusNode: bln,
                        controller: controllerBulan,
                        keyboardType: TextInputType.number,
                        onChanged: (val) {
                          if (controllerBulan.text.length == 2) {
                            FocusScope.of(context).requestFocus(thn);
                          }
                        },
                        decoration: InputDecoration(
                          labelText: "Bulan",
                        ))),
                Text("/",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                Flexible(
                    child: TextFormField(
                        focusNode: thn,
                        controller: controllerTahun,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Tahun",
                        ))),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              width: 350.0,
              height: 45.0,
              child: new RaisedButton(
                onPressed: () {
                  setState(() {
                    String tgl = controllerTanggal.text;
                    tanggalnya = int.parse(tgl);

                    String bln = controllerBulan.text;
                    bulannya = int.parse(bln);

                    String thn = controllerTahun.text;
                    tahunnya = int.parse(thn);

                    DateTime dateNow = DateTime.now();
                    DateTime dateIn = DateTime(tahunnya, bulannya, tanggalnya);
                    DateTime dateFin = DateTime(dateNow.year - dateIn.year,
                        dateNow.month - dateIn.month, dateNow.day - dateIn.day);

                    akhir =
                        " ${dateFin.year} tahun , ${dateFin.month} bulan,${dateFin.day} hari ";

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
    );
  }
}
