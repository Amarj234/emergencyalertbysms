import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';

import '../screen/login.dart';
import '../servise.dart';
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}
class _ProfileState extends State<Profile> {

bool load=true;
@override
void initState() {
  super.initState();
  setname();
}

  setname()async {
    final uri = Uri.parse(serves.url+"fetchcust.php");
    SharedPreferences prefs =await SharedPreferences.getInstance();
    var cid =prefs.getString('regid');
    print(uri);
    var response = await http.post(uri,body: {
      'cid':cid,

    });
    var state= json.decode(response.body);
print(state);
    if(state[0]['firstname']!=null){
      firstname.text =state[0]['firstname'];
    }
    if(state[0]['image']!=null){
      setState(() {
        netimage = true;
      });
    }
    image1=state[0]['image'];
    if(state[0]['lastname']!=null){
      lastname.text =state[0]['lastname'];
    }
    if(state[0]['mobile']!=null){
      mobile.text =state[0]['mobile'];
    }
    if(state[0]['mobile1']!='null'){
      mobile1.text =state[0]['mobile1'];
    }
    if(state[0]['mobile2']!='null'){
      mobile2.text =state[0]['mobile2'];
    }
    if(state[0]['email']!=null){
      email.text =state[0]['email'];
    }
    if(state[0]['gender'].toString()!='null'){
      gender.text =state[0]['gender'].toString();
    }

setState((){

  load=false;
});




  }


  final firstname=  TextEditingController();
  final lastname=  TextEditingController();
  final mobile=  TextEditingController();
  final mobile1=  TextEditingController();
  final mobile2=  TextEditingController();
  final email=  TextEditingController();
  final gender=  TextEditingController();


  String? image1;
  File? image;
  final picker = ImagePicker();
  Serves serves=Serves();
  Future choiceImage()async{

    var pickedImage = await picker.getImage(
      source: ImageSource.gallery,
      maxHeight: 1800,
      maxWidth: 1800,
      imageQuality: 20,
    );
    setState(() {
      image = File(pickedImage!.path);
      print('123456   $image');
      netimage=false;
    });
  }
  String? uid;
bool netimage=false;
  Savedata() async{
    EasyLoading.show(status: 'loading...');
    SharedPreferences prefs =await SharedPreferences.getInstance();
    var cid =prefs.getString('regid');
    final uri = Uri.parse(serves.url+"fetchcust.php");
    var request = http.MultipartRequest('POST',uri);
    request.fields['fistname'] =  firstname.text;
    request.fields['lastname']= lastname.text;
    request.fields['gender']= gender.text;
    request.fields['mobile'] = mobile.text;
    request.fields['email'] =    email.text;
    request.fields['mobile1'] = mobile1.text;
    request.fields['mobile2'] =    mobile2.text;
    request.fields['uid'] =  cid.toString();
    request.fields['update'] = "";
    if(image==null) {}else{
    var images = await http.MultipartFile.fromPath("image", image!.path.toString());

      request.files.add(images);
    }
    var response = await request.send();
    var response1 = await http.Response.fromStream(response);
    if (response.statusCode == 200) {
      print('Image Uploded ${response1.body}');
      EasyLoading.showSuccess('Update Success!');
      prefs.setString('mobile1', mobile1.text);
      prefs.setString('mobile2', mobile2.text);
      setname();

      EasyLoading.dismiss();

      // Navigator.pop(context, 'OK');
    }else{
      EasyLoading.showError('Failed with Error');
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
        child:load ? Center(child: CircularProgressIndicator()) : SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only( top:0),
                child: const Text(
                  'Profile',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              const SizedBox(height: 20,),
              Align(
                alignment: Alignment.topCenter,
                child: Stack(
                  children: [
                    netimage  ? CircleAvatar(
                      radius: 70,
                      backgroundColor: Colors.cyan[100],
                      backgroundImage:  NetworkImage(serves.url+image1.toString()),
                    ): image==null ? CircleAvatar(
                      radius: 70,
                      backgroundColor: Colors.cyan[100],

                    )  : CircleAvatar(
                      radius: 70,
                      backgroundColor: Colors.cyan[100],
                      backgroundImage: FileImage(image!) ,
                    ) ,
                    Positioned(
                        right: 8,
                        top: 0,
                        child: IconButton(
                          onPressed: () {
                            choiceImage();
                          },
                          icon: const Icon(
                            Icons.camera_alt,
                            size: 50,
                            color: Color(0xFF0D47A1),
                          ),
                        ))

                  ],

                ),
              ),
              Container(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                  child: SizedBox(
                    height: 40,
                    child: TextField(
controller: firstname,
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
                          hintText: ('Fist Name'),
                          hintStyle: TextStyle(fontSize: 13)),
                    ),
                  )),
              Container(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                  child: SizedBox(
                    height: 40,
                    child: TextField(
                      controller: lastname,
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
                          hintText: ('Last name'),
                          hintStyle: TextStyle(fontSize: 13)),
                    ),
                  )),
              Container(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                  child: SizedBox(
                    height: 40,
                    child: TextField(
                      controller: gender,
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
                          hintText: ('Gender'),
                          hintStyle: TextStyle(fontSize: 13)),
                    ),
                  )
              ),

              Container(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                  child: SizedBox(
                    height: 40,
                    child: TextField(
                      controller: mobile1,
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
                          hintText: ('Member Number1'),
                          hintStyle: TextStyle(fontSize: 13)),
                    ),
                  )),

              Container(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                  child: SizedBox(
                    height: 40,
                    child: TextField(
                      controller: mobile2,
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
                          hintText: ('Member Number2'),
                          hintStyle: TextStyle(fontSize: 13)),
                    ),
                  )),

              Container(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                  child: SizedBox(
                    height: 40,
                    child: TextField(
                      controller: email,
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
                    child: TextField(
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
                          hintText: ('Mobile Number'),
                          hintStyle: TextStyle(fontSize: 13)),
                    ),
                  )),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 40,
                width: 250,
                decoration: BoxDecoration(
                    color: const Color(0xFF0D47A1),
                    borderRadius: BorderRadius.circular(20)),
                child: FlatButton(
                  onPressed: () {
                    Savedata();
                    // Navigator.push(
                    //     context,
                        // MaterialPageRoute(
                        //     builder: (_) => const NavigationPage()));
                  },
                  child: const Text(
                    'Save',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),
              ),
              // const SizedBox(
              //   height:30,
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
                    onPressed: () async{
                      SharedPreferences prefs =await SharedPreferences.getInstance();
                      prefs.clear();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const LoginPage()));
                    },
                    child: const Text(
                      'Logout',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
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
