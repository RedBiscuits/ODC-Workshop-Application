import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:login/utils/constants.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../bottom_navigation/bottom_bar.dart';
import '../login/login.dart';
import '../../../utils/cache_helper.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SharedPreferencesEditor.makeInstance();
    token = SharedPreferencesEditor.getString(key: "token");

    return Scaffold(
        body: Center(
      child: Container(
          child: AnimatedSplashScreen(
        nextScreen: (token == null) ? Login() : BottomBar(),
        duration: 2200,
        splash: MediaQuery(
          data: const MediaQueryData(),
          child: Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Orange ',
                        style: TextStyle(
                            color: appColor,
                            fontSize: 24,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                    Text('Digital Center',
                        style: TextStyle(
                            wordSpacing: 5,
                            fontSize: 24,
                            fontWeight: FontWeight.bold))
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 20),
                LinearPercentIndicator(
                  barRadius: Radius.circular(10),
                  alignment: MainAxisAlignment.center,
                  width: MediaQuery.of(context).size.height / 3,
                  percent: 1,
                  animation: true,
                  animationDuration: 3000,
                  progressColor: appColor,
                ),
              ],
            ),
          ),
        ),
      )),
    ));
  }
}
