import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:hedomy/Database/DB_Helper.dart';
import 'package:hedomy/Database/constrain.dart';
import 'package:hedomy/UI/edit_profile.dart';
import 'package:hedomy/UI/show.dart';
import 'package:hedomy/models/prandModel.dart';
import 'package:hedomy/models/t-shirtModel.dart';
import 'package:hedomy/models/userModel.dart';

int _currentIndex = 0;
DataBaseHelper DB = new DataBaseHelper(userModel);
var ShList;
ShirtModel shirtModel;
UserModel userModel;


List<PrandModel> brandsList = DB.brands;
List<ShirtModel> shirtBrandList = DB.shirtsList;
DateTime backButtonTime;

class AfterSignIn extends StatefulWidget {

  AfterSignIn(final userObj1,final brandObj ) {
    userModel = userObj1;
    shirtModel=brandObj;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return _AfterSignIn();
  }
}

class _AfterSignIn extends State<AfterSignIn> {
  _AfterSignIn() {
    print("obj $userModel");
  }

  List<Widget> Pages = <Widget>[
    Home(),
    Profile(),
  ];




  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body:  Pages.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.home_filled,
              color: Colors.blue[900],
            ),
            icon: Icon(Icons.home_filled),
            backgroundColor: Colors.blue[300],
            label: "Home",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.person,
              color: Colors.blue[800],
            ),
            icon: Icon(Icons.person),
            backgroundColor: Colors.blue[300],
            label: "Profile",
          ),
        ],
        type: BottomNavigationBarType.shifting,
      )
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Home();
  }
}

class _Home extends State<Home> {
  Future<bool>_onBackPress() async {
    DateTime currentTime = DateTime.now();

    bool backButton = backButtonTime == null ||
        currentTime.difference(backButtonTime) > Duration(seconds: 3);
    if (_currentIndex == 1) {
      _currentIndex = 0;
    }
    if (backButton) {
      backButtonTime = currentTime;
      showDialog(context: context
        ,builder: (context)=>AlertDialog(
          title: Text("Do you want to exit the app?"),
          actions: [
            FlatButton(onPressed: (){
              Navigator.pop(context,false);
            }, child: Text('No')),
            FlatButton(onPressed: (){
              SystemNavigator.pop();
            }, child: Text('Yes')),
          ],
        ),
      );
      // Fluttertoast.showToast(
      //   msg: "Double Click to exit app",
      //   backgroundColor: Colors.black,
      //   textColor: Colors.white,
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined),
          onPressed: () {
            setState(() {
              _currentIndex = 0;
            });
          },
        ),
        backgroundColor: Colors.blue[900],
        title: Text(
          "Home",
          style: TextStyle(
            fontSize: 25,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: WillPopScope(
        onWillPop: _onBackPress,
        child:
        Container(
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
            itemCount: DB.brands.length,
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
        ),
      ),
    );
  }
}

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Profile();
  }
}

class _Profile extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined),
          onPressed: () {
            setState(() {
              print("${_currentIndex} ali");
              _currentIndex = 0;
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AfterSignIn(userModel,shirtModel)));
            });
          },
        ),
        title: Text(
          "Profile",
          style: TextStyle(
            fontSize: 25,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: WillPopScope(
        onWillPop:(){
          setState(() {
            _currentIndex=0;
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AfterSignIn(userModel,shirtModel)));
          });
        } ,
        child: Container(
          // padding: EdgeInsets.only(top: 40),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Color(0xff27408b),
                Color(0x8027408b),
                Color(0xff27408b),
              ])),
          child: ListView(
            padding: EdgeInsets.only(left: 16, top: 25, right: 16),
            children: [

              SizedBox(
                height: 25,
              ),
              Center(
                child: Stack(
                  children: [

                    CircleAvatar(
                      radius: 85,
                      backgroundColor: Colors.black,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(userModel.image),
                        // image ==null ? NetworkImage(userModel.image) :FileImage(image),
                        radius: 80,
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              ListTile(
                title: Text("Name"),
                subtitle: Text(userModel.name),
                leading: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                // trailing: Icon(
                //   Icons.edit,
                //   color: Colors.black,
                // ),
              ),
              ListTile(
                title: Text("Phone"),
                subtitle: Text(userModel.phone),
                leading: Icon(
                  Icons.phone_android,
                  color: Colors.black,
                ),
                // trailing: Icon(
                //   Icons.edit,
                //   color: Colors.black,
                // ),
              ),
              ListTile(
                title: Text("E-mail"),
                subtitle: Text(userModel.email),
                leading: Icon(
                  Icons.email,
                  color: Colors.black,
                ),
                // trailing: Icon(
                //   Icons.edit,
                //   color: Colors.black,
                // ),
              ),
              RaisedButton(
                onPressed: () {
                  img = userModel.image;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditProfile(userModel)));
                },
                child: Text("Edit Profile"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
