import 'package:praktikum_13_json/firstpage.dart';
import 'package:praktikum_13_json/home_page.dart';
import 'package:praktikum_13_json/update.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData.dark(),
      home: FirstPage(),
      routes: {
        'home': (context) => HomeScreen(),
        'update': (context) => updateTodo()
      },
    );
  }
}
