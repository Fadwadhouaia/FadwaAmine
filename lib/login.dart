import 'package:myflutter/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:ui';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myflutter/register.dart';
import 'package:myflutter/remote_data_source/loginSource.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}
class _LoginState extends State<Login> {

  static var _keyValidation = GlobalKey<FormState>();

  TextEditingController _textEditConEmail = TextEditingController();
  TextEditingController _textEditConPassword = TextEditingController();
  bool isPasswordVisible = false;

  String email;
  String password;
  LoginSource login = LoginSource();


  @override
  void initState() {
    isPasswordVisible = false;

    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    LoginSource login = LoginSource();

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
            key: _keyValidation,
            child: Column(
              children: <Widget>[

                Container(
                  child: TextFormField(
                    controller: _textEditConEmail,
                    onChanged: (value){
                      email = value;
                      print(value);
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
                    onChanged: (value){
                      password = value;
                      print(value);
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
                      'Login',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    onPressed: () async {
                     //if (_keyValidation.currentState.validate())
                      String response = await login (password:password,email:email);
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Do not have an account?',
                        ),
                        InkWell(
                          splashColor: Colors.redAccent.withOpacity(0.5),
                          onTap: () {
                            _onTappedTextlogin();
                          },
                          child: GestureDetector(
                            onTap: ()
                            {Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Register(),
                                ),
                              );
                            },
                            child: Text (' Register',
                                style: TextStyle(
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.bold)),

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