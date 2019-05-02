import 'package:rxdart/rxdart.dart';
import 'package:uepgacadonline_flutter/models/response.dart';
import 'package:uepgacadonline_flutter/models/weekly_menu.dart';
import 'package:uepgacadonline_flutter/resources/repository.dart';

class WeeklyMenuBloc {
  final _repository = Repository();
  final _weeklyMenuFetcher = PublishSubject<WeeklyMenu>();

  Observable<WeeklyMenu> get weeklyMenu => _weeklyMenuFetcher.stream;

  fetchWeeklyMenu() async {
    Response response = await _repository.fetchWeeklyMenu();
    _weeklyMenuFetcher.add(response.weeklyMenu);
  }

  dispose() {
    _weeklyMenuFetcher.close();
  }
}

final weeklyMenuBloc = WeeklyMenuBloc();
