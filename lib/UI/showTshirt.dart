import 'package:flutter/material.dart';
import 'package:hedomy/Database/DB_Helper.dart';
import 'package:hedomy/Database/constrain.dart';
import 'package:hedomy/models/t-shirtModel.dart';
import 'package:hedomy/models/userModel.dart';



UserModel userModel;
DataBaseHelper DB = new DataBaseHelper(userModel);
ShirtModel shirtModel;
List<ShirtModel> shirtList = DB.shirtsList;
var shList;
class ShirtShow extends StatefulWidget {

  ShirtShow(final brandObj1) {
    shirtList = brandObj1;
  }
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ShirtShow();
  }
}

class _ShirtShow extends State<ShirtShow> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

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
        height: double.infinity,
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
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 240,
                child: ListView.builder(
                  itemCount:z.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return
                        ListViewItems(
                          imageName:z[index]
                        );
                  },
                ),
              ),
              Divider(
                color: Colors.white,
                thickness: 10,
              ),
              SizedBox(height: 22,),
              Container(
                height: 240,
                child: ListView.builder(
                  itemCount: 1,

                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          title: Text('Name'),
                          subtitle: Text('${shirtList[index].name}'),
                        ),
                        ListTile(
                          title: Text('Size'),
                          subtitle: Text('${shirtList[index].size}'),
                        ),
                        ListTile(
                          title: Text('Price'),
                          subtitle: Text('${shirtList[index].price} L.E'),
                        ),
                      ],
                    );

                  },
                ),
              ),



            ],
          ),
        ),
      ),
    );
  }
}

class ListViewItems extends StatelessWidget {
  final String imageName;

  ListViewItems({this.imageName});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 150,
      child:Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imageName),
          )
        ),
      ),
    );
  }
}
