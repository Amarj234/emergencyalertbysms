import 'package:doctor/findquestion/findquestion.dart';
import 'package:flutter/material.dart';

class FindQuestion extends StatelessWidget {
  const FindQuestion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color(0xFF0D47A1)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset('assets/images/f.png')),
              Padding(
                padding: const EdgeInsets.all(10),
                child: GridView.count(
                  crossAxisCount: 2,
                  primary: false,
                  shrinkWrap: true,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => const Find()));
                      },
                      child: Container(
                        child: Card(
                            color: Colors.teal[100],
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            elevation: 10,
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              child: Stack(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 60, left: 20),
                                    child: const Text(
                                      '        First Aid\nManagement Of\nSeizure At Home',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            )),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => const Find()));
                      },
                      child: Container(
                        child: Card(
                            color: Colors.teal[100],
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            elevation: 10,
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              child: Stack(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 60, left: 20),
                                    child: const Text(
                                      '        Seizure log\n            Book',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            )),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => const Find()));
                      },
                      child: Container(
                        child: Card(
                            color: Colors.teal[100],
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            elevation: 10,
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              child: Stack(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 60, left: 10),
                                    child: const Text(
                                      '        Treatment\n            Log           ',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            )),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => const Find()));
                      },
                      child: Container(
                        child: Card(
                            color: Colors.teal[100],
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            elevation: 10,
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              child: Stack(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 60, left: 10),
                                    child: const Text(
                                      '',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
