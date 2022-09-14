import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

BottomNavyBarItem getBottomItem(IconData icon , String title){
  return BottomNavyBarItem(
      icon: Icon(icon),
      title: Text(title),
      activeColor: Colors.deepOrange,
      inactiveColor: Colors.black
  );
}