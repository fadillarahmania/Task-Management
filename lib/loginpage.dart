// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:praktikum_13_json/home_page.dart';
import 'package:praktikum_13_json/firstpage.dart';
import 'package:praktikum_13_json/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailfield = TextEditingController();
  TextEditingController passfield = TextEditingController();

  void login(String email, password) async {
    // var client = http.Client();
    try {
      var response = await Dio().get('http://localhost:3000/users');
      // var response = await client.get(uri);
      var panjangdata = response.data.length;
      if (response.statusCode == 200) {
        for (var i = 0; i <= panjangdata; i++) {
          if (email == response.data[i]['email'] &&
              password == response.data[i]['password']) {
            print("Login success");
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));

            break;
          }
        }
      } else {
        showSuccessMassage('Berhasil Login');
      }
    } catch (e) {
      showErrorMassage('Email/Password Salah');
    }
  }

  void showSuccessMassage(String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(
          fontFamily: 'PoppinsRegular',
        ),
      ),
      backgroundColor: Color(0xFF47A53B),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showErrorMassage(String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(
          fontFamily: 'PoppinsRegular',
        ),
      ),
      backgroundColor: Color(0xFFFF2B2B),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Login",
          style: TextStyle(
            fontFamily: 'PoppinsRegular',
          ),
        ),
        backgroundColor: Color.fromARGB(255, 231, 110, 80),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10.0, left: 16.0, right: 16.0),
        child: SingleChildScrollView(
          // padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome Back',
                style: TextStyle(
                    fontSize: 27,
                    // fontWeight: FontWeight.bold,
                    fontFamily: 'PoppinsSemiBold'),
              ),
              SizedBox(
                height: 14,
              ),
              Text(
                'Login to your account',
                style: TextStyle(
                  fontFamily: 'PoppinsRegular',
                  fontSize: 17,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Username',
                style: TextStyle(fontSize: 16, fontFamily: 'PoppinsSemiBold'),
              ),
              SizedBox(
                height: 12,
              ),
              TextField(
                style: TextStyle(
                  fontFamily: 'PoppinsRegular',
                ),
                controller: emailfield,
                decoration: InputDecoration(
                  labelText: "Masukkan Email Anda",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Password',
                style: TextStyle(fontSize: 16, fontFamily: 'PoppinsSemiBold'),
              ),
              SizedBox(
                height: 12,
              ),
              TextField(
                style: TextStyle(
                  fontFamily: 'PoppinsRegular',
                ),
                controller: passfield,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Masukkan Password Anda",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              SizedBox(
                height: 13,
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forget Password?',
                    style: TextStyle(
                        fontFamily: 'PoppinsRegular',
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color.fromRGBO(207, 53, 51, 1)),
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                  child: Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                    Text(
                      "Don't have an account yet? ",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'PoppinsRegular',
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => Register(),
                        ));
                      },
                      child: Text("Sign up",
                          style: TextStyle(
                            fontFamily: 'PoppinsRegular',
                            decoration: TextDecoration.underline,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(242, 183, 0, 1),
                          )),
                    ),
                  ])),
              SizedBox(
                height: 120,
              ),
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 55,
                      width: 320,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 219, 79, 45),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {
                          login(emailfield.text, passfield.text);
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => HomeScreen(
                          //               username: datakirim.text,
                          //             )));
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontFamily: 'PoppinsRegular',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
