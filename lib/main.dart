import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'aftersignin.dart';
import 'guest.dart';
import 'login.dart';


void main() {

  runApp(MaterialApp(

    debugShowCheckedModeBanner: false,
    title: "Hedomy",
    home: login(),
    //Guest(),
  ));
}

