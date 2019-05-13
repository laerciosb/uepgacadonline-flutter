import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:uepgacadonline_flutter/models/news_item.dart';

@immutable
abstract class NewsItemState extends Equatable {
  NewsItemState([List props = const []]) : super(props);
}

class InitialNewsItemState extends NewsItemState {}

class NewsItemUninitialized extends NewsItemState {
  @override
  String toString() => 'NewsItemUninitialized';
}

class NewsItemLoaded extends NewsItemState {
  final NewsItem newsItem;

  NewsItemLoaded({
    this.newsItem
  });

  @override
  String toString() => 'NewsItemLoaded';
}

class NewsItemError extends NewsItemState {
  final Exception e;

  NewsItemError(this.e);

  @override
  String toString() => 'NewsItemError';
}