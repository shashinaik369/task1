import 'dart:convert' show json, jsonDecode;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:task/services.dart/authservice.dart';

import '../models/jsonmodel.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<String> loadJsonFromAsset() async {
    return await rootBundle.loadString('lib/models/jsondata.json');
  }

  Future loadJson() async {
    String jsonString = await loadJsonFromAsset();
    final jsonResponse = json.decode(jsonString);
    Medicine medicine = Medicine.fromJson(jsonResponse);
    print('Name ${medicine.name}');
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final email = authService.currentUser();
    String greeting() {
      var hour = DateTime.now().hour;
      if (hour < 12) {
        return 'Good Morning';
      }
      if (hour < 17) {
        return 'Good Afternoon';
      }
      return 'Good Evening';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('HomeScreen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Card(
            child: Text(
              greeting() + '   ' + email.toString(),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: ElevatedButton(
              child: Text('Logout'),
              onPressed: () async {
                await authService.signOut();
              },
            ),
          ),
          // ElevatedButton(
          //   child: const Text('Load Data'),
          //   onPressed: loadJson,
          // ),
          // _items.isNotEmpty
          //     ? Expanded(
          //         child: ListView.builder(
          //           itemCount: _items.length,
          //           itemBuilder: (context, index) {
          //             return Card(
          //               margin: const EdgeInsets.all(10),
          //               child: ListTile(
          //                 leading: Text(_items[index]["Diabetes"]),
          //                 title: Text(_items[index]["dose"]),
          //                 subtitle: Text(_items[index]["strength"]),
          //               ),
          //             );
          //           },
          //         ),
          //       )
          //     : Container(),
          // Container(
          //   height: 50,
          //   child: Center(
          //     child: FutureBuilder(
          //       future: DefaultAssetBundle.of(context)
          //           .loadString('jsondata/jsondata.json'),
          //       builder: (context, snapshot) {
          //         var mydata = jsonDecode(snapshot.data.toString());
          //         return ListView.builder(
          //           itemBuilder: (BuildContext context, int index) {
          //             return Card(
          //               child: Column(
          //                 crossAxisAlignment: CrossAxisAlignment.stretch,
          //                 children: [
          //                   Text('Name' + mydata['problems']),
          //                   Text('Dose' + mydata[index]['dose']),
          //                   Text('Strength' + mydata[index]['strength']),
          //                 ],
          //               ),
          //             );
          //           },
          //           itemCount: mydata == null ? 0 : mydata.length,
          //         );
          //       },
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
