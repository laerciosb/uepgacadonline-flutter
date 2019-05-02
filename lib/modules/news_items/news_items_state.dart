import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:uepgacadonline_flutter/models/news_items.dart';

@immutable
abstract class NewsItemsState extends Equatable {
  NewsItemsState([List props = const []]) : super(props);
}

class InitialNewsItemsState extends NewsItemsState {}

class NewsItemsUninitialized extends NewsItemsState {
  @override
  String toString() => 'NewsItemsUninitialized';
}

class NewsItemsLoaded extends NewsItemsState {
  final NewsItems newsItems;

  NewsItemsLoaded({
    this.newsItems
  });

  @override
  String toString() => 'NewsItemsLoaded';
}

class NewsItemsError extends NewsItemsState {
  @override
  String toString() => 'NewsItemsError';
}