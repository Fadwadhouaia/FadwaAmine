import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

class LoginScreen {
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
      return getToken(json.decode(response.body));
    else {
      return "Login isues";
    }
  }
}

String getToken(Map<String, dynamic> json) {
  return json['token'];
}
