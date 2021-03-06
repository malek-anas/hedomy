import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'addproduct.dart';

class Guest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Guest();
  }
}
Widget buildadd(context) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 40),
    width: double.infinity,
    child: RaisedButton(
      elevation: 5,
      onPressed: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => addproduct()),
        );
      },
      padding: EdgeInsets.all(15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text('Login'),
    ),
  );
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
          child: Center(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context,index){
                return Column(
                  children: [
                    Container(
                      color:  Color(0xff848ac6),
                      height: 100,
                      width: MediaQuery.of(context).size.width-50,
                      child: ListTile(
                        title: Text("Town Team",style: TextStyle(fontSize: 24),),
                        subtitle: Stack(
                          children: [
                            Text("01552639568"),
                            Padding(padding: EdgeInsets.only(top: 20),child: Text("St Al Haram "),),
                          ],
                        ),
                        leading:CircleAvatar(backgroundImage:NetworkImage("https://www.marni.com/12/12386489MT_13_n_r.jpg"),radius: 30,),
                      ),
                    ),
                    SizedBox(height: 20,),

                  ],

                );
              },
            ),
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