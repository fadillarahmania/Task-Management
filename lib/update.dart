import 'package:praktikum_13_json/model.dart';
import 'package:flutter/material.dart';
import 'package:praktikum_13_json/koneksi.dart';
import 'package:praktikum_13_json/home_page.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:http/http.dart' as http;

class updateTodo extends StatefulWidget {
  const updateTodo({super.key});
  @override
  State<updateTodo> createState() => _updateTodoState();
}

class _updateTodoState extends State<updateTodo> {
  TextEditingController idfield = TextEditingController();
  TextEditingController titlefield = TextEditingController();
  TextEditingController descfield = TextEditingController();
  // TextEditingController agefield = TextEditingController();
  int count = 0;
  void updateTodo() {
    ApiService()
        .updateTodos(idfield.text, titlefield.text, descfield.text)
        .then((value) {
      setState(() {
        if (value) {
          // Navigator.pop(context);
          showSuccessMassage('Berhasil mengubah data');
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        } else {
          showErrorMassage('Gagal mengubah data');
          // Alert(
          //     context: context,
          //     title: 'Failed',
          //     desc: 'Data Gagal diupdate',
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
    final args = ModalRoute.of(context)?.settings.arguments as List<dynamic>;

    idfield.text = args[0].toString();
    titlefield.text = args[1];
    descfield.text = args[2];
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 231, 110, 80),
            title: Text(
              'Update Task',
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
              enabled: false,
              controller: idfield,
              decoration: InputDecoration(hintText: 'id'),
              style: TextStyle(
                fontFamily: 'PoppinsRegular',
              ),
            ),
            TextField(
              controller: titlefield,
              decoration: InputDecoration(hintText: 'Title'),
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
            SizedBox(height: 20),
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
                onPressed: updateTodo,
                child: Text(
                  'Save',
                  style: TextStyle(fontSize: 18, fontFamily: 'PoppinsRegular'),
                ),
              ),
            ),
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
