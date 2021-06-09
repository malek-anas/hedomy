import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hedomy/Database/DB_Helper.dart';
import 'package:hedomy/Database/constrain.dart';

import 'package:hedomy/models/userModel.dart';
import 'package:image_picker/image_picker.dart';
UserModel userModel;

DataBaseHelper DB=new DataBaseHelper(userModel);

class EditProfile extends StatefulWidget {
  EditProfile(final userObj) {
    userModel = userObj;
  }

  @override
  State<StatefulWidget> createState() {

    // TODO: implement createState
    return EditUserProfile();
  }
}

class EditUserProfile extends State<EditProfile> {

  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    name.text=userModel.name;
    phone.text=userModel.phone;
  }
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back_outlined),
        //   onPressed: () {},
        // ),
        actions: [
         FlatButton(
           autofocus: update,
            onPressed: ()async {

             await DB.updateUser(name.text, phone.text,userModel.email,userModel.image,context);
            },
            child: Text('Update'),
          ),
        ],
        title: Text(
          "Edit Profile",
          style: TextStyle(
            fontSize: 25,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        // padding: EdgeInsets.only(top: 40),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color(0xff27408b),
              Color(0x8027408b),
              Color(0xff27408b),
            ])),
        child: ListView(
          padding: EdgeInsets.only(left: 16, top: 25, right: 16),
          children: [

            SizedBox(
              height: 25,
            ),
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 85,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(

                      backgroundImage:
                      // NetworkImage(img),
                      userModel.image != null
                          ? NetworkImage(img)
                          : FileImage(image),
                      //
                      radius: 80,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 4,
                          ),
                          color: Colors.blueAccent,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white70,
                              blurRadius: 5,
                            ),
                          ]),
                      height: 40,
                      width: 40,
                      child: InkWell(
                        child: Icon(
                          Icons.edit,
                          color: Colors.black,
                        ),
                        onTap: () {
                        DB.pickImage();

                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            TextField(
              decoration: InputDecoration(
                prefixIcon:Icon(Icons.person_outline_outlined,color:Colors.black54,) ,
                hintText: userModel.name
              ),
              controller: name,
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone_android,color:Colors.black54,),
                  hintText: userModel.phone
              ),
              controller: phone,
            ),

          ],
        ),
      ),
    );
  }


}

