import 'package:coba_youtube/login_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 20, 30, 97),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage("assets/images/serie.png"),
              width: mediaQueryWidth/1,
              height: mediaQueryHeight/3,
            ),
            Container(
              margin: EdgeInsets.only(top: 50, bottom: 30),
              child: Text(
                "Cari Drama Korea Kesukaanmu Disini", 
                style: TextStyle(
                  color: Colors.white, 
                  fontSize: 20),)
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, 
                MaterialPageRoute(
                  builder: (_){
                    return LoginPage();
                    }
                    )
                    );
              }, 
              child: Text(
                "Next >>",
                style: TextStyle(
                  fontWeight: FontWeight.bold, 
                  fontSize: 20),),
              style: ElevatedButton.styleFrom(
                primary: Colors.pinkAccent),
            ),
          ],
        ),
    );
  }
}