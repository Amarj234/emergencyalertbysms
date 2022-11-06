import 'dart:convert';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:doctor/page/alarm.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:doctor/page/history.dart';
import 'package:doctor/page/profile.dart';
import 'package:doctor/page/video.dart';
import 'package:doctor/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:sms_advanced/sms_advanced.dart';
import '../database.dart';
import '../findquestion/findquestion.dart';
import 'package:blinking_text/blinking_text.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:geolocator/geolocator.dart';

import '../servise.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _getPermission() async => await [
    Permission.sms,
  ].request();

  @override
  void initState() {
    super.initState();
    _getPermission();
permmition();
  }
  permmition() async{
    setname();
    await Geolocator.isLocationServiceEnabled();
  //  bool? result = await BackgroundSms.isSupportCustomSim;

  }


String? name;
  Serves serves=Serves();

    setname() async{
      SharedPreferences prefs =await SharedPreferences.getInstance();
      setState(() {
        name = prefs.getString('user');
      });
if(prefs.getString('mobile1')==null || prefs.getString('mobile2')==null ) {
  var url2 = Uri.parse(serves.url + "fetchcust.php");
  print(url2);
  var response = await http.post(url2, body: {

    'cid': prefs.getString('regid'),


  });

  if (response.statusCode == 200) {
    var state = jsonDecode(response.body);

    print(state);

      if (state[0]['mobile1'].toString() != 'null') {
        prefs.setString('mobile1', state[0]['mobile1'].toString());
      }
      if (state[0]['mobile2'].toString() != 'null') {
        prefs.setString('mobile2', state[0]['mobile2'].toString());
      }

  }
}
    }





  final dbhelper = Databasehelper.instance;

  Sendsms()async{
    String date=DateFormat.yMd().add_jm().format(DateTime.now());

    SharedPreferences prefs =await SharedPreferences.getInstance();
    var mobile1=prefs.getString('mobile1');
    var mobile2=prefs.getString('mobile2');
    var name=prefs.getString('user');

    await Permission.sms.status.isGranted;



      Map<String, dynamic> row = {
        Databasehelper.columngift: name.toString(),
        Databasehelper.columnpoint: mobile1,
        Databasehelper.columndisc1: mobile2,
        Databasehelper.columndisc: date.toString()
      };
      final id = await dbhelper.insert(row);
      print('insert row$id');
    SmsSender sender = new SmsSender();
if(mobile1!=null) {
  SmsMessage message = new SmsMessage(mobile1, 'Emergency Alert by  $name');
  message.onStateChanged.listen((state) {
    if (state == SmsMessageState.Sent) {
      print("SMS is sent!");
    } else if (state == SmsMessageState.Delivered) {
      print("SMS is delivered!");
    }
  });
  sender.sendSms(message);
} if(mobile2!=null){
      SmsMessage message1 = new SmsMessage(mobile2, 'Emergency Alert by  $name');
      message1.onStateChanged.listen((state) {
        if (state == SmsMessageState.Sent) {
          print("SMS is sent!");
        } else if (state == SmsMessageState.Delivered) {
          print("SMS is delivered!");
        }
      });
      sender.sendSms(message1);
}
    // String message = "Emergency alert by-$name  Location- https://www.google.com/maps/place/{position.longitude},{position.latitude}";
    // List<String> recipents = [mobile1.toString(), mobile2.toString()];
    //
    // _sendSMS(message, recipents);
   // Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
   // print(position.latitude);
    soundplay();
  }

  static void soundplay(){

    FlutterRingtonePlayer.play(
        fromAsset: "assets/images/amarjeet.mp3", // will be the sound on Android
        ios: IosSounds.glass 			   // will be the sound on iOS
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          elevation: 0,
          centerTitle: true,
          title:  Text(
            'Hello, $name',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
          ),
          iconTheme: const IconThemeData(color: Colors.black),
          actions: const [
            Icon(
              Icons.notifications,
              color: Colors.black,
              size: 30,
            )
          ]),
      body: name==null ? Center(child: CircularProgressIndicator()): SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: (){
                    Sendsms();
                  },
                  child: Container(
                    padding: const EdgeInsets.only(top: 40, left: 50),
                    height: 100,
                    width: 400,
                    decoration: BoxDecoration(
                        color: const Color(0xFF0D47A1),
                        borderRadius: BorderRadius.circular(20)),
                    child: const BlinkText(
                        'Emergency Set Alarm',
                        style: TextStyle(fontSize:25.0, color: Colors.white),
                        beginColor: Colors.red,
                        endColor: Colors.green,
                        times: 10,
                        duration: Duration(seconds: 1)
                    ),
                  ),
                ),
              ),
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
                            MaterialPageRoute(builder: (_) => const AlarmPage()));
                      },
                      child: Container(
                        child: Card(
                            color: Colors.indigo[100],
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
                                      padding: const EdgeInsets.only(left: 30),
                                      child: const Icon(
                                        Icons.alarm,
                                        size: 100,
                                        color: Color(0xFF0D47A1),
                                      )),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 100, left: 30),
                                    child: const Text(
                                      'Set Alarm For\n    Medicine',
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
                            MaterialPageRoute(builder: (_) => const Video()));
                      },
                      child: Container(
                        child: Card(
                            color: Colors.indigo[100],
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
                                      padding: const EdgeInsets.only(
                                          left: 20, top: 20),
                                      child: const Icon(
                                        Icons.video_collection,
                                        size: 100,
                                        color: Color(0xFF0D47A1),
                                      )),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 120, left: 40),
                                    child: const Text(
                                      'View Video',
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
                            color: Colors.indigo[100],
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
                                      padding:
                                          const EdgeInsets.only(left: 20, top: 20),
                                      child: const Icon(
                                        Icons.question_mark_rounded,
                                        size: 100,
                                        color: Color(0xFF0D47A1),
                                      )),
                                  Container(
                                    margin:
                                        const EdgeInsets.only(top: 120, left: 60),
                                    child: const Text(
                                      'F&Q',
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
                            MaterialPageRoute(builder: (_) => const History()));
                      },
                      child: Container(
                        child: Card(
                            color: Colors.indigo[100],
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
                                      padding:
                                          const EdgeInsets.only(left: 20, top: 20),
                                      child: const Icon(
                                        Icons.history,
                                        size: 100,
                                        color: Color(0xFF0D47A1),
                                      )),
                                  Container(
                                    margin:
                                        const EdgeInsets.only(top: 120, left: 20),
                                    child: const Text(
                                      'Epilepsy History',
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
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => const Profile()));
                      },
                      child: Container(
                        child: Card(
                            color: Colors.indigo[100],
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
                                      padding:
                                          const EdgeInsets.only(left: 20, top: 20),
                                      child: const Icon(
                                        Icons.person_pin,
                                        size: 100,
                                        color: Color(0xFF0D47A1),
                                      )),
                                  Container(
                                    margin:
                                        const EdgeInsets.only(top: 120, left: 50),
                                    child: const Text(
                                      'Profile',
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
                      onTap: ()async{
                        SharedPreferences prefs =await SharedPreferences.getInstance();
                        prefs.clear();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => const LoginPage()));
                      },
                      child: Container(
                        child: Card(
                            color: Colors.indigo[100],
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
                                      padding:
                                          const EdgeInsets.only(left: 30, top: 20),
                                      child: const Icon(
                                        Icons.logout,
                                        size: 100,
                                        color: Color(0xFF0D47A1),
                                      )),
                                  Container(
                                    margin:
                                        const EdgeInsets.only(top: 120, left: 50),
                                    child: const Text(
                                      'Log Out',
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
