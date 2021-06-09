import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hedomy/UI/aftersignin.dart';
import 'package:hedomy/UI/show.dart';
import 'package:hedomy/models/prandModel.dart';
import 'package:hedomy/models/t-shirtModel.dart';
import 'package:hedomy/models/userModel.dart';
import 'package:image_picker/image_picker.dart';
import 'constrain.dart';

UserModel userModel;
PrandModel prandModel;
ShirtModel shirtModel;

class DataBaseHelper {
  DataBaseHelper(final userObj) {
    userModel = userObj;
  }

  pickImage() async {
    print('email ${userModel.email}');
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      image = File(pickedImage.path);
      uploadImage();
    } else {
      print('No Image selected');
    }
  }

  uploadImage() async {
    await FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(image.path).pathSegments.last}')
        .putFile(image)
        .then((value) async {
      await value.ref.getDownloadURL().then((value) {
        userModel.image = value;
        print('photo ${userModel.image}');
        update = true;
      });
    }).catchError((error) {});
  }

  updateUser(String name, String phone, String email, String image,
      BuildContext context) async {
    if (image == null) {
      uploadImage();
    }

    UserModel model = UserModel(
        name: name, phone: phone, email: email, uid: UID, image: image);
    uploadImage();

    await FirebaseFirestore.instance
        .collection('users')
        .doc(UID)
        .update(model.toMap())
        .then((value) => {
              getUserData(context),
            })
        .catchError((onError) {
      print(onError.toString());
    });
  }

  getUserData(BuildContext context) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(UID)
        .get()
        .then((value) => {
              userModel = UserModel.fromJson(value.data()),
              print('model ${userModel.name}'),
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AfterSignIn(userModel, prandModel))),
            })
        .catchError((onError) {
      print(onError.toString());
    });
  }

  List<PrandModel> brands = [];

   showBrands() async {
    brands = [];
    await FirebaseFirestore.instance.collection('brand').get().then((value) => {
          // print('val ${value.docs}')
          value.docs.forEach((element) {
            brands.add(PrandModel.fromJson(element.data()));
            print("3333 ${brands.length}");
          }),
          print("3333 ${brands[0].name}"),
      print("3333 ${brands[1].name}"),
        });
    return brands;
  }

  List<ShirtModel> shirtsList = [];

  showShirts(String name) async {
    shirtsList = [];
    await FirebaseFirestore.instance.collection(name).get().then((value) => {
          value.docs.forEach((element) {

            shirtsList.add(ShirtModel.fromJson(element.data()));
            print("2222 ${shirtsList.length}");
          }),
          print("2222 ${shirtsList[0].name}"),
        });
    return shirtsList;
  }

  List<ShirtModel> shirtList = [];

  showShirt(String name) async {
    shirtList = [];
    await FirebaseFirestore.instance.collection(name).get().then((value) => {
      value.docs.forEach((element) {

        shirtList.add(ShirtModel.fromJson(element.data()));
        print("1111 ${shirtList.length}");
      }),
      z=shirtList[0].images,
      print("zzzz$z"),

      print("1111 ${shirtList[0].name}"),
    });
    return shirtList;
  }
}
