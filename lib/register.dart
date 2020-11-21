import 'package:flutter/gestures.dart';
import 'package:myflutter/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myflutter/routing.dart';
import 'dart:ui';
import 'package:myflutter/remote_data_source/registerSource.dart';
import 'package:http/http.dart' as http;



class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}
class _RegisterState extends State<Register> {


  static var _keyValidationFormRegister = GlobalKey<FormState>();

  TextEditingController _textEditConEmail = TextEditingController();
  TextEditingController _textEditConPassword = TextEditingController();
  TextEditingController _textEditConName = TextEditingController();
  bool isPasswordVisible = false;

  BuildContext ctx;

  String email;
  String name;
  String password;
  RegisterSource register ;

  @override
  void initState() {
    isPasswordVisible = false;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    return new Scaffold(
      backgroundColor: Color(0xFFe05e53),
      resizeToAvoidBottomPadding: true,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[

              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Lottie.asset("assets/lottie/welcom.json"),
              ),

            ],
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 0.0, right: 0.0, top: 80.0),
              child: Column(
                children: <Widget>[

                  SizedBox(
                    height: MediaQuery.of(context).size.height/6,
                  ),
                  getWidgetRegistrationCard(),


                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getWidgetRegistrationCard() {
    final FocusNode _passwordEmail = FocusNode();
    final FocusNode _passwordFocus = FocusNode();
    final FocusNode _passwordName = FocusNode();

    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0,top: 20),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 10.0,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Form(
            key: _keyValidationFormRegister,
            child: Column(
              children: <Widget>[

                Container(
                  child: TextFormField(
                    controller: _textEditConName,
                    onChanged: (value) {
                      name = value;
                    },
                    focusNode: _passwordEmail,
                    //keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: _validateName,
                    onFieldSubmitted: (String value) {
                      FocusScope.of(context).requestFocus(_passwordName);
                    },
                    decoration: InputDecoration(
                      labelText: 'User Name',
                      prefixIcon: Icon(Icons.face,
                        color: Colors.red,),

                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),

                    ),
                    cursorColor: Colors.red,
                  ),

                ),

                Container(
                  child: TextFormField(
                    controller: _textEditConEmail,
                    onChanged: (value) {
                      email = value;
                    },
                    focusNode: _passwordEmail,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: _validateEmail,
                    onFieldSubmitted: (String value) {
                      FocusScope.of(context).requestFocus(_passwordFocus);
                    },
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email,
                        color: Colors.red,),

                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),

                    ),
                    cursorColor: Colors.red,
                  ),

                ),

                Container(
                  child: TextFormField(
                    controller: _textEditConPassword,
                    onChanged: (value) {
                      password = value;
                    },
                    focusNode: _passwordFocus,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    validator: _validatePassword,
                    obscureText: !isPasswordVisible,
                    decoration: InputDecoration(
                      labelText: ' Password',
                      focusColor: Colors.red,
                      suffixIcon: IconButton(
                        icon: Icon(isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off),

                        onPressed: () {
                          setState(() {
                            isPasswordVisible =
                            !isPasswordVisible;
                          },
                          );
                        },
                      ),
                      prefixIcon: Icon(Icons.vpn_key, color: Colors.red,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
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
                    // if (_keyValidationFormRegister.currentState.validate())
                    onPressed: () async {
                      //if (_keyValidation.currentState.validate())
                      register = RegisterSource(new http.Client());
                      String response = await register (name:name, password:password,email:email);
                      print(response);
                      if(response != "Login isues")
                        Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Home(),
                            ));
                      else {
                        ///alert goes here
                      }

                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0)),
                  ),
                ), //button: login
                Container(
                    margin: EdgeInsets.only(top: 16.0, bottom: 16.0),
                  child: RichText(
                    text: TextSpan(
                        children: [
                          TextSpan(
                              text: "Already have an account?",
                              style: TextStyle(
                                fontFamily: 'SFUIDisplay',
                                color: Colors.black,
                                fontSize: 15,
                              )
                          ),
                          TextSpan(
                              recognizer: new TapGestureRecognizer()..onTap = () =>  Navigator.push(context, new RegisterToLogin()),
                              text: "login",
                              style: TextStyle(
                                fontFamily: 'SFUIDisplay',
                                color: Colors.redAccent,
                                fontSize: 15,
                              ),
                          ),
                        ]
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
  String _validateName(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Invalid Name';
    } else {
      return null;
    }
  }

  String _validatePassword(String value) {
    return value.length < 5 ? 'Min 5 char required' : null;
  }


}