import 'package:flutter/material.dart';
import 'signup.dart';
int _currentIndex = 0;

class AfterSignIn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return _AfterSignIn();
  }
}

class _AfterSignIn extends State<AfterSignIn> {
  var context;


  List<Widget> Pages = <Widget>[
    Home(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Pages.elementAt(_currentIndex),
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
      ),
    );
  }
}

Widget Home() {
  return Scaffold(
    appBar: AppBar(
      title: Text("Home"),
      centerTitle: true,
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
              ])),
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                color: Colors.blue[300],
                height: 100,
                width: MediaQuery.of(context).size.width - 50,
                child: ListTile(
                  title: Text(
                    "Town Team",
                    style: TextStyle(fontSize: 24),
                  ),
                  subtitle: Stack(
                    children: [
                      Text("01552639568"),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text("St Al Haram "),
                      ),
                    ],
                  ),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://www.marni.com/12/12386489MT_13_n_r.jpg"),
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

// class Profile extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//     appBar: AppBar(
//       leading: IconButton(
//         icon: Icon(Icons.arrow_back_outlined,),
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => AfterSignIn()),
//           );
//         },
//       ),
//     ),
//   );
//   }
//
// }
Widget Profile() {
  return Scaffold(
    appBar: AppBar(
      // leading: IconButton(
      //   icon: Icon(Icons.arrow_back_outlined),
      //   onPressed: () {
      //     Navigator.of().push(MaterialPageRoute(builder: (context)=>Home()));
      //   },
      // ),
      title: Text("Profile"),
      centerTitle: true,
    ),
    body: Container(
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
          Text(
            "Edit Profile",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Center(
            child: Stack(
              children: [
                Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                      border: Border.all(width: 4, color: Colors.black),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 5,
                          color: Colors.black.withOpacity(0.1),
                          offset: Offset(0, 10),
                        )
                      ],
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://www.marni.com/12/12386489MT_13_n_r.jpg"),
                        fit: BoxFit.cover,
                      )),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 4,
                        ),
                        color: Colors.blueAccent),
                    height: 40,
                    width: 40,
                    child: InkWell(
                      child: Icon(
                        Icons.edit,
                        color: Colors.black,
                      ),
                      onTap: () {},
                    ),
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
            subtitle: Text("Tarek Elsayed"),
            leading: Icon(
              Icons.person,
              color: Colors.black,
            ),
            trailing: Icon(
              Icons.edit,
              color: Colors.black,
            ),
          ),
          ListTile(
            title: Text("Phone"),
            subtitle: Text("01156144199"),
            leading: Icon(
              Icons.phone,
              color: Colors.black,
            ),
            trailing: Icon(
              Icons.edit,
              color: Colors.black,
            ),
          ),
          ListTile(
            title: Text("E-mail"),
            subtitle: Text("Tarek.elside@yahoo.com"),
            leading: Icon(
              Icons.email,
              color: Colors.black,
            ),
            trailing: Icon(
              Icons.edit,
              color: Colors.black,
            ),
          )
        ],
      ),
    ),
  );
}
