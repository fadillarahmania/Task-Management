import 'package:praktikum_13_json/loginpage.dart';
import 'package:praktikum_13_json/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:google_fonts/google_fonts.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Untuk inisialisasi controller, yang akan diletakkan di text field
  TextEditingController emailfield = TextEditingController();
  TextEditingController passfield = TextEditingController();
  TextEditingController namefield = TextEditingController();

  @override
  void dispose() {
    emailfield.dispose();
    super.dispose();
  }

  String? get _errorText {
    // at any time, we can get the text from _controller.value.text
    final text = emailfield.value.text;
    // Note: you can do your own custom validation here
    // Move this logic this outside the widget for more testable code
    if (text.isEmpty) {
      return 'Can\'t be empty';
    }
    if (text.length < 4) {
      return 'Too short';
    }
    // return null if the text is valid
    return null;
  }

  // method register
  void register(String name, email, password) async {
    try {
      // ME-POST atau MENAMBAH data json dari link
      var response = await Dio().post('http://localhost:3000/users',
          data: {"name": name, "email": email, "password": password});
      if (response.statusCode == 201) {
        // status code 201 karena berhasil membuat data baru
        print("Account created successfully");
        final snackBar = SnackBar(
          backgroundColor: Color.fromRGBO(0, 137, 56, 1),
          content: Text(
            'Account created successfully',
            style: TextStyle(
              fontFamily: 'PoppinsRegular',
              color: Colors.white,
            ),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => LoginPage(),
        ));
      } else {
        print("Registration Failed");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                'Create New Account',
                style: TextStyle(
                    fontSize: 27,
                    // fontWeight: FontWeight.bold,
                    fontFamily: 'PoppinsSemiBold'),
              ),
              SizedBox(
                height: 14,
              ),
              Text(
                'Please fill field below',
                style: TextStyle(
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
                height: 8,
              ),
              TextField(
                controller: namefield,
                decoration: InputDecoration(
                  labelText: "Masukkan Nama Anda",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Email',
                style: TextStyle(fontSize: 16, fontFamily: 'PoppinsSemiBold'),
              ),
              SizedBox(
                height: 8,
              ),
              TextField(
                controller: emailfield,
                decoration: InputDecoration(
                  labelText: "Masukkan Email Anda",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Password',
                style: TextStyle(fontSize: 16, fontFamily: 'PoppinsSemiBold'),
              ),
              SizedBox(
                height: 8,
              ),
              TextField(
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
                height: 100,
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
                          register(
                              namefield.text, emailfield.text, passfield.text);
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => HomeScreen(
                          //               username: datakirim.text,
                          //             )));
                        },
                        child: Text(
                          'SIGN UP',
                          style: TextStyle(
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
