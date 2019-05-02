import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MenuEvent extends Equatable {
  MenuEvent([List props = const []]) : super(props);
}

class MenuFetch extends MenuEvent {
  @override
  String toString() => 'MenuFetch';
}

