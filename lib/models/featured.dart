import 'package:json_annotation/json_annotation.dart';

part 'featured.g.dart';

@JsonSerializable()

class Featured {

  Featured(this.image, this.address);

  @JsonKey(name: 'image') String image;
  @JsonKey(name: 'address') String address;

  factory Featured.fromJson(Map<String, dynamic> json) => _$FeaturedFromJson(json);
  Map<String, dynamic> toJson() => _$FeaturedToJson(this);
}