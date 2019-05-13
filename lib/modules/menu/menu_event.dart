import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MenuEvent extends Equatable {
  MenuEvent([List props = const []]) : super(props);
}

class MenuFetch extends MenuEvent {
  final int index;

  MenuFetch({this.index});

  @override
  String toString() => 'MenuFetch';
}
