import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HomeEvent extends Equatable {
  HomeEvent([List props = const []]) : super(props);
}
class HomeFetch extends HomeEvent {
  @override
  String toString() => 'UserFetch';
}

