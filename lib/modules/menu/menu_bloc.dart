import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:uepgacadonline_flutter/resources/repository.dart';
import './bloc.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final _repository = Repository();

  @override
  MenuState get initialState => InitialMenuState();

  @override
  Stream<MenuState> mapEventToState(
    MenuEvent event,
  ) async* {
    if(event is MenuFetch) {
      try {
        final menu = (await _repository.fetchWeeklyMenu()).weeklyMenu;
        yield MenuLoaded(menu: menu);
      } catch (_) {
        yield MenuError();
      }
    }
  }
}
