import 'package:flutter/material.dart';
import 'package:login/ui/screens/exams/exams.dart';

import '../../../utils/constants.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  static List<String> cardsList = [
    'Lectures',
    'Sections',
    'Midterms',
    'Finals',
    'Events',
    'Notes'
  ];
  static var iconsList = [
    Icons.menu_book_sharp,
    Icons.groups_outlined,
    Icons.text_snippet,
    Icons.text_snippet_sharp,
    Icons.calendar_month_outlined,
    Icons.note_add
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
            child: RichText(
              text:  const TextSpan(
                text: "Orange",
                style: TextStyle(color: appColor, fontSize: 22),
                children: <TextSpan>[
                  TextSpan(
                      text: ' Digital Center ',
                      style: TextStyle(color: Colors.black)),
                ],
              ),
            ),
          ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: MediaQuery(
        data: const MediaQueryData(),
        child: GridView.count(
          padding: EdgeInsets.all(MediaQuery
              .of(context)
              .size
              .width / 30),
          shrinkWrap: true,
          childAspectRatio: 1.5,
          crossAxisSpacing: MediaQuery
              .of(context)
              .size
              .width / 60,
          mainAxisSpacing: MediaQuery
              .of(context)
              .size
              .width / 40,
          crossAxisCount: 2,
          children: List.generate(cardsList.length, (index) {
            return GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => getPage(cardsList[index])));
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width/40)
                ),
                elevation: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Center(
                          child: CircleAvatar(
                            backgroundColor: Colors.grey[200],
                            radius: MediaQuery.of(context).size.width/15,
                          ),
                        ),
                        Center(child: Icon(iconsList[index],
                            size: MediaQuery.of(context).size.width/11,
                            color: appColor
                        )
                        )
                      ],
                    ),
                    SizedBox(height: MediaQuery
                        .of(context)
                        .size
                        .width / 30),
                    Text(cardsList[index],
                        style:  const TextStyle(fontSize:18 ,
                            fontWeight: FontWeight.bold, color: appColor))
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  getPage(String page) {
    switch(page){
      case 'Lectures' : return ObjectPage(entry: lecture);
      case 'Sections' :  return ObjectPage(entry: sections);
      case 'Midterms' :  return ObjectPage(entry: exams);
      case 'Finals' :  return ObjectPage(entry: exams);
      case 'Events' : return null;
      case 'Notes' : return null;
      default : return null;
    }

  }
}
