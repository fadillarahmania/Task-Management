import 'package:praktikum_13_json/model.dart';
import 'package:praktikum_13_json/home_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  var client = http.Client();
  Future<List<Todo>?> getTodos() async {
    var uri = Uri.parse('http://localhost:3000/task');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      return todoFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<bool> saveTodo(String id, String title, String description) async {
    var uri = Uri.parse('http://localhost:3000/task/?');
    final response = await client.post(uri,
// headers: {"content-type": "application/json"},
// body: profileToJson(data),
        body: ({'id': id, 'title': title, 'description': description}));
    if (response.statusCode == 201) {
      print('berhasil simpan');
      return true;
    } else {
      print('Gagal simpan');
      return false;
    }
  }

  Future deleteTodos(String id) async {
    var uri = Uri.parse('http://localhost:3000/task/' + id);
    final response = await client.delete(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future updateTodos(String id, String title, String description) async {
    var uri = Uri.parse('http://localhost:3000/task/' + id);
    final response = await client.put(uri,
        body: ({'id': id, 'title': title, 'description': description}));
    if (response.statusCode == 200) {
      print('berhasil diupdate');
      return true;
    } else {
      print('Gagal diupdate');
      return false;
    }
  }
}
