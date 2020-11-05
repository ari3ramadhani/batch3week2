import 'halamanhome.dart';
import 'package:flutter/material.dart';

class Pertama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Dengan MySql',
      home: Login(),
      routes: <String, WidgetBuilder>{
        '/HalamanHome': (BuildContext context) => new HalamanHome(),
        '/Login': (BuildContext context) => new Login(),
      },
    );
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  TextEditingController _controllerUsername = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();

  String isi = "";

  bool _isHidePassword = true;

  void _togglePassword() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void _showScaffold(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  String usernamenya = "admin";
  String paswordnya = "admin";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Username wajib diisi';
                      }
                      return null;
                    },
                    controller: _controllerUsername,
                    decoration: InputDecoration(
                      prefixStyle: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.w600),
                      labelText: "Username",
                      hintText: 'Username',
                      hintStyle: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w200),
                      labelStyle: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.w600),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Password wajib diisi';
                      }
                      return null;
                    },
                    controller: _controllerPassword,
                    obscureText: _isHidePassword,
                    decoration: InputDecoration(
                      prefixStyle: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.w600),
                      labelText: "Enter password",
                      hintText: 'Enter password',
                      hintStyle: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w200),
                      labelStyle: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.w600),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          _togglePassword();
                        },
                        child: Icon(
                          _isHidePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: _isHidePassword ? Colors.grey : Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(35.0),
              child: SizedBox(
                width: 350.0,
                height: 45.0,
                child: new RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      //event /Future/void
                    }
                    setState(() {});
                    if (_controllerUsername.text == "admin" &&
                        _controllerPassword.text == "admin") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HalamanHome(
                                  panggilusername: _controllerUsername.text,
                                  panggilpasswordnya:
                                      _controllerPassword.text)));
                    } else if (_controllerPassword.text.length < 6) {
                      _showScaffold("tidak boleh kurang dari 6 digit");
                    } else {
                      _showScaffold("Tidak terdaftar");
                    }
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  textColor: Colors.black,
                  color: Colors.lightBlueAccent,
                ),
              ),
            ),
            Text(isi),
          ],
        ),
      ),
    );
  }
}
