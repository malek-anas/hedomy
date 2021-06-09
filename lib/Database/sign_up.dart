import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hedomy/Database/constrain.dart';
import 'package:hedomy/models/prandModel.dart';

import 'package:hedomy/models/userModel.dart';

import '../UI/aftersignin.dart';

signUp(String email, String password, String name, String phone,
    BuildContext context) {
  FirebaseAuth.instance
      .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
      .then((value) => {
            DB.showBrands(),
            DB.showShirts(N),
            UID = value.user.uid,
            userCreate(value.user.uid, name, phone, email, context),
          })
      .catchError((onError) => {
            print(onError.toString()),
          });
}

PrandModel prandModel;

userCreate(
    String id, String name, String phone, String email, BuildContext context) {
  UserModel userModel = UserModel(
    uid: id,
    name: name,
    email: email,
    phone: phone,
    image: staticImagePath,
  );
  // print("user ${userModel.toMap()}");
  FirebaseFirestore.instance
      .collection("users")
      .doc(id)
      .set(userModel.toMap())
      .then((value) => {
            print("user ${userModel.toMap()}"),
            print("user 1234"),
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AfterSignIn(userModel, shirtModel))),
          });
}
