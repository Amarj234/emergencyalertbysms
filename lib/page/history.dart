import 'package:flutter/material.dart';

import '../database.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAll();
  }


  final dbhelper = Databasehelper.instance;
  List<Padding> state2 = [];
  getAll() async {
    var dbClient = await dbhelper.database;
    final res = await dbClient.rawQuery("SELECT * FROM my_table");
    state2 = [];
    setState(() {
      res.forEach((item) {
        //  final decodedBytes = base64Decode(item['image'].toString());

        state2.add(
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                height: 100,
                width: 400,
                decoration: BoxDecoration(
                    color: Colors.indigo[100],
                    borderRadius: BorderRadius.circular(20)),
                child: ListTile(
                  leading:  Icon(
                    Icons.manage_history,
                    color: Colors.red,
                    size: 50,
                  ),
                  title:   Text(
                    "${item['name']} - ${item['id']}",
                    style: TextStyle(
                        color: Color(0xFF0D47A1),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle:  Text(
                    item['date'].toString(),
                    style: TextStyle(
                      color: Color(0xFF0D47A1),
                      fontSize: 14,
                    ),
                  ),
                  trailing: Text(
                    'Message Sent ',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                    ),
                  ),
                )),
          ),
        );
      });
    });
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
        child: SingleChildScrollView(
          child: Column(
            children: state2,
          ),
        ),
      ),
    );
  }
}
