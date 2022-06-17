import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coba_youtube/auth_controller.dart';
import 'package:coba_youtube/detail_bp.dart';
import 'package:coba_youtube/detail_br.dart';
import 'package:coba_youtube/detail_cl.dart';
import 'package:coba_youtube/detail_nvr.dart';
import 'package:coba_youtube/detail_ost.dart';
import 'package:coba_youtube/detail_ss.dart';
import 'package:coba_youtube/switch_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondPage extends StatelessWidget {
  String email;
  SecondPage({Key? key, required this.email}) : super(key: key);

  final SwitchController v = Get.put(SwitchController());
  static final List<Widget> tabBar = [
    Tab(
      text: "On Going",
    ),
    Tab(
      text: "Completed",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference drama = firestore.collection("drama");
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: tabBar.length,
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 20, 30, 97),
        appBar: AppBar(
          // leading: Container(),
          title: Text("K-DRAMA"),
          backgroundColor: Colors.pinkAccent,
          bottom: TabBar(tabs: tabBar),
          flexibleSpace: Obx(
            () => Container(
              color: v.switchValue.value ? Color.fromARGB(255, 20, 30, 97) : Colors.pinkAccent,
            ),
          ),
          actions: [
            Obx(() => Switch(
                value: v.switchValue.value,
                onChanged: (value) {
                  v.switchValue(value);
                },
                inactiveThumbColor: Colors.white,
                inactiveTrackColor: Color.fromARGB(255, 20, 30, 97),
                activeColor: Colors.pinkAccent,
                activeTrackColor: Colors.white,
                ))
          ],
        ),
        drawer: Drawer(
          // backgroundColor: Colors.pinkAccent,
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: <Color>[
                    Colors.pink,
                    Colors.pinkAccent
                  ])
                ),
                child : Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/images/logo.png"),
                        backgroundColor: Colors.white,
                        radius: 50,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Welcome",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight + Alignment(0, .4),
                      child: Text(
                        email,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16
                        ),
                      ),
                    )
                  ],
                ),
                ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Home",),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return SecondPage(email: '',);
                  }));
                },
              ),
              ListTile(
                leading: Icon(Icons.fiber_new),
                title: Text("On-Going"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return SecondPage(email: '',);
                  }));
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text("Log out"),
                onTap: () {
                  AuthController.instance.logOut();
                },
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Obx(
                    () => Container(
                    margin: EdgeInsets.symmetric(horizontal: 2, vertical: 15),
                    child: Card(
                      color: v.switchValue.value ? Colors.white : Colors.pinkAccent,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(
                            image: AssetImage("assets/images/bp.jpg"),
                            width: mediaQueryWidth / 3,
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(top: 30, left: 5, right: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Bussiness Proposal",
                                  style: TextStyle(
                                      fontSize: 26,
                                      color: v.switchValue.value ? Color.fromARGB(255, 20, 30, 97) : Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Rating : 11,0%",
                                  style: TextStyle(
                                      fontSize: 18, color: v.switchValue.value ? Color.fromARGB(255, 20, 30, 97) : Colors.white),
                                ),
                                Text(
                                  "2022",
                                  style: TextStyle(
                                      fontSize: 16, color: v.switchValue.value ? Color.fromARGB(255, 20, 30, 97) : Colors.white),
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (_) {
                                        return DetailTiga();
                                      }));
                                    },
                                    child: Text("Next"),
                                    style: ElevatedButton.styleFrom(
                                        primary:
                                            Color.fromARGB(255, 20, 30, 97))),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ),
                  Obx(
                  () => Container(
                    margin: EdgeInsets.symmetric(
                    horizontal: 4,
                    ),
                    child: Card(
                      color: v.switchValue.value ? Colors.white : Colors.pinkAccent,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(
                            image: AssetImage("assets/images/cl.jpg"),
                            width: mediaQueryWidth / 3,
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(top: 40, left: 55, right: 55),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Crazy Love",
                                  style: TextStyle(
                                      fontSize: 26,
                                      color: v.switchValue.value ? Color.fromARGB(255, 20, 30, 97) : Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Rating : 2,2%",
                                  style: TextStyle(
                                      fontSize: 18, color: v.switchValue.value ? Color.fromARGB(255, 20, 30, 97) : Colors.white,),
                                ),
                                Text(
                                  "2022",
                                  style: TextStyle(
                                      fontSize: 16, color: v.switchValue.value ? Color.fromARGB(255, 20, 30, 97) : Colors.white,),
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (_) {
                                        return DetailDua();
                                      }));
                                    },
                                    child: Text("Next"),
                                    style: ElevatedButton.styleFrom(
                                        primary:
                                            Color.fromARGB(255, 20, 30, 97))),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ), 
                  ),
                  
                  Obx(
                    () => Container(
                    margin: EdgeInsets.symmetric(horizontal: 4, vertical: 15),
                    child: Card(
                      color: v.switchValue.value ? Colors.white : Colors.pinkAccent,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(
                            image: AssetImage("assets/images/ost.jpeg"),
                            width: mediaQueryWidth / 3,
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(top: 30, left: 32, right: 32),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Soundtrack #1",
                                  style: TextStyle(
                                      fontSize: 26,
                                      color: v.switchValue.value ? Color.fromARGB(255, 20, 30, 97) : Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Rating : 8,0%",
                                  style: TextStyle(
                                      fontSize: 18, color: v.switchValue.value ? Color.fromARGB(255, 20, 30, 97) : Colors.white,),
                                ),
                                Text(
                                  "2022",
                                  style: TextStyle(
                                      fontSize: 16, color: v.switchValue.value ? Color.fromARGB(255, 20, 30, 97) : Colors.white,),
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (_) {
                                        return DetailEmpat();
                                      }));
                                    },
                                    child: Text("Next"),
                                    style: ElevatedButton.styleFrom(
                                        primary: Color.fromARGB(255, 20, 30, 97))),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ), 
                  Obx(
                    () => Container(
                    margin: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                    child: Card(
                      color: v.switchValue.value ? Colors.white : Colors.pinkAccent,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(
                            image: AssetImage("assets/images/ss.jpg"),
                            width: mediaQueryWidth / 3,
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(top: 40, left: 40, right: 32),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Shooting Star",
                                  style: TextStyle(
                                      fontSize: 26,
                                      color: v.switchValue.value ? Color.fromARGB(255, 20, 30, 97) : Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Rating : 1,6%",
                                  style: TextStyle(
                                      fontSize: 18, color: v.switchValue.value ? Color.fromARGB(255, 20, 30, 97) : Colors.white,),
                                ),
                                Text(
                                  "2022",
                                  style: TextStyle(
                                      fontSize: 16, color: v.switchValue.value ? Color.fromARGB(255, 20, 30, 97) : Colors.white,),
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (_) {
                                        return DetailEnam();
                                      }));
                                    },
                                    child: Text("Next"),
                                    style: ElevatedButton.styleFrom(
                                        primary: Color.fromARGB(255, 20, 30, 97))),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ), 
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Obx(
                    () => Container(
                    margin: EdgeInsets.symmetric(horizontal: 4, vertical: 15),
                    child: Card(
                      color: v.switchValue.value ? Colors.white : Colors.pinkAccent,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(
                            image: AssetImage("assets/images/br.jpg"),
                            width: mediaQueryWidth / 3,
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(top: 45, left: 15, right: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Backstreet Rookie",
                                  style: TextStyle(
                                      fontSize: 26,
                                      color: v.switchValue.value ? Color.fromARGB(255, 20, 30, 97) : Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Rating : 9,5%",
                                  style: TextStyle(
                                      fontSize: 18, color: v.switchValue.value ? Color.fromARGB(255, 20, 30, 97) : Colors.white,),
                                ),
                                Text(
                                  "2020",
                                  style: TextStyle(
                                      fontSize: 16, color: v.switchValue.value ? Color.fromARGB(255, 20, 30, 97) : Colors.white,),
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (_) {
                                        return DetailSatu();
                                      }));
                                    },
                                    child: Text("Next"),
                                    style: ElevatedButton.styleFrom(
                                        primary:
                                            Color.fromARGB(255, 20, 30, 97))),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ),
                  
                  Obx(
                    () => Container(
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    child: Card(
                      color: v.switchValue.value ? Colors.white : Colors.pinkAccent,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(
                            image: AssetImage("assets/images/nvr.jpg"),
                            width: mediaQueryWidth / 3,
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(top: 40, left: 40, right: 40),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Nevertheless",
                                  style: TextStyle(
                                      fontSize: 26,
                                      color: v.switchValue.value ? Color.fromARGB(255, 20, 30, 97) : Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Rating : 2,5%",
                                  style: TextStyle(
                                      fontSize: 18, color: v.switchValue.value ? Color.fromARGB(255, 20, 30, 97) : Colors.white,),
                                ),
                                Text(
                                  "2021",
                                  style: TextStyle(
                                      fontSize: 16, color: v.switchValue.value ? Color.fromARGB(255, 20, 30, 97) : Colors.white,),
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (_) {
                                        return DetailLima();
                                      }));
                                    },
                                    child: Text("Next"),
                                    style: ElevatedButton.styleFrom(
                                        primary:
                                            Color.fromARGB(255, 20, 30, 97))),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ), 
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}