import 'package:doctor/screen/login.dart';
import 'package:flutter/material.dart';
class Verification extends StatelessWidget {
  const Verification({Key? key}) : super(key: key);

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
          child: Column(
            children: [
              Image.asset('assets/images/otg.png'),
              const Text(
                'Please Reset Your Password',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0D47A1)),
              ),
              const SizedBox(height: 20,),
              Container(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                  child: SizedBox(
                    height: 40,
                    child: TextField(
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
                          hintText: ('New Password'),
                          hintStyle:const TextStyle(fontSize: 13,color: Color(0xFF0D47A1))),
                    ),
                  )),
              const SizedBox(height: 20,),
              Container(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                  child: SizedBox(
                    height: 40,
                    child: TextField(
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
                          hintText: ('Confirm Password'),
                          hintStyle:const TextStyle(fontSize: 13,color: Color(0xFF0D47A1))),
                    ),
                  )),
              const SizedBox(height: 30,),
              Container(
                height: 40,
                width: 250,
                decoration: BoxDecoration(
                    color: Color(0xFF0D47A1),
                    borderRadius: BorderRadius.circular(20)),
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const LoginPage()));
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
