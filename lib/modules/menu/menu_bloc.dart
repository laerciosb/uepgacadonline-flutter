import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:uepgacadonline_flutter/repositories/ru_repository.dart';

import './bloc.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  @override
  MenuState get initialState => MenuUninitialized();

  @override
  Stream<MenuState> mapEventToState(
    MenuEvent event,
  ) async* {
    if (event is MenuFetch) {
      yield MenuUninitialized();
      try {
        var campus =
            event.index == 0 || event.index == null ? "central" : "uvaranas";
        final menu = (await ruRepository.fetchWeeklyMenu(campus)).weeklyMenu;
        yield MenuLoaded(menu: menu);
      } catch (e) {
        yield MenuError(e);
      }
    }
  }
}
