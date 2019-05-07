import 'package:json_annotation/json_annotation.dart';

part 'menu.g.dart';

@JsonSerializable()

class Menu {

  Menu(this.date, this.day, this.food);

  @JsonKey(name: 'date') DateTime date;
  @JsonKey(name: 'day') String day;
  @JsonKey(name: 'food') List<String> food;

  factory Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);
  Map<String, dynamic> toJson() => _$MenuToJson(this);
}