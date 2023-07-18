import 'package:flutter/material.dart';
import 'package:praktikum_13_json/home_page.dart';

class Profile extends StatefulWidget {
  // const Profile({super.key});
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[50],
          bottomOpacity: 0.0,
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          title: Text(
            'Profile',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'PoppinsSemiBold',
            ),
          ),
        ),
        body: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(16),
            margin: EdgeInsets.only(left: 20, top: 30, bottom: 10),
            child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 30),
                    child: CircleAvatar(
                      radius: 55,
                      backgroundColor: Colors.black,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('images/fotokuu.png'),
                      ),
                    ),
                  ),
                  Card(
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.person,
                        color: Color.fromARGB(255, 216, 82, 49),
                      ),
                      title: Text(
                        'Fadilla Rahmania',
                        style: TextStyle(
                            fontSize: 15,
                            // fontWeight: FontWeight.bold,
                            fontFamily: 'PoppinsSemiBold'),
                      ),
                    ),
                  ),
                  Card(
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.email,
                        color: Color.fromARGB(255, 216, 82, 49),
                      ),
                      title: Text(
                        'fdrahmania1@gmail.com',
                        style: TextStyle(
                            fontSize: 15,
                            // fontWeight: FontWeight.bold,
                            fontFamily: 'PoppinsSemiBold'),
                      ),
                    ),
                  ),
                  Card(
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: Color.fromARGB(255, 216, 82, 49),
                      ),
                      title: Text(
                        '+63 81-3580-72433',
                        style: TextStyle(
                            fontSize: 15,
                            // fontWeight: FontWeight.bold,
                            fontFamily: 'PoppinsSemiBold'),
                      ),
                    ),
                  )
                ])));
  }
}
  // This widget is the root of your application.


