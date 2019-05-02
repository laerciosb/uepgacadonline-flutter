import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class NewsItemEvent extends Equatable {
  NewsItemEvent([List props = const []]) : super(props);
}

class NewsItemFetch extends NewsItemEvent {
  final String cod;

  NewsItemFetch({
    this.cod
  });

  @override
  String toString() => 'NewsItemFetch';
}

