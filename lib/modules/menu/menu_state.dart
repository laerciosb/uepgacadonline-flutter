import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:uepgacadonline_flutter/models/weekly_menu.dart';

@immutable
abstract class MenuState extends Equatable {
  MenuState([List props = const []]) : super(props);
}

class InitialMenuState extends MenuState {}

class MenuUninitialized extends MenuState {
  @override
  String toString() => 'MenuUninitialized';
}

class MenuLoaded extends MenuState {
  final WeeklyMenu menu;

  MenuLoaded({
    this.menu
  });

  @override
  String toString() => 'MenuLoaded';
}

class MenuError extends MenuState {
  @override
  String toString() => 'MenuError';
}