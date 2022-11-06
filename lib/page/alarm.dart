import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:in_app_notification/in_app_notification.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../database.dart';
import '../servise.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({Key? key}) : super(key: key);

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  bool isSwitched = false;
  bool areSwitched = false;
  bool wasSwitched = false;

  void initState() {
    super.initState();
    AndroidAlarmManager.initialize();

    logIn();
  }


  bool _timeSet = false;
  TimeOfDay _time = TimeOfDay.now();

  int? _hour;
  int? _minute;
  int? year;
  int? date;
  int? month;
String? update;

  DateTime timeInMillies=DateTime.now();


DateTime? currentTime;

  List<String> alarm=[];

  Cencelalarm(id)async{
    EasyLoading.show(status: 'loading...');
    SharedPreferences prefs =await SharedPreferences.getInstance();
    var cid =prefs.getString('regid');

    var url2 = Uri.parse(serves.url+"alarm.php");
    var response = await http.post(url2, body: {
      'uid':cid,
      'cencel':id.toString(),
    });
    print(id);
    if (response.statusCode == 200) {

      logIn();
      EasyLoading.show(status: 'loading...');
    }
    await AndroidAlarmManager.cancel(int.parse(id));
    FlutterRingtonePlayer.stop();
    EasyLoading.dismiss();
  }
  final dbhelper = Databasehelper.instance;

  Alarmset()async{
    SharedPreferences prefs =await SharedPreferences.getInstance();

year=currentTime!.year;
month=currentTime!.month;
date=currentTime!.day;
_hour=currentTime!.hour;
_minute=currentTime!.minute;



    print("${currentTime!.difference(timeInMillies)}");

      EasyLoading.show(status: 'loading...');

      var cid =prefs.getString('regid');
      final uri = Uri.parse(serves.url+"alarm.php");
      var request = http.MultipartRequest('POST',uri);
      request.fields['year'] =  year.toString();
      request.fields['month']= month.toString();
      request.fields['day']= date.toString();
      request.fields['hour'] = _hour.toString();
      request.fields['minute'] =    _minute.toString();
      request.fields['usid'] =  cid.toString();
    request.fields['update'] =  update!;

      var response = await request.send();
      var response1 = await http.Response.fromStream(response);
      if (response.statusCode == 200) {
        print('Image $update Uploded ${response1.body}');
        EasyLoading.showSuccess('Update Success!');
        logIn();
        var alrmid;
        if(update=="0") {
           alrmid = int.parse(response1.body);
        }else {
           alrmid=int.parse(update.toString());
        }
        EasyLoading.dismiss();

//   Map<String, dynamic> row = {
//     Databasehelper.year: year.toString(),
//     Databasehelper.month: month.toString(),
//     Databasehelper.date: date.toString(),
//     Databasehelper.hour: _hour.toString(),
//     Databasehelper.minust: _minute.toString(),
//     Databasehelper.status: '1'
//   };
//         if(update==0) {
//   final id = await dbhelper.insert(row);
//   print('insert row$id');
// }else{
//   final id = await dbhelper.update(,5);
//
// }



        AndroidAlarmManager.oneShotAt(

          // date time format (year,month,date,hour,minutes,seconds)
          DateTime(year!, month!, date!, _hour!, _minute!),
          alrmid,
          soundplay,
        );
      }else{
        EasyLoading.showError('Failed with Error');
      }



}

  List<dynamic> alarmdata=[];
  void soundplay(){
print('Alerm fire');
    FlutterRingtonePlayer.play(
        fromAsset: "assets/images/amarjeet.mp3", // will be the sound on Android
        ios: IosSounds.glass 			   // will be the sound on iOS
    );

 Showntify();
  }

  Showntify(){
    InAppNotification.show(
      child: Container(
        child: Column(
          children: [
            Text('Noteworthy')
          ],
        ),
      ),
      context: context,
      onTap: () => print('Notification tapped!'),
    );
  }




  Serves serves=Serves();
  Future logIn() async{
    print('Amarjeet');
    SharedPreferences prefs =await SharedPreferences.getInstance();
    var cid =prefs.getString('regid');

    var url2 = Uri.parse(serves.url+"alarm.php");
    var response = await http.post(url2, body: {
      'showdata':cid,
    });
    if (response.statusCode == 200) {
      var data =jsonDecode(response.body);
setState((){
  alarmdata=data;
});
    }
  }







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        actions:  [
          InkWell(
            onTap: (){
              update='0';
              _showMyDialog();
            },
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 230, 0),
              child: Icon(
                Icons.add,
                color: Color(0xFF0D47A1),
                size: 30,
              ),
            ),
          )
        ],
        title: const Text(
          'Alarm',
          style: TextStyle(
              color: Color(0xFF0D47A1),
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child:  Column(
            children:alarmdata
                .map<Padding>((dynamic item) {
                  return  Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                        onTap: (){
                          update=item['id'];
                          _showMyDialog();
                        },
                        child: Container(
                            padding: const EdgeInsets.only(top: 10),
                            height: 100,
                            width: 400,
                            decoration: BoxDecoration(
                                color: Colors.indigo[100],
                                borderRadius: BorderRadius.circular(20)),
                            child: Stack(children: [
                              ListTile(
                                leading:  Text(
                                  "${item['hour']}:${item['menuts']}",
                                  style: TextStyle(
                                      color: Color(0xFF0D47A1), fontSize: 25),
                                ),
                                title:  Text(
                                  "${item['day']}-${item['month']}-${item['year']}",
                                  style: TextStyle(
                                      color: Color(0xFF0D47A1), fontSize: 25),
                                ),
                                trailing:Switch(
                                  value:item['status']=='1' ?true :false,
                                  onChanged:  (value) {
                                    setState(() {
                                      isSwitched = value;
                                      Cencelalarm(item['id']);
                                    });
                                  },
                                  activeTrackColor: Colors.black,
                                  activeColor: Colors.green,
                                ),),
                              Container(
                                padding:const
                                EdgeInsets.only(left: 20,top: 50),
                                child:const
                                Text(
                                  'One time',
                                  style: TextStyle(color: Color(0xFF0D47A1),fontWeight: FontWeight.bold,fontSize: 16),
                                ),
                              )
                            ]
                            )),
                      ),
                    );

    }).toList(),
          ),
        ),
      ),
    );
  }

  var selectedDate;
  Future<void> _showMyDialog() async {
    return showDialog<void>(

        context: context,
        barrierDismissible: true, // user must tap button!
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return Card(
                child: AlertDialog(
                  title: const Text('Set Alarm ',
                    style: TextStyle(fontWeight: FontWeight.w800),),

                  actions: <Widget>[

                    DateTimeField(
                        initialDate: DateTime.now(),
                        decoration: InputDecoration(
                            border:  OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Colors.blue)),
                            labelText: "Date",
                            hoverColor: Colors.black12,
                            hintText: "Select Date",
                            prefixIcon: Icon(Icons.date_range)
                        ),

                        selectedDate: selectedDate,
                        onDateSelected: (DateTime value) {
                          setState(() {
                            currentTime = value;
                            selectedDate=value;
                          });
                        }),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                         Center(
                           child: ElevatedButton(onPressed: (){
                             Alarmset();
                             Navigator.pop(context);
                           },child: Text('Set'),),
                         ),
                        ],
                      ),
                    ),
                  ]
              )

              );
            },
          );
        }
    );
  }

}

