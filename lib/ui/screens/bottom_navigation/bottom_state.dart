import 'package:flutter/material.dart';

@immutable
abstract class NavigationStates {}

class NavigationInitial extends NavigationStates {}
class HomeChangeBottomNavState extends NavigationStates {}
