
import 'package:flutter/material.dart';

@immutable
abstract class SectionsState {}

class InitialState extends SectionsState {}
class GettingSections extends SectionsState {}
class GotSectionsSuccessfully extends SectionsState {}
class SectionsRetrievalFail extends SectionsState {}

