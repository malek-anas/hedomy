import 'package:flutter/material.dart';
import 'package:hedomy/Database/DB_Helper.dart';
import 'package:hedomy/Database/constrain.dart';

import 'package:hedomy/UI/showTshirt.dart';

import 'package:hedomy/models/t-shirtModel.dart';
import 'package:hedomy/models/userModel.dart';

import 'aftersignin.dart';

UserModel userModel;
DataBaseHelper DB = new DataBaseHelper(userModel);
ShirtModel shirtModel;
List<ShirtModel> shirtList = DB.shirtList;
List<ShirtModel> shirtsList = DB.shirtsList;
var shList;

class Show extends StatefulWidget {
  Show(final brandObj1) {
    shirtList = brandObj1;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Show();
  }
}

class _Show extends State<Show> {
  @override
  void initState() {
    print('shirt11 ${DB.shirtsList.length}');
    // TODO: implement initState
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        title: Text('Hedomy'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff27408b),
              Color(0x8027408b),
              Color(0xff27408b),
            ],
          ),
        ),
        child: ListView.builder(
          itemCount: shirtList.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  color: Color(0xff848ac6),
                  height: 100,
                  width: MediaQuery.of(context).size.width - 50,
                  child: ListTile(
                    onTap: () async {
                      // N="${brandsList[index].name}";
                      shirtList = await DB.showShirt("${brandsList[index].name}");
                      z=shirtList[index].images;
                      print("tarek ${shirtList[0].name}");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ShirtShow(shirtList)));
                    },
                    title: Text(
                      "${shirtList[index].name}",
                      style: TextStyle(fontSize: 24),
                    ),
                    subtitle: Stack(
                      children: [
                        Text(
                          "Size:${shirtList[index].size}",
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 22),
                          child: Text("${shirtList[index].price} L.E"),
                        ),
                      ],
                    ),
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage("${shirtList[index].image}"),
                      radius: 30,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
