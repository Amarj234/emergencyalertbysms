import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:doctor/screen/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
void main() {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  AndroidAlarmManager.initialize();

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     // title: 'Flutter Demo',
      theme: ThemeData(

      ),
      home: const Splash(),
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),

    );
  }
}




