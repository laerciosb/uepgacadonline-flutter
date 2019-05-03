import 'package:equatable/equatable.dart';
import 'package:uepgacadonline_flutter/models/news_items.dart';

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
  final bool hasReachedMax;
  final DateTime date;

  NewsItemsLoaded({this.newsItems, this.hasReachedMax, this.date})
      : super([newsItems, hasReachedMax, date]);

  NewsItemsLoaded copyWith({
      NewsItems newsItems,
      bool hasReachedMax,
      DateTime date
  }) {
    return NewsItemsLoaded(
        newsItems: newsItems ?? this.newsItems,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        date: date ?? this.date);
  }

  @override
  String toString() => 'NewsItemsLoaded';
}

class NewsItemsError extends NewsItemsState {
  @override
  String toString() => 'NewsItemsError';
}
