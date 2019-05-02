import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class NewsItemsEvent extends Equatable {
  NewsItemsEvent([List props = const []]) : super(props);
}

class NewsItemsFetch extends NewsItemsEvent {
  @override
  String toString() => 'NewsItemsFetch';
}

