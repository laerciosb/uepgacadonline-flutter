import 'package:rxdart/rxdart.dart';
import 'package:uepgacadonline_flutter/models/news_item.dart';
import 'package:uepgacadonline_flutter/models/response.dart';
import 'package:uepgacadonline_flutter/resources/repository.dart';

class NewsItemBloc {
  final _repository = Repository();
  final _newsItemFetcher = PublishSubject<NewsItem>();

  Observable<NewsItem> get newsItem => _newsItemFetcher;

  fetchNewItem(String cod) async {
    Response response = await _repository.fetchNewsItem(cod);
    _newsItemFetcher.add(response.news);
  }

  dispose() {
    _newsItemFetcher.close();
  }
}

final newsItemBloc = NewsItemBloc();
