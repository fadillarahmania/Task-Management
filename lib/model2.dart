import 'dart:convert';

class Profile {
  dynamic id;
  String password;
  String email;
  Profile({
    required this.id,
    required this.email,
    required this.password,
  });
  factory Profile.fromJson(Map<String, dynamic> map) {
    return Profile(
        id: map["id"], password: map["password"], email: map["email"]);
  }
  Map<String, dynamic> toJson() {
    return {"id": id, "email": email, "password": password};
  }

  @override
  String toString() {
    return 'Profile{id: $id, password: $password, email: $email}';
  }
}

List<Profile> profileFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Profile>.from(data.map((item) => Profile.fromJson(item)));
}

String profileToJson(Profile data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
