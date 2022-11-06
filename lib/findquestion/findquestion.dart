import 'package:doctor/new/epilepsy.dart';
import 'package:doctor/new/identify.dart';
import 'package:doctor/new/management.dart';
import 'package:doctor/new/seizure.dart';
import 'package:flutter/material.dart';

import '../new/diazepam.dart';

class Find extends StatelessWidget {
  const Find({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Color(0xFF0D47A1)),
        automaticallyImplyLeading: true,
        elevation: 5,
        backgroundColor: Colors.white
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                  margin: const EdgeInsets.only(left: 30),
                  height: 40,
                  width: 300,
                  decoration: BoxDecoration(
                      color: const Color(0xFF0D47A1),
                      borderRadius: BorderRadius.circular(20)),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const SeizurePage()));
                    },
                    child: const Text(
                      'What are the warning signs of epilepsy ?',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.only(left: 30),
                height: 40,
                width: 300,
                decoration: BoxDecoration(
                    color: const Color(0xFF0D47A1),
                    borderRadius: BorderRadius.circular(20)),
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const Identity()));
                  },
                  child: const Text(
                    'Can epilepsy be cured?',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),
              ),
              // const SizedBox(height: 20,),
              // Container(
              //   margin: EdgeInsets.only(left: 30),
              //   height: 40,
              //   width: 300,
              //   decoration: BoxDecoration(
              //       color: const Color(0xFF0D47A1),
              //       borderRadius: BorderRadius.circular(20)),
              //   child: FlatButton(
              //     onPressed: () {
              //       Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (_) => const Management()));
              //     },
              //     child: const Text(
              //       'Can epilepsy be cured?',
              //       style: TextStyle(fontSize: 14, color: Colors.white),
              //     ),
              //   ),
              // ),
              const SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.only(left: 30),
                height: 40,
                width: 300,
                decoration: BoxDecoration(
                    color: const Color(0xFF0D47A1),
                    borderRadius: BorderRadius.circular(20)),
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const Identity()));
                  },
                  child: const Text(
                    'Can you live a normal life with epilepsy? ',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.only(left: 30),
                height: 40,
                width: 300,
                decoration: BoxDecoration(
                    color: const Color(0xFF0D47A1),
                    borderRadius: BorderRadius.circular(20)),
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const Epilepsy()));
                  },
                  child: const Text(
                    'Does epilepsy cause brain damage?',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Container   (
                margin: EdgeInsets.only(left: 30),
                height: 40,
                width: 300,
                decoration: BoxDecoration(
                    color: const Color(0xFF0D47A1),
                    borderRadius: BorderRadius.circular(20)),
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const  Diazepam()));
                  },
                  child: const Text(
                    'Has epilepsy been cured?',
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
