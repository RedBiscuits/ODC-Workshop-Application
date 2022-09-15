import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';

class Events extends StatelessWidget {
  const Events({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return CalendarControllerProvider(

      controller: EventController(),

      child: Scaffold(

        body: MonthView(),

      ),

    );

  }}