import 'package:flutter/material.dart';
import 'package:praktikum_13_json/home_page.dart';
import 'package:praktikum_13_json/loginpage.dart';
// import 'package:praktikum_13_json/loginpage.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: '200605110028',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: Scaffold(
          body: Container(
        padding: const EdgeInsets.all(16),
        alignment: Alignment.center,

        // margin: M ,
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Kerja.in",
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'PoppinsSemiBold',
                    color: Color.fromARGB(255, 192, 51, 16),
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Image.asset(
                  'images/task.jpg',
                  width: 304,
                  height: 222,
                ),
                SizedBox(
                  height: 35,
                ),
                Text(
                  "Apapun Tugasnya, Kerja.in aja!",
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'PoppinsSemiBold',
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Maximize your work by making a to do list with kerja.in",
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'PoppinsRegular',
                      color: Color.fromARGB(181, 73, 85, 94)),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 150,
                ),
                SizedBox(
                  height: 55,
                  width: 320,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFD85231),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      // print('tess');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginPage(
                                  // username: datakirim.text,
                                  )));
                    },
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                          fontSize: 18, fontFamily: 'PoppinsSemiBold'),
                    ),
                  ),
                ),
              ]),
        ),
      )),
    );
  }
}
