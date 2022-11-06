import 'package:doctor/screen/login.dart';
import 'package:doctor/screen/signup.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Container(
              //   decoration: BoxDecoration(
              //       image: DecorationImage(
              //         image: const AssetImage('assets/images/bg.jpg'),
              //         fit: BoxFit.cover,
              //         colorFilter: ColorFilter.mode(
              //             Colors.blue.withOpacity(0.5), BlendMode.dstATop),
              //       )),
              // ),
              Image.asset(
                'assets/images/image.png',
                height: 350,
                width: 350,
              ),
              const SizedBox(height: 30,),
              Container(
                height: 40,
                width: 250,
                decoration: BoxDecoration(
                    color: const Color(0xFF0D47A1),
                    borderRadius: BorderRadius.circular(20)),
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const LoginPage()));
                  },
                  child: const Text(
                    'Login ',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                height: 40,
                width: 250,
                decoration: BoxDecoration(
                    color: const Color(0xFF0D47A1),
                    borderRadius: BorderRadius.circular(20)),
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) =>  SignPage()));
                  },
                  child: const Text(
                    'Sign Up',
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
