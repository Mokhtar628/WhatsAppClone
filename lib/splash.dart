import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'colors.dart';
import 'main.dart';




class splash extends StatefulWidget {
  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:  SplashScreen(
          seconds: 5,
          navigateAfterSeconds: home(),
          image: new Image.asset("img/whatsappwi.png"),
          backgroundColor: navColor,
          photoSize: 50.0,
          onClick: ()=>print(""),
          loadingText: Text("From Mokhtar",style: TextStyle(color: navItemsColor),),
          loaderColor: Colors.transparent,
        ),
      ),
    );
  }
}
