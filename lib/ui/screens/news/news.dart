import 'package:flutter/material.dart';

class News extends StatelessWidget {
  const News({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Center(
              child: Text(
                "News",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Center(
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                ),
                color: Colors.grey[400],
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("  ODCs",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w600)),
                        Container(
                          margin: EdgeInsets.only(top: 10,right: 10),
                          decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(11)
                          ),
                          child: IntrinsicHeight(
                            child: Row(
                              children: [
                                Container(
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.share_outlined,color: Colors.white,)),
                                ),
                                const VerticalDivider(
                                  indent: 7,
                                  endIndent: 7,
                                  color: Colors.white,
                                  thickness: 1,
                                ),
                                Container(
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.copy_rounded,color: Colors.white,),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 50, bottom: 70),
                      child: Row(
                        children: const [
                          Text(
                            "Orange",
                            style: TextStyle(
                                color: Colors.orange,
                                fontSize: 45,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(" Digital Center",

                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 46,
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                    Container(
                      alignment: AlignmentDirectional.centerStart,
                      margin: EdgeInsets.only(bottom: 5),
                      child: const Text("  ODC Supports All Universities",style:TextStyle(
                          color: Colors.white ,
                          fontSize: 22,
                          fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
