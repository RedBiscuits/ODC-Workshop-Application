import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>[
      "FaQ",
      "terms & Conditions",
      "Our Partners",
      "Support",
      "Log out"
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Center(
            child: Text("Settings",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                    fontWeight: FontWeight.bold))),
      ),
      body: MediaQuery(
        data: new MediaQueryData(),
        child: Container(
            margin: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width / 20,
                MediaQuery.of(context).size.height / 20,
                MediaQuery.of(context).size.width / 20,
                MediaQuery.of(context).size.height / 40),
            child: ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: entries.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 50,
                  child: ListTile(
                    title: Text('Entry ${entries[index]}'),
                    trailing: Icon(Icons.arrow_forward_ios_outlined),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            )),
      ),
    );
  }
}
