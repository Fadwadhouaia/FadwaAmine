
import 'package:flutter/material.dart';
import 'components/curved-left-shadow.dart';
import 'components/curved-left.dart';
import 'components/curved-right-shadow.dart';
import 'components/curved-right.dart';
import 'package:lottie/lottie.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}
class _LoginState extends State<Login> {
  static var _keyValidationForm = GlobalKey<FormState>();
  TextEditingController _textEditConName = TextEditingController();
  TextEditingController _textEditConEmail = TextEditingController();
  TextEditingController _textEditConPassword = TextEditingController();
  TextEditingController _textEditConConfirmPassword = TextEditingController();
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;




  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          //_clipper(),
          Container(
            height: size.height,
            width: size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,

                  child: Lottie.asset('assets/lottie/welcom.json',
                  height: 250,
                  width: 300)
                ),
                getWidgetRegistrationCard()
              ],
            ),
          ),
        ],
      ),

    );
  }


Widget getWidgetRegistrationCard() {
  final FocusNode _passwordEmail = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _passwordConfirmFocus = FocusNode();

  return Padding(
    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
    child: Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 10.0,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Form(
          key: _keyValidationForm,
          child: Column(
            children: <Widget>[
             // Container(
               // alignment: Alignment.center,
              //  width: double.infinity,
                //child: Image(
                  //image:
                //  AssetImage('assets/images/w3.png'),
                //  height: 200.0,
              //    width: 150.0,
              //  ),
            //  ), // title: login
              Container(
                child: TextFormField(
                  controller: _textEditConName,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  validator: _validateUserName,
                  onFieldSubmitted: (String value) {
                    FocusScope.of(context).requestFocus(_passwordEmail);
                  },
                  decoration: InputDecoration(
                      labelText: 'Full name',
                      //prefixIcon: Icon(Icons.email),
                      icon: Icon(Icons.perm_identity)),
                ),
              ), //text field : user name
              Container(
                child: TextFormField(
                  controller: _textEditConEmail,
                  focusNode: _passwordEmail,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: _validateEmail,
                  onFieldSubmitted: (String value) {
                    FocusScope.of(context).requestFocus(_passwordFocus);
                  },
                  decoration: InputDecoration(
                      labelText: 'Email',
                      //prefixIcon: Icon(Icons.email),
                      icon: Icon(Icons.email)),
                ),
              ), //text field: email
              Container(
                child: TextFormField(
                  controller: _textEditConPassword,
                  focusNode: _passwordFocus,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  validator: _validatePassword,
                  onFieldSubmitted: (String value) {
                    FocusScope.of(context)
                        .requestFocus(_passwordConfirmFocus);
                  },
                  obscureText: !isPasswordVisible,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon(isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                      ),
                      icon: Icon(Icons.vpn_key)),
                ),
              ), //text field: password
              Container(
                child: TextFormField(
                    controller: _textEditConConfirmPassword,
                    focusNode: _passwordConfirmFocus,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    validator: _validateConfirmPassword,
                    obscureText: !isConfirmPasswordVisible,
                    decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        suffixIcon: IconButton(
                          icon: Icon(isConfirmPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              isConfirmPasswordVisible =
                              !isConfirmPasswordVisible;
                            });
                          },
                        ),
                        icon: Icon(Icons.vpn_key))),
              ),
              Container(
                margin: EdgeInsets.only(top: 32.0),
                width: double.infinity,
                child: RaisedButton(
                  color:Colors.white,
                  textColor: Colors.redAccent,
                  elevation: 5.0,
                  padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                  child: Text(
                    'Register',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  onPressed: () {
                    if (_keyValidationForm.currentState.validate()) {
                      _onTappedButtonRegister();
                    }
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0)),
                ),
              ), //button: login
              Container(
                  margin: EdgeInsets.only(top: 16.0, bottom: 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Already Register? ',
                      ),
                      InkWell(
                        splashColor: Colors.redAccent.withOpacity(0.5),
                        onTap: () {
                          _onTappedTextlogin();
                        },
                        child: Text(
                          ' Login',
                          style: TextStyle(
                              color: Colors.redAccent,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    ),
  );
}

String _validateUserName(String value) {
  return value.trim().isEmpty ? "Name can't be empty" : null;
}

String _validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value)) {
    return 'Invalid Email';
  } else {
    return null;
  }
}

String _validatePassword(String value) {
  return value.length < 5 ? 'Min 5 char required' : null;
}

String _validateConfirmPassword(String value) {
  return value.length < 5 ? 'Min 5 char required' : null;
}

void _onTappedButtonRegister() {}

void _onTappedTextlogin() {}
}

_clipper() {
  return Stack(
    children: <Widget>[
      Positioned(top: 0, left: 0, child: CurvedLeftShadow()),
      Positioned(top: 0, left: 0, child: CurvedLeft()),
      Positioned(bottom: 0, left: 0, child: CurvedRightShadow()),
      Positioned(bottom: 0, left: 0, child: CurvedRight()),

    ],

  );
}

