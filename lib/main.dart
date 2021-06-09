import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hedomy/UI/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    theme: ThemeData.dark(),
    debugShowCheckedModeBanner: false,
    title: 'Hedomy',
    home: login(),
    //Guest(),
  ));
}
