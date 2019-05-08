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
      try {
        final menu = (await _repository.fetchWeeklyMenu()).weeklyMenu;
        yield MenuLoaded(menu: menu);
      } catch (e) {
        print(e.toString());
        yield MenuError();
      }
    }
  }
}
