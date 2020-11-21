import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

class LoginSource {
  http.Client client;
  Future<String> call(
      {@required String email, @required String password}) async {
    client = new http.Client();
    final response =
    await client.post("http://41.226.11.252:11842/users/login",
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          "email": email,
          "password": password,
        }));
    if (response.statusCode == 200)
      print("login with success");
    else {
      print("login failed");
    }
  }
}


