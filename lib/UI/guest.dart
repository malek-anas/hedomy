import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hedomy/Database/DB_Helper.dart';
import 'package:hedomy/UI/aftersignin.dart';
import 'package:hedomy/UI/show.dart';
import 'package:hedomy/models/prandModel.dart';
import 'package:hedomy/models/userModel.dart';
UserModel userModel;
DataBaseHelper DB = new DataBaseHelper(userModel);

List<PrandModel> brandsList = DB.brands;
class Guest extends StatefulWidget {
  Guest(final brandObj1) {

    brandsList = brandObj1;
  }
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Guest();
  }
}
class _Guest extends State<Guest> {



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      appBar: AppBar(
        backgroundColor:  Colors.blue[900],
        centerTitle: true,
        title: Text(
          "Hedomy",
          style: TextStyle(
            fontSize: 25,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          padding: EdgeInsets.only(top: 20),
          decoration: BoxDecoration(

            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0x8027408b),
                Color(0x9927408b),
                Color(0xff27408b),
              ]
            )
          ),
          child: ListView.builder(
            itemCount: brandsList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    color: Color(0xff848ac6),
                    height: 100,
                    width: MediaQuery.of(context).size.width - 50,
                    child: ListTile(
                      onTap: ()async{
                        // N="${brandsList[index].name}";
                        ShList= await DB.showShirts("${brandsList[index].name}");

                        print("tarek ${ShList[0].name}");
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Show(ShList)));
                      },
                      title: Text(
                        "${brandsList[index].name}",
                        style: TextStyle(fontSize: 24),
                      ),
                      subtitle: Stack(
                        children: [
                          Text("${brandsList[index].phone}"),
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text("${brandsList[index].address}"),
                          ),
                        ],
                      ),
                      leading: CircleAvatar(
                        backgroundImage:
                        NetworkImage("${brandsList[index].image}"),
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
          // ListView.builder(
          //  itemCount:DB.brands.length,
          //   itemBuilder: (context,index){
          //    return Column(
          //      children: [
          //        Container(
          //          color:  Color(0xff848ac6),
          //          height: 100,
          //          width: MediaQuery.of(context).size.width-50,
          //          child: ListTile(
          //            title: Text("${brandsList[index].name}",
          //              style: TextStyle(fontSize: 24),),
          //            subtitle: Stack(
          //              children: [
          //                Text("${brandsList[index].phone}"),
          //                Padding(padding: EdgeInsets.only(top: 20),child: Text("${brandsList[index].address} "),),
          //
          //              ],
          //            ),
          //            leading:CircleAvatar(
          //              backgroundImage:
          //              NetworkImage("${brandsList[index].image}"),
          //              radius: 30,),
          //          ),
          //        ),
          //        SizedBox(height: 20,),
          //      ],
          //    );
          //   },
          // ),
        ),
      ),
    );
  }
}
