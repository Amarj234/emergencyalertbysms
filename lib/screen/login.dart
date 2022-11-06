import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:doctor/screen/forget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../servise.dart';
import 'navigation.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  Serves serves=Serves();



  final email=  TextEditingController();

  final password=  TextEditingController();



   logIn() async{


    var url2 = Uri.parse(serves.url+"login.php");
    print(url2);
    var response = await http.post(url2, body: {

      'email':email.text,
      'password': password.text,


    });

    if (response.statusCode == 200) {

      var data =jsonDecode(response.body);
print(data);
      if(data['check']==1){

        EasyLoading.showSuccess('Login Success!');
        setsesiion(data['check'].toString(),data['user'].toString(),data['regid'].toString(),  );
        Navigator.push(
          context,MaterialPageRoute(builder: (context)=> NavigationPage()),
        );
      }else{
        EasyLoading.showToast('Email Or Password Wrrong');
      }
      // Navigator.push(
      //   context,MaterialPageRoute(builder: (context)=> autoOtp()),
      // );
    }
  }


  setsesiion(String check,String name,String regid,)async{
    SharedPreferences prefs =await SharedPreferences.getInstance();
    prefs.setString('check', '1');
    prefs.setString('user', name);
    prefs.setString('regid', regid);
  }



  DateTime? currentBackPressTime;
  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      SystemNavigator.pop();

      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFF0D47A1)),
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
      ),
      body:WillPopScope(
        onWillPop: onWillPop ,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                padding: const EdgeInsets.only(top: 30),
                height: 150,
                //padding: const EdgeInsets.all(1),
                child: Image.asset(
                  'assets/images/Log.png',
                  color: const Color(0xFF0D47A1),
                ),
              ),
              Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.only(top: 10),
                child: const Text(
                  'Welcome Back!',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0D47A1),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.topCenter,
                // padding: const  EdgeInsets.only(top:5),
                child: const Text(
                  'Please login your account',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                  child: SizedBox(
                    height: 40,
                    child: TextField(
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      enabled: true,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 1,
                                color: Color(0xFF0D47A1),
                              ),
                              borderRadius: BorderRadius.circular(20)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 1,
                                color: Color(0xFF0D47A1),
                              ),
                              borderRadius: BorderRadius.circular(20)),
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 1,
                                color: Color(0xFF0D47A1),
                              ),
                              borderRadius: BorderRadius.circular(20)),
                          hintText: ('Enter Mobile number'),
                          hintStyle: TextStyle(fontSize: 13)),
                    ),
                  )),
              const SizedBox(
                height: 30,
              ),
              Container(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                  child: SizedBox(
                    height: 40,
                    child: TextField(
                      controller: password,
                      enabled: true,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 1,
                                color: Color(0xFF0D47A1),
                              ),
                              borderRadius: BorderRadius.circular(20)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 1,
                                color: Color(0xFF0D47A1),
                              ),
                              borderRadius: BorderRadius.circular(20)),
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 1,
                                color: Color(0xFF0D47A1),
                              ),
                              borderRadius: BorderRadius.circular(20)),
                          hintText: ('Enter Password'),
                          hintStyle: TextStyle(fontSize: 13)),
                    ),
                  )),
              const SizedBox(
                height: 50,
              ),
              Container(
                height: 40,
                width: 250,
                decoration: BoxDecoration(
                    color: const Color(0xFF0D47A1),
                    borderRadius: BorderRadius.circular(20)),
                child: FlatButton(
                  onPressed: () {

                        logIn();
                  },
                  child: const Text(
                    'Log In',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),
              ),
              // const SizedBox(
              //   height: 20,
              // ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const OtpPage()));
                  },
                  child: const Text(
                    'Forget Password?',
                    style: TextStyle(color: Color(0xFF0D47A1)),
                  )),
            ]),
          ),
        ),
      ),
    );
  }
}
