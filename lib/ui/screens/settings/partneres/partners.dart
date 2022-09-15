import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/ui/screens/news/news_cubit.dart';
import 'package:login/ui/screens/news/news_state.dart';

class OurParteners extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsState>(
        listener: (context, state) {},
        builder: (context, state) {

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
              title: const Text('Partners',
                  style: TextStyle(
                      fontSize: 26,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
            ),

            body: (state is !getNewsDataSuccess) ? const SizedBox() :
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const Center(
                    child: Text(
                      "Our Partners",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount:
                    NewsCubit
                        .get(context)
                        .newsModel!
                        .data!
                        .length,
                    itemBuilder: (BuildContext context, int index) =>
                        Center(
                          child: Card(
                            elevation: 20,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),

                                  child: Image.network(NewsCubit
                                      .get(context)
                                      .newsModel!
                                      .data![index]
                                      .imageUrl.toString(), fit: BoxFit.cover,),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 5 , left: 5),
                                  child: Text(
                                      " ${NewsCubit
                                          .get(context)
                                          .newsModel!
                                          .data![index].title}",
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w600)),
                                ),
                              ],
                            ),
                          ),
                        ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}