import 'dart:convert';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:doctor/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../servise.dart';
class SignPage extends StatefulWidget {
   SignPage({Key? key}) : super(key: key);

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {


  final _formKey = GlobalKey<FormState>();
String? errtext;
  Serves serves=Serves();

  final fistname=  TextEditingController();

  final lastname=  TextEditingController();

  final mobile=  TextEditingController();

  final email=  TextEditingController();

  final password=  TextEditingController();

  final cpassword=  TextEditingController();

  Future singUp() async{

    print('8382946376');
    if(password.text==cpassword.text) {
      var url2 = Uri.parse(serves.url + "register.php");
      var response = await http.post(url2, body: {
        'fname': fistname.text,
        'lastname': lastname.text,
        'mobile': mobile.text,
        'email': email.text,
        'password': password.text,
        'cpassword': cpassword.text,

      });
      print(response.body);
      if (response.statusCode == 200) {
        var check = jsonDecode(response.body);

        if (check == 1) {
          EasyLoading.showSuccess('Registration Success!');
          Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()),
          );
        } else {
          EasyLoading.showToast('Email already Register');

         // EasyLoading.dismiss();
        }
        // Navigator.push(
        //   context,MaterialPageRoute(builder: (context)=> autoOtp()),
        // );
      }
    }else{
      setState(() {
        errtext="Password not match";
      });
    }
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(
                  'assets/images/image.png',
                  height: 200,
                  width: 200,
                ),
                const SizedBox(height: 20,),
                Container(
                    padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                    child: SizedBox(
                      height: 40,
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        controller: fistname,
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
                            hintText: ('First Name'),
                            hintStyle: TextStyle(fontSize: 13)),
                      ),
                    )),
                Container(
                    padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                    child: SizedBox(
                      height: 40,
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        controller: lastname,
                        keyboardType: TextInputType.text,
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
                            hintText: ('Last Name'),
                            hintStyle: TextStyle(fontSize: 13)),
                      ),
                    )),
                Container(
                    padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                    child: SizedBox(
                      height: 40,
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        controller: mobile,
                        keyboardType: TextInputType.number,
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
                Container(
                    padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                    child: SizedBox(
                      height: 40,
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
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
                            hintText: ('Email'),
                            hintStyle: TextStyle(fontSize: 13)),
                      ),
                    )),
                Container(
                    padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                    child: SizedBox(
                      height: 40,
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        controller: password,
                        keyboardType: TextInputType.text,
                        enabled: true,
                        obscureText: true,
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
                            hintText: ('Password'),
                            hintStyle: TextStyle(fontSize: 13)),
                      ),
                    )),
                Container(
                    padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                    child: SizedBox(
                      height: 40,
                      child: TextFormField(
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        controller: cpassword,
                        enabled: true,
                        decoration: InputDecoration(
                          errorText: errtext,
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
                            hintText: ('Confirm Password'),
                            hintStyle: TextStyle(fontSize: 13)),
                      ),
                    )),
                // const SizedBox(
                //   height: 30,
                // ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: 40,
                    width: 250,
                    decoration: BoxDecoration(
                        color: const Color(0xFF0D47A1),
                        borderRadius: BorderRadius.circular(20)),
                    child: FlatButton(
                      onPressed: () {

                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.

                          singUp();
                        }


                      },
                      child: const Text(
                        'Sign UP',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),

    );
  }
}
