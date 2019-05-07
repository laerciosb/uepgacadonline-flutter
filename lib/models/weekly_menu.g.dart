// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weekly_menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeeklyMenu _$WeeklyMenuFromJson(Map json) {
  return WeeklyMenu((json['weekly_menu'] as List)
      ?.map((e) => e == null
          ? null
          : Menu.fromJson((e as Map)?.map(
              (k, e) => MapEntry(k as String, e),
            )))
      ?.toList());
}

Map<String, dynamic> _$WeeklyMenuToJson(WeeklyMenu instance) =>
    <String, dynamic>{'weekly_menu': instance.menus};
