import 'package:rxdart/rxdart.dart';
import 'package:uepgacadonline_flutter/models/daily_news.dart';
import 'package:uepgacadonline_flutter/models/response.dart';
import 'package:uepgacadonline_flutter/resources/repository.dart';

class NewsItemsBloc {
  final _repository = Repository();
  final _newsItemsFetcher = PublishSubject<DailyNews>();

  Observable<DailyNews> get dailyNews => _newsItemsFetcher.stream;

  fetchNewItems() async {
    Response response = await _repository.fetchNewsItems();
    _newsItemsFetcher.add(response.dailyNews);
  }

  dispose() {
    _newsItemsFetcher.close();
  }
}

final newsItemsBloc = NewsItemsBloc();
