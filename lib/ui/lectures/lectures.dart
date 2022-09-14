import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../utils/constants.dart';
import 'lectures_cubit.dart';
import 'lectures_state.dart';

class Lectures extends StatelessWidget {
  Lectures({Key? key} ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 5,
          leading: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              } ,
              child: const Icon(Icons.arrow_back_ios, color: appColor)),
          title: const Center(
            child: Text(
                'Lectures',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.black)),
          ),
          actions: const [
            Icon(Icons.filter_alt_sharp, color: appColor),
            SizedBox(width: 10)
          ]),
      body: BlocConsumer<LecturesCubit, LecturesState>(
        listener: (context, state) {},
        builder: (context, state) {
          LecturesCubit lecturesCubit = LecturesCubit.get(context);
          if (!(state is GotLecturesSuccessfully)) {
            return  Center(
              child: LoadingAnimationWidget.prograssiveDots(
                color: appColor,
                size : MediaQuery.of(context).size.width / 10,
              ),
            );
          } else {
            return ListView.builder(itemBuilder: (context, index) {
              return MediaQuery(
                data: const MediaQueryData(),
                child: Container(
                  margin: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width / 20,
                      0,
                      MediaQuery.of(context).size.width / 20,
                      0),
                  child: Column(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height / 40),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height / 40),
                        child: Container(
                          child: Card(
                              shadowColor: Colors.grey,
                              elevation: 5,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(
                                    MediaQuery.of(context).size.width / 20,
                                    MediaQuery.of(context).size.height / 50,
                                    MediaQuery.of(context).size.width / 20,
                                    MediaQuery.of(context).size.height / 50),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          lecturesCubit.dataModel.data![index]
                                                  .lectureSubject ??
                                              "",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 22),
                                        ),
                                        Row(
                                          children: const [
                                            Icon(Icons.timer,
                                                color: Colors.black54),
                                            Text("2hrs")
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                40),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Lecture Date",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                  color: Colors.grey),
                                            ),
                                            Row(
                                              children: [
                                                const Icon(
                                                    Icons.date_range_outlined,
                                                    color: Colors.black54),
                                                const SizedBox(width: 5),
                                                Text(
                                                  lecturesCubit
                                                          .dataModel
                                                          .data![index]
                                                          .lectureDate ??
                                                      "2022-08-18",
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Start Time",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                  color: Colors.grey),
                                            ),
                                            Row(
                                              children: [
                                                const Icon(Icons.watch_later,
                                                    color: Colors.green),
                                                SizedBox(width: 5),
                                                Text(
                                                    lecturesCubit
                                                            .dataModel
                                                            .data![index]
                                                            .lectureStartTime ??
                                                        "12:00 pm",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold))
                                              ],
                                            )
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "End Time",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                  color: Colors.grey),
                                            ),
                                            Row(
                                              children: [
                                                Icon(Icons.watch_later,
                                                    color: Colors.red),
                                                SizedBox(width: 5),
                                                Text(
                                                    lecturesCubit
                                                            .dataModel
                                                            .data![index]
                                                            .lectureEndTime ??
                                                        "2:00 pm",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold))
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            });
          }
        },
      ),
    );
  }
}
