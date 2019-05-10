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
  final List<NewsItems> newsItems;
  final bool hasReachedMax;
  final int page;

  NewsItemsLoaded({this.newsItems, this.hasReachedMax, this.page})
      : super([newsItems, hasReachedMax, page]);

  NewsItemsLoaded copyWith({
      NewsItems newsItems,
      bool hasReachedMax,
      int page
  }) {
    return NewsItemsLoaded(
        newsItems: newsItems ?? this.newsItems,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        page: page ?? this.page);
  }

  @override
  String toString() => 'NewsItemsLoaded';
}

class NewsItemsError extends NewsItemsState {
  @override
  String toString() => 'NewsItemsError';
}
