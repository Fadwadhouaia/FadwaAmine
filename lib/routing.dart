import 'package:flutter/material.dart';
import 'package:myflutter/login.dart';




class RegisterToLogin extends MaterialPageRoute<Null> {
  RegisterToLogin()
      : super(builder: (BuildContext ctx) {
    return new Login();
  });
}