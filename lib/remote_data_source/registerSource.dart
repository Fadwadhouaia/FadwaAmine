import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

class RegisterSource {
  final http.Client client;

  RegisterSource(this.client);
  Future<String> call(
      {@required String name,
        @required String password,
        @required String email}) async {
    final response = await client.post("http://41.226.11.252:11842/users/register/",
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          "name": name,
          "email": email,
          "password": password,

        }));

    if (response.statusCode == 200)
      print("register with success");
    else {
      print("register with failed");
    }
  }
}