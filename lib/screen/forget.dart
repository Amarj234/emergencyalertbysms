import 'package:doctor/screen/cerification.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class OtpPage extends StatefulWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
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
          child: Column(children: [
            Container(
              height: 130,
              //padding: const EdgeInsets.all(1),
              child: Image.asset('assets/images/OTP.png'),
            ),
            Container(
              alignment: Alignment.topCenter,
              // padding: const  EdgeInsets.only(top:5),
              child: const Text(
                'Welcome Back!',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0D47A1)),
              ),
            ),
            const SizedBox(height:10,),
            Container(
              alignment: Alignment.topCenter,
              // padding: const  EdgeInsets.only(top:5),
              child: const Text(
                'Please Enter Your Mobile Number',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              alignment: Alignment.topCenter,
              // padding: const  EdgeInsets.only(top:5),
              child: const Text(
                'OTP is sent to your Mobile Number',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            Container(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                child: SizedBox(
                  height: 40,
                  child: TextField(
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

            // const SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.all(40),
              child: Row(
                children: const [
                  SizedBox(
                    width: 50,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 50,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 50,
                    child: TextField(
                      style: TextStyle(color: Colors.black),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 50,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 50),
                  child: const Text(
                    'do not receive otp?',
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Request again',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF0D47A1),
                      ),
                    ))
              ],
            ),
            TextButton(
                onPressed: () {},
                child: const Text(
                  'Give a Call',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF0D47A1),
                  ),
                )),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 40,
                width: 250,
                decoration: BoxDecoration(
                    color: Color(0xFF0D47A1),
                    borderRadius: BorderRadius.circular(20)),
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const Verification()));
                  },
                  child: const Text(
                    'Next',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
