import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'exams_cubit.dart';

class ExamsPage extends StatelessWidget {
  const ExamsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExamsCubit()..getExams(),
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 5,
            leading: const Icon(Icons.arrow_back_ios, color: Colors.orange),
            title: const Center(
              child: Text("Exams",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.black)),
            ),
            actions: const [
              Icon(Icons.filter_alt_sharp, color: Colors.orange),
              SizedBox(width: 10)
            ]),
        body: BlocConsumer<ExamsCubit, ExamsState>(
          listener: (context, state) {},
          builder: (context, exams) {
            ExamsCubit examsCubit = ExamsCubit.get(context);
            if (examsCubit.isLoading) {
              return Center(
                child: CircularProgressIndicator(),
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
                        Card(
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
                                        examsCubit.examsModel.data![index]
                                                .examSubject ??
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
                                            "Exam Date",
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
                                              Text(examsCubit.examsModel
                                                      .data![index].examDate ??
                                                  "2022-08-18" , style: TextStyle(
                                                fontWeight: FontWeight.bold
                                              ),)
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
                                              Icon(Icons.watch_later,
                                                  color: Colors.green),
                                              SizedBox(width: 5),
                                              Text(examsCubit
                                                      .examsModel
                                                      .data![index]
                                                      .examStartTime ??
                                                  "12:00 pm", style: TextStyle(
                                                  fontWeight: FontWeight.bold))
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
                                              Text(examsCubit
                                                      .examsModel
                                                      .data![index]
                                                      .examEndTime ??
                                                  "2:00 pm", style: TextStyle(
                                                  fontWeight: FontWeight.bold))
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                );
              });
            }
          },
        ),
      ),
    );
  }
}
