import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:hedomy0/signup.dart';
import 'package:http/http.dart' as http;
class data with ChangeNotifier {

  Future<void> _auth(String name, String phone, String email, String password,
      String urlsegment) async
  {
    final url = 'https://identitytoolkit.googleapis.com/v1/accounts:$urlsegment ?key=AIzaSyDBUHd99cfbkDRPJcN0-GFieQLn-2AP7ok';
    try {
      final response = await http.post(url, body: json.encode({
        'email': email,
        'password': password,
        'name': name,
        'phone': phone,
        'returnSecureToken': true,

      }),);
      final resData =json.decode(response.body);
      if(resData['error'] =null){

      }

    }
    catch (e) {
      throw e;
    }
  }

  Future <void> signup(String name, String phone, String email,
      String password) async {
    return _auth(name, phone, email, password, "signUp");
  }

  Future <void> login(String name, String phone, String email,
      String password) async {
    return _auth(name, phone, email, password, "signInWithPassword");
  }
}