import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:uepgacadonline_flutter/services/repository.dart';
import './bloc.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final _repository = Repository();

  @override
  MenuState get initialState => MenuUninitialized();

  @override
  Stream<MenuState> mapEventToState(
    MenuEvent event,
  ) async* {
    if(event is MenuFetch) {
      yield MenuUninitialized();
      try {
        var campus = event.index == 0 || event.index == null ? "central" : "uvaranas";
        final menu = (await _repository.fetchWeeklyMenu(campus)).weeklyMenu;
        yield MenuLoaded(menu: menu);
      } catch (e) {
        print(e.toString());
        yield MenuError();
      }
    }
  }
}
