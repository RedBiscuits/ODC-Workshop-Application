import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/ui/screens/news/news_state.dart';

import 'news_cubit.dart';

class News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          var myCubit = NewsCubit.get(context);
          return Scaffold(
            body: (state is! getNewsDataSuccess)
                ? SizedBox()
                : Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            "News",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount:
                              NewsCubit.get(context).newsModel!.data!.length,
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
                                    child: Image.network(
                                      NewsCubit.get(context)
                                          .newsModel!
                                          .data![index]
                                          .imageUrl
                                          .toString(),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              " ${NewsCubit.get(context).newsModel!.data![index].title}",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.w600)),
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 10, right: 10),
                                            decoration: BoxDecoration(
                                                color: Colors.orange,
                                                borderRadius:
                                                    BorderRadius.circular(11)),
                                            child: IntrinsicHeight(
                                              child: Row(
                                                children: [
                                                  Container(
                                                    child: IconButton(
                                                        onPressed: () {},
                                                        icon: Icon(
                                                          Icons.share_outlined,
                                                          color: Colors.white,
                                                        )),
                                                  ),
                                                  VerticalDivider(
                                                    indent: 7,
                                                    endIndent: 7,
                                                    color: Colors.white,
                                                    thickness: 1,
                                                  ),
                                                  Container(
                                                    child: IconButton(
                                                      onPressed: () {},
                                                      icon: Icon(
                                                        Icons.copy_rounded,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 60),
                                        padding:
                                            EdgeInsets.only(left: 5, right: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Flexible(
                                              child: Container(
                                                // padding: new EdgeInsets.only(right: 2.0),

                                                child: Text(
                                                  "${NewsCubit.get(context).newsModel!.data![index].body}",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  top: 25, right: 5),
                                              child: Text(
                                                "${NewsCubit.get(context).newsModel!.data![index].date}",
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
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
