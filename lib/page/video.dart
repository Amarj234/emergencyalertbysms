import 'package:doctor/page/youtubeplay.dart';
import 'package:flutter/material.dart';

import '../youtube1.dart';

class Video extends StatelessWidget {
  const Video({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: const Color(0xFF0D47A1),
        centerTitle: true,
        title: const Text(
          'Video',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) =>  youtubeplay()));
                },
                child: ListTile(
                  leading: Image.network('https://img.youtube.com/vi/pjmDY3tR6ak/maxresdefault.jpg'),
                  title:const Text(
                    'Epilepsy in schools: how to deal with a tonic seizure',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  // subtitle: const Text(
                  //   '      UK charity Epilepsy Action has a free online learning course for schools. The course is designed to help teachers',
                  //   style: TextStyle(
                  //       color: Colors.black,
                  //       // fontWeight: FontWeight.bold,
                  //       fontSize: 20),
                  // ),
                ),
              ),
              InkWell(
                onTap: (){
    Navigator.push(context,
    MaterialPageRoute(builder: (_) =>  youtube1()));

                },
                child: ListTile(
                  leading: Image.network('https://img.youtube.com/vi/ivunTTyNjXc/maxresdefault.jpg'),
                  title:const Text(
                    'मिर्गी के कारण, निदान और उपचार | डॉ आत्मा राम बंसाली - मेदांता अस्पताल',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  // subtitle: const Text(
                  //   '     एपिलेप्सी याने मिर्गी के दौर की बीमार जिस्में फिट बैठता है,',
                  //   style: TextStyle(
                  //       color: Colors.black,
                  //       // fontWeight: FontWeight.bold,
                  //       fontSize: 20),
                  // ),
                ),
              ),


              InkWell(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) =>  youtubeplay()));
                },
                child: ListTile(
                  leading: Image.network('https://img.youtube.com/vi/pjmDY3tR6ak/maxresdefault.jpg'),
                  title:const Text(
                    'Epilepsy in schools: how to deal with a tonic seizure',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  // subtitle: const Text(
                  //   '      UK charity Epilepsy Action has a free online learning course for schools. The course is designed to help teachers',
                  //   style: TextStyle(
                  //       color: Colors.black,
                  //       // fontWeight: FontWeight.bold,
                  //       fontSize: 20),
                  // ),
                ),
              ),

              InkWell(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) =>  youtube1()));

                },
                child: ListTile(
                  leading: Image.network('https://img.youtube.com/vi/ivunTTyNjXc/maxresdefault.jpg'),
                  title:const Text(
                    'मिर्गी के कारण, निदान और उपचार | डॉ आत्मा राम बंसाली - मेदांता अस्पताल',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  // subtitle: const Text(
                  //   '     एपिलेप्सी याने मिर्गी के दौर की बीमार जिस्में फिट बैठता है,',
                  //   style: TextStyle(
                  //       color: Colors.black,
                  //       // fontWeight: FontWeight.bold,
                  //       fontSize: 20),
                  // ),
                ),
              ),


              InkWell(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) =>  youtubeplay()));
                },
                child: ListTile(
                  leading: Image.network('https://img.youtube.com/vi/pjmDY3tR6ak/maxresdefault.jpg'),
                  title:const Text(
                    'Epilepsy in schools: how to deal with a tonic seizure',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  // subtitle: const Text(
                  //   '      UK charity Epilepsy Action has a free online learning course for schools. The course is designed to help teachers',
                  //   style: TextStyle(
                  //       color: Colors.black,
                  //       // fontWeight: FontWeight.bold,
                  //       fontSize: 20),
                  // ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
