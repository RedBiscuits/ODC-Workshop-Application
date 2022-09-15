import 'package:flutter/material.dart';
import 'package:login/ui/screens/login/login.dart';
import 'package:login/ui/screens/settings/faq/faq.dart';
import 'package:login/ui/screens/settings/partneres/partners.dart';
import 'package:login/ui/screens/settings/support/support_screen.dart';
import 'package:login/ui/screens/settings/terms/terms.dart';

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
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios, color: Colors.black)),
        centerTitle: true,
        title: const Text('Settings',
            style: TextStyle(
                fontSize: 26,
                color: Colors.black,
                fontWeight: FontWeight.bold)),
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
                  child: GestureDetector(
                    onTap: () {
                      navigateToWherever(entries[index], context);
                    },
                    child: ListTile(
                      title: Text('${entries[index]}'),
                      trailing: Icon(Icons.arrow_forward_ios_outlined),
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            )),
      ),
    );
  }

  void navigateToWherever(String entry, BuildContext context) {
    switch (entry) {
      case 'FaQ':
        Navigator.push(context, MaterialPageRoute(builder: (context) => FaQ()));
        break;
      case 'terms & Conditions':
        Navigator.push(context, MaterialPageRoute(builder: (context) => Terms()));
        break;
      case 'Our Partners':
        Navigator.push(context, MaterialPageRoute(builder: (context) => OurParteners()));
        break;
      case 'Support':
        Navigator.push(context, MaterialPageRoute(builder: (context) => Support()));
        break;
      case 'Log out':
        Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
        break;

    }
  }
}
