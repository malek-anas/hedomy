import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hedomy/Database/sign_up.dart';
import 'aftersignin.dart';

class signup extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _signup();
  }
}

class _signup extends State<signup> {
  TextEditingController phone = new TextEditingController();
  TextEditingController name = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  final _x = GlobalKey<FormState>();

  Widget buildName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Name',
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 45,
          child: TextField(
            controller: name,
            keyboardType: TextInputType.text,
            style: TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 11),
                prefixIcon: Icon(
                  Icons.drive_file_rename_outline,
                  color: Color(0xff27408b),
                ),
                hintText: 'Full Name',
                hintStyle: TextStyle(
                  color: Colors.black,
                )),
          ),
        ),
      ],
    );
  }

  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextFormField(
            validator: (value) {
              RegExp RE = new RegExp(
                  r"^[A-Z|a-z]{3,20}[.|_][A-Z|a-z]{3,20}@gmail.com|@yahoo.com$");
              if (RE.hasMatch(value) == false) {
                return "Enter Correct Email";
              } else {
                return null;
              }
            },
            controller: email,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 11),
                prefixIcon: Icon(
                  Icons.email,
                  color: Color(0xff27408b),
                ),
                hintText: 'Email',
                hintStyle: TextStyle(
                  color: Colors.black,
                )),
          ),
        ),
      ],
    );
  }

  Widget buildPhone() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Phone',
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextFormField(
            validator: (value) {
              RegExp x = new RegExp(r"^(([00|+]?[2])?[0][1][0-2|5][0-9]{8}$)");
              if (x.hasMatch(value) == false) {
                return "Please Enter Phone";
              } else {
                return null;
              }
            },
            controller: phone,
            keyboardType: TextInputType.phone,
            style: TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 11),
                prefixIcon: Icon(
                  Icons.phone,
                  color: Color(0xff27408b),
                ),
                hintText: 'Phone',
                hintStyle: TextStyle(
                  color: Colors.black,
                )),
          ),
        ),
      ],
    );
  }

  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextFormField(
            validator: (value) {
              RegExp RE = new RegExp(r"^[A-Z|a-z|0-9|{$,#,&,*}]{6,100}$");
              if (RE.hasMatch(value) == false) {
                return "Please Enter Your password Correct ";
              } else {
                return null;
              }
            },
            controller: password,
            obscureText: true,
            style: TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 11),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Color(0xff27408b),
                ),
                hintText: 'Password',
                hintStyle: TextStyle(
                  color: Colors.black,
                )),
          ),
        ),
      ],
    );
  }

  Widget buildsignup(context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 40),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5,
        onPressed: () {
          setState(() {
            bool result = _x.currentState.validate();
            if (result == true) {
              signUp(email.text, password.text, name.text, phone.text, context);
            } else {
              // TODO: Notify Validation Error
            }
          });
        },
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text('Sign Up'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Color(0x8027408b),
                      Color(0x9927408b),
                      Color(0xff27408b),
                    ])),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 120,
                  ),
                  child: Form(
                    key: _x,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                          ),
                        ),
                        buildName(),
                        SizedBox(
                          height: 20,
                        ),
                        buildEmail(),
                        SizedBox(
                          height: 20,
                        ),
                        buildPhone(),
                        SizedBox(
                          height: 20,
                        ),

                        // SizedBox(height: 20,),
                        buildPassword(),
                        SizedBox(
                          height: 20,
                        ),
                        buildsignup(context)
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
