import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'aftersignin.dart';
import 'guest.dart';
import 'signup.dart';

class login extends StatefulWidget{
  @override

  _loginState createState() =>  _loginState();
}

final _keyform =GlobalKey <FormState>();

TextEditingController _email = TextEditingController();
TextEditingController _password = TextEditingController();


Widget buildEmail() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text('Email', style: TextStyle(color: Colors.white),),
      SizedBox(height: 10,),
      Container(alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black,
                  blurRadius: 6,
                  offset: Offset(0, 2)
              )
            ]
        ),
        height: 60,
        child:Form(
          key: _keyform,
        child: TextFormField(
           controller: _email,
          validator: (value){if(value.isEmpty){return 'please enter your email';}},
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
            color: Colors.black,
          ),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(Icons.email, color: Color(0xff27408b),),
              hintText: 'Email',
              hintStyle: TextStyle(
                color: Colors.black,
              )
          ),
        ),
        ),
      ),
    ],
  );
}
Widget buildPassword() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text('Password', style: TextStyle(color: Colors.white),),
      SizedBox(height: 10,),
      Container(alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black,
                  blurRadius: 6,
                  offset: Offset(0, 2)
              )
            ]
        ),
        height: 60,
        child: TextFormField(
          controller: _password,
          validator: (value){if(value.isEmpty){return 'please enter your password';}},
          obscureText: true,
          style: TextStyle(
            color: Colors.black,
          ),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(Icons.lock, color: Color(0xff27408b),),
              hintText: 'Password',
              hintStyle: TextStyle(
                color: Colors.black,
              )
          ),
        ),
      ),

    ],
  );
}
Widget buildlogin(context) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 40),
    width: double.infinity,
    child: RaisedButton(
      elevation: 5,

      onPressed: () async{
        if(_keyform.currentState.validate()){
          var result=  await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email.text, password: _password.text);
          Navigator.push(context,MaterialPageRoute(builder: (context) => AfterSignIn()),);
          if(result != null){
           print('Done');}
          else{
            print('not found');}
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
Widget buildsignup(context){
  return FlatButton(
    onPressed: (){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => signup()),
      );
    },
    child: RichText(
      text:TextSpan(
          children: [
            TextSpan(text: 'Dont have an Account?'),
            TextSpan(text: '  Sign Up'),
          ]
      ),
    ),
  );
}
Widget buildAsaguest(context){
  return FlatButton(
    onPressed: (){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Guest()),
      );
    },
    child: RichText(
      text:TextSpan(
          children: [
            TextSpan(text: 'As a guest'),
          ]
      ),
    ),
  );

}





class _loginState extends State<login> {
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
                        ]
                    )
                ),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 120,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Sign In',style:TextStyle(color: Colors.black,fontSize: 40,),),
                      SizedBox(height: 30,),
                      buildEmail(),
                      SizedBox(height: 20,),
                      buildPassword(),
                      SizedBox(height: 20,),
                      buildlogin(context),
                      SizedBox(height: 10,),
                      buildsignup(context),
                      SizedBox(height: 30,),
                      buildAsaguest(context),
                    ],
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
