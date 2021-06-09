import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'addproduct.dart';
import 'guest.dart';

class addproduct extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _addproduct();
  }
}
Widget buildnewadd(context) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 40),
    width: double.infinity,
    child: RaisedButton(
      elevation: 5,
      onPressed: (){

      },
      padding: EdgeInsets.all(15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text('Add Product'),
    ),
  );
}

class _addproduct extends State<Guest> {
  @override
  Widget build(BuildContext context) {
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
            itemCount: 10,
            itemBuilder: (context,index){
              return Column(
                children: [

                  SizedBox(height: 20,),
                  buildnewadd(context),

                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
// Image.asset("photos/shirt.jpg"),
// Container(margin: EdgeInsets.only(top: 25),
//   height: 60,width: 60,
//   color: Colors.brown,
//   child:Image.asset("photos/shirt.jpg"),
// ) ,