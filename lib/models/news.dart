import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news.g.dart';

@JsonSerializable()

class News {

  News(this.cod, this.time, this.title);

  @JsonKey(name: 'cod') String cod;
  @JsonKey(name: 'time') String time;
  @JsonKey(name: 'title') String title;

  IconData get iconData {
    IconData value;

    int codInt = int.parse(cod) % 4;
    switch(codInt) {
      case 0: value = Icons.book; break;
      case 1: value = Icons.collections_bookmark; break;
      case 2: value = Icons.description; break;
      case 3: value = Icons.library_books; break;
    }

    return value;
  }

  Color get color {
    Color value;

    int codInt = int.parse(cod) % 4;
    switch(codInt) {
      case 0: value = Colors.blue; break;
      case 1: value = Colors.yellow[700]; break;
      case 2: value = Colors.orange; break;
      case 3: value = Colors.green; break;
      case 4: value = Colors.red; break;
    }

    return value;
  }

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
  Map<String, dynamic> toJson() => _$NewsToJson(this);
}