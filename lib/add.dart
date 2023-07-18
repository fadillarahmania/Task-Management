import 'package:flutter/material.dart';
import 'package:praktikum_13_json/home_page.dart';
import 'package:praktikum_13_json/koneksi.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:http/http.dart' as http;

class addTodo extends StatefulWidget {
  const addTodo({super.key});
  @override
  State<addTodo> createState() => _addTodoState();
}

class _addTodoState extends State<addTodo> {
  TextEditingController idfield = TextEditingController();
  TextEditingController titlefield = TextEditingController();
  TextEditingController descfield = TextEditingController();
  // TextEditingController agefield = TextEditingController();
  int count = 0;
  void createTodo() {
    ApiService()
        .saveTodo(idfield.text, titlefield.text, descfield.text)
        .then((value) {
      setState(() {
        if (value) {
          showSuccessMassage('Berhasil menambah data');
          Navigator.pop(context);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
          // Alert(
          //     context: context,
          //     title: 'Success',
          //     desc: 'Data Berhasil disimpan',
          //     type: AlertType.success,
          //     buttons: [
          //       DialogButton(
          //           child: Text('ok',
          //               style: TextStyle(color: Colors.white, fontSize: 18)),
          //           onPressed: () {
          //             Navigator.of(context).popUntil((_) => count++ >= 2);
          //           })
          //     ]).show();
          // Navigator.pop(context);
        } else {
          showErrorMassage(
            'Gagal menambah data',
          );
          // Alert(
          //     context: context,
          //     title: 'Failed',
          //     desc: 'Data Gagal disimpan',
          //     type: AlertType.error,
          //     buttons: [
          //       DialogButton(
          //           child: Text('ok',
          //               style: TextStyle(color: Colors.white, fontSize: 18)),
          //           onPressed: () {
          //             Navigator.pop(context);
          //           })
          //     ]).show();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 231, 110, 80),
            title: Text(
              'Add Task',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontFamily: 'PoppinsRegular',
              ),
            )),
        body: ListView(
          padding: EdgeInsets.all(20),
          children: [
            TextField(
              controller: titlefield,
              decoration: InputDecoration(
                hintText: 'Title',
              ),
              style: TextStyle(
                fontFamily: 'PoppinsRegular',
              ),
            ),
            TextField(
              controller: descfield,
              decoration: InputDecoration(hintText: 'Description'),
              keyboardType: TextInputType.multiline,
              minLines: 5,
              maxLines: 8,
              style: TextStyle(
                fontFamily: 'PoppinsRegular',
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              height: 45,
              width: 320,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 216, 82, 49),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: createTodo,
                child: Text(
                  'Save',
                  style: TextStyle(fontSize: 18, fontFamily: 'PoppinsRegular'),
                ),
              ),
            )
            // ElevatedButton(
            //     onPressed: createTodo,
            //     child: Text(
            //       'Simpan',
            //       style: TextStyle(
            //         fontFamily: 'PoppinsSemiBold',
            //       ),
            //     ))
          ],
        ));
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
}
