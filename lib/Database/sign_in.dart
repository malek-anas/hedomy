import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hedomy/Database/constrain.dart';
import 'package:hedomy/UI/aftersignin.dart';
import 'package:hedomy/models/prandModel.dart';
import 'package:hedomy/models/t-shirtModel.dart';
import 'package:hedomy/models/userModel.dart';

UserModel userModel;
ShirtModel shirtModel;

signIn(String email, String password, BuildContext context) async {

  await FirebaseAuth.instance
      .signInWithEmailAndPassword(email: email, password: password)
      .then((value) async => {
            DB.showBrands(),
            DB.showShirts(N),
            UID = value.user.uid,
            await FirebaseFirestore.instance
                .collection('users')
                .doc(value.user.uid)
                .get()
                .then((value) async => {
                      userModel = UserModel.fromJson(value.data()),

                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  AfterSignIn(userModel,shirtModel))),
                    }),
          });
}
