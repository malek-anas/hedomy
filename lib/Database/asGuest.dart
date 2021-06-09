
import 'package:flutter/material.dart';
import 'package:hedomy/Database/DB_Helper.dart';
import 'package:hedomy/UI/guest.dart';
import 'package:hedomy/models/prandModel.dart';
import 'package:hedomy/models/userModel.dart';



List<PrandModel> brandsList = DB.brands;
UserModel userModel;
DataBaseHelper DB=DataBaseHelper(userModel);
asGuest(BuildContext context)async{
 brandsList=await DB.showBrands();
 Navigator.push(
     context,
     MaterialPageRoute(builder: (context) => Guest(brandsList)));


}