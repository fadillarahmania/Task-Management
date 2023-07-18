import 'package:praktikum_13_json/add.dart';
import 'package:praktikum_13_json/koneksi.dart';
import 'package:praktikum_13_json/loginpage.dart';
import 'package:praktikum_13_json/model.dart';
import 'package:praktikum_13_json/update.dart';
import 'package:praktikum_13_json/profile.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Todo>? posts;
  var isLoaded = false;
  getData() async {
    posts = await ApiService().getTodos();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  FutureOr onGoBack() {
    getData();
  }

  void navigateAddTodo() {
    Route route = MaterialPageRoute(builder: (context) => addTodo());
    Navigator.push(context, route).then((value) => onGoBack());
  }

  // void navigateEditTodo() {
  //   Route route = MaterialPageRoute(builder: (context) => updateTodo());
  //   Navigator.push(context, route).then((value) => onGoBack());
  // }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kerja.in',
          style: TextStyle(
            fontFamily: 'PoppinsSemiBold',
          ),
        ),
        backgroundColor: Color.fromARGB(255, 231, 110, 80),
        // automaticallyImplyLeading: false
      ),
      body: Visibility(
        visible: isLoaded,
        child: FutureBuilder(
          future: ApiService().getTodos(),
          builder: (BuildContext context, AsyncSnapshot<List<Todo>?> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                    "Something wrong with message: ${snapshot.error.toString()}"),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              List<Todo>? todos = snapshot.data;
              return _buildListView(todos!);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => addTodo()));
          navigateAddTodo();
        },
        tooltip: 'Tambah Data',
        child: Icon(Icons.playlist_add_rounded),
        backgroundColor: Color.fromARGB(255, 231, 110, 80),
      ),
      drawer: Drawer(
        child: ListView(
          // itemCount: course.length,
          //   itemBuilder: (context, index)
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 216, 82, 49),
              ),
              accountName: Text(
                'Fadilla Rahmania',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'PoppinsSemiBold',
                ),
              ),
              accountEmail: Text(
                'fdrahmania1@gmail.com',
                style: TextStyle(
                  fontSize: 10,
                  fontFamily: 'PoppinsSemiBold',
                ),
              ),
              currentAccountPicture: CircleAvatar(
                radius: 55,
                backgroundColor: Colors.black,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('images/fotokuu.png'),
                ),
              ),
            ),
            // Color color = Color.fromARGB(255, 149, 49, 216);
            ListTile(
              leading: Icon(Icons.home),
              title: const Text('HOME'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()));
              },
            ),
            new Divider(),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              trailing: new Icon(Icons.cancel),
              title: const Text('LOGOUT'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildListView(List<Todo> todos) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListView.builder(
        itemBuilder: (context, index) {
          Todo todo = todos[index];
          final id = todo.id.toString();
          return ListTile(
            leading: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 231, 110, 80),
                child: Text(
                  '${index + 1}',
                  style: TextStyle(
                    fontFamily: 'PoppinsRegular',
                    color: Colors.white,
                  ),
                )),
            title: Text(
              todo.title,
              style: TextStyle(
                fontFamily: 'PoppinsRegular',
              ),
            ),
            subtitle: Text(
              todo.description,
              style: TextStyle(
                fontFamily: 'PoppinsRegular',
              ),
            ),
            trailing: PopupMenuButton(onSelected: (value) async {
              if (value == 'edit') {
                Navigator.popAndPushNamed(context, 'update', arguments: [
                  todo.id,
                  todo.title,
                  todo.description,
                ]);
              } else if (value == 'delete') {
                bool respon = await ApiService().deleteTodos(todo.id);
                if (respon) {
                  print('Delete Data Success');
                  showErrorMassage(
                    'Berhasil Menghapus Data',
                  );
                } else {
                  print('Delete Data Failed');
                  showErrorMassage('Gagal Menghapus Data');
                }
                getData();
              }
            }, itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text(
                    'Edit',
                    style: TextStyle(
                      fontFamily: 'PoppinsRegular',
                    ),
                  ),
                  value: 'edit',
                ),
                PopupMenuItem(
                  child: Text(
                    'Delete',
                    style: TextStyle(
                      fontFamily: 'PoppinsRegular',
                    ),
                  ),
                  value: 'delete',
                )
              ];
            }),
          );
        },
        itemCount: todos.length,
      ),
    );
  }

  void showErrorMassage(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
