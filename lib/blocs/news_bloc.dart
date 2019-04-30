import 'package:rxdart/rxdart.dart';
import 'package:uepgacadonline_flutter/models/daily_news.dart';
import 'package:uepgacadonline_flutter/models/news.dart';
import 'package:uepgacadonline_flutter/models/response.dart';
import 'package:uepgacadonline_flutter/resources/repository.dart';

class NewsBloc {
  final _repository = Repository();
  final _newsItemsFetcher = PublishSubject<DailyNews>();
  final _newsItemFetcher = PublishSubject<News>();

  Observable<DailyNews> get dailyNews => _newsItemsFetcher.stream;

  Observable<News> get newsItem => _newsItemFetcher;

  fetchNewItems() async {
    Response response = await _repository.fetchNewsItems();
    _newsItemsFetcher.add(response.dailyNews);
  }

  fetchNewItem() async {
    Response response = await _repository.fetchNewsItem();
    _newsItemFetcher.add(response.news);
  }

  dispose() {
    _newsItemsFetcher.close();
    _newsItemFetcher.close();
  }
}

final newsBloc = NewsBloc();
