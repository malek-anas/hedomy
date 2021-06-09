import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hedomy/Database/DB_Helper.dart';
import 'package:hedomy/Database/asGuest.dart';
import 'package:hedomy/Database/sign_in.dart';
import 'package:hedomy/UI/aftersignin.dart';
import 'package:hedomy/UI/edit_profile.dart';
import 'package:hedomy/UI/guest.dart';
import 'package:hedomy/UI/signup.dart';
import 'package:hedomy/models/prandModel.dart';
import 'package:hedomy/models/t-shirtModel.dart';
import 'package:hedomy/models/userModel.dart';
UserModel userModel;
ShirtModel shirtModel;
PrandModel prandModel;
DataBaseHelper DB=new DataBaseHelper(userModel);
class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

/////////////

/////////////

class _loginState extends State<login> {

  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(
          height: 10,
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
            controller: email,
            validator: (value) {
              // RegExp RE=new RegExp(r"^[A-Z|a-z]{3,20}[\s][A-Z|a-z]{3,20}$");
              RegExp RE = new RegExp(
                  r"^[A-Z|a-z]{3,20}[.|_][A-Z|a-z]{3,20}@gmail.com|@yahoo.com$");
              if (RE.hasMatch(value) == false) {
                return "Enter Correct Email";
              } else {
                return null;
              }
            },
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
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

  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(
          height: 10,
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
                contentPadding: EdgeInsets.only(top: 14),
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

  Widget buildLogin(context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 40),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5,
        onPressed: () {
          bool result = _x.currentState.validate();
          if (result == true) {
            print("true");
            signIn(email.text, password.text, context);
            // Navigator.of(context)
            //     .push(MaterialPageRoute(builder: (context) => AfterSignIn()));
            print('Login');
          } else {
            print('false');
          }

        },
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text('Login'),
      ),
    );
  }

  Widget buildSignup(context) {
    return FlatButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => signup()),
        );
      },
      child: RichText(
        text: TextSpan(children: [
          TextSpan(text: 'Dont have an Account?'),
          TextSpan(text: '  Sign Up'),
        ]),
      ),
    );
  }
  var ShList1;
  Widget buildAsaGuest(context) {
    return FlatButton(
      onPressed: () {
        asGuest(context);
        // ShList1=  DB.showBrands();
        // if(ShList1 != null){
        //   Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => Guest(ShList1)));
        // } else{
        //   print('Noooooooooo');
        // }

      },
      child: RichText(
        text: TextSpan(children: [
          TextSpan(text: 'As a guest'),
        ]),
      ),
    );
  }

  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  final _x = GlobalKey<FormState>();

@override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
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
                          'Sign In',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        buildEmail(),
                        SizedBox(
                          height: 20,
                        ),
                        buildPassword(),
                        SizedBox(
                          height: 20,
                        ),
                        buildLogin(context),
                        SizedBox(
                          height: 10,
                        ),
                        buildSignup(context),
                        SizedBox(
                          height: 30,
                        ),
                        buildAsaGuest(context),
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
