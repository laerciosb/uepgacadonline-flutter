// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Response _$ResponseFromJson(Map<String, dynamic> json) {
  return Response(
      json['message'] as String,
      json['status'] as bool,
      json['token'] as String,
      json['daily_news'] == null
          ? null
          : NewsItems.fromJson(json['daily_news'] as Map<String, dynamic>),
      json['grade'] == null
          ? null
          : Grade.fromJson(json['grade'] as Map<String, dynamic>),
      json['weekly_menu'] == null
          ? null
          : WeeklyMenu.fromJson(json['weekly_menu'] as Map<String, dynamic>),
      json['news'] == null
          ? null
          : NewsItem.fromJson(json['news'] as Map<String, dynamic>),
      json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      (json['featured'] as List)
          ?.map((e) =>
              e == null ? null : Featured.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ResponseToJson(Response instance) => <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'token': instance.token,
      'daily_news': instance.dailyNews,
      'grade': instance.grade,
      'weekly_menu': instance.weeklyMenu,
      'news': instance.news,
      'user': instance.user,
      'featured': instance.featured
    };
