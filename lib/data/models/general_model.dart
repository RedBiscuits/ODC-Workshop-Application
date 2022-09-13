import 'package:flutter/foundation.dart';

class GeneralModel {
  String? type;
  String? code;
  String? message;
  List<Data>? data = [];

  GeneralModel(this.type);

  GeneralModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v , type!));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson(type!)).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? objectSubject;
  String? objectDate;
  String? objectStartTime;
  String? objectEndTime;
  Data(
      {this.id,
        this.objectSubject,
        this.objectDate,
        this.objectStartTime,
        this.objectEndTime});

  Data.fromJson(Map<String, dynamic> json, String type) {
    id = json['id'];
    objectSubject = json['${type}Subject'];
    objectDate = json['${type}Date'];
    objectStartTime = json['${type}StartTime'];
    objectEndTime = json['${type}EndTime'];
  }

  Map<String, dynamic> toJson(String type) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['${type}Subject'] = this.objectSubject;
    data['${type}Date'] = this.objectDate;
    data['${type}StartTime'] = this.objectStartTime;
    data['${type}EndTime'] = this.objectEndTime;
    return data;
  }
}