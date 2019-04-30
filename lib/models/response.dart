import 'package:uepgacadonline_flutter/models/grade.dart';

class Response {
  String message;
  bool status;

  Grade grade;

  Response.fromJson(Map<String, dynamic> json) {
    message = json.containsKey('message') ? json['message'] : null;
    status = json.containsKey('status') ? json['status'] : null;

    grade = json.containsKey('grade') ? Grade.fromJson(json['grade']) : null;
  }
}