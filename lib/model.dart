import 'dart:convert';

class Todo {
  dynamic id;
  String title;
  String description;
  // dynamic age;
  Todo({
    required this.id,
    required this.title,
    required this.description,
  });
  factory Todo.fromJson(Map<String, dynamic> map) {
    return Todo(
      id: map["id"],
      title: map["title"],
      description: map["description"],
    );
  }
  Map<String, dynamic> toJson() {
    return {"id": id, "title": title, "description": description};
  }

  @override
  String toString() {
    return 'Todo{id: $id, title: $title, description: $description}';
  }
}

List<Todo> todoFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Todo>.from(data.map((item) => Todo.fromJson(item)));
}

String todoToJson(Todo data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
