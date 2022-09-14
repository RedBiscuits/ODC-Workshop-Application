
class GeneralModel {
  String? type;
  String? code;
  String? message;
  List<Data>? data = [];

  GeneralModel();

  GeneralModel.fromJson(Map<String, dynamic> json ) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
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

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    objectSubject = json['examSubject'];
    objectDate = json['examDate'];
    objectStartTime = json['examStartTime'];
    objectEndTime = json['examEndTime'];
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