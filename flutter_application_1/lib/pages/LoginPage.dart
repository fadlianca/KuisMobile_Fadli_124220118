//import agar tersambung dengan flutter dan home page
import 'package:flutter/material.dart';
import 'HomePage.dart';

//menggunakan stateful widget agak fleksible
class LoginPages extends StatefulWidget {
  const LoginPages({super.key});

  @override
  State<LoginPages> createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPages> {
  //menset variabel dan value nya
  String username = '';
  String password = '';
  bool isLoginSucces = true;
  bool visible = true;

  //fungsi redirect
  _navigatetoHome() async {
    await Future.delayed(Duration(seconds: 1));

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(username: username, password: password),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bela Negara'),
      ),
      body: Column(
        children: [
          Image(
              image:
                  AssetImage('lib/assets/logo_upn.png')), //menampilakn logo upn
          usernameField(),
          passwordField(),
          loginButton(context),
        ],
      ),
    );
  }

  //isi widget username, password, button login
  Widget usernameField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        onChanged: (value) {
          username = value;
        },
        decoration: const InputDecoration(
          hintText: 'Username',
          contentPadding: EdgeInsets.all(8),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
      ),
    );
  }

  Widget passwordField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        onChanged: (value) {
          password = value;
        },
        //visible atau invisible pass
        obscureText: visible,
        decoration: InputDecoration(
          suffix: IconButton(
            icon: Icon(visible ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(() {
                visible = !visible;
              });
            },
          ),
          hintText: 'Password',
          contentPadding: EdgeInsets.all(8),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
      ),
    );
  }

  Widget loginButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery.of(context).size.width,
      //membuat button untuk login
      child: ElevatedButton(
        onPressed: () {
          String text = '';
          if (username == 'admin' && password == 'admin') {
            setState(() {
              text = "Login Berhasil";
              isLoginSucces = true;
              _navigatetoHome();
            });
          } else {
            setState(() {
              text = "Login Gagal";
              isLoginSucces = false;
            });
          }

          //snackbar massage
          SnackBar snackBar = SnackBar(
            content: Text(text),
            backgroundColor: isLoginSucces ? Colors.green : Colors.red,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: Text('Login'),
      ),
    );
  }
}
