import 'dart:async';
import 'package:doctor/screen/page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'navigation.dart';


class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () => checksesiion());
  }


  checksesiion() async{

    SharedPreferences prefs =await SharedPreferences.getInstance();
    print(prefs.getString('check'));
    if(prefs.getString('check')=='1'){

      Navigator.push(
        context,MaterialPageRoute(builder: (context)=> NavigationPage()),
      );

    }else{
      Navigator.push(
        context,MaterialPageRoute(builder: (context)=> MainPage()),
      );
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color(0xFF4385f5),
      body:  Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image:
            DecorationImage(image: AssetImage('assets/images/rss.jpg'),
              // fit: BoxFit.fill




            ))
        ,
      ),


    );
  }
}
