import 'package:uepgacadonline_flutter/models/response.dart';
import 'package:uepgacadonline_flutter/services/ru_service.dart';

// Necessário refatorar totalmente.
class RuRepository {
  final ruService = RuService();

  Future<Response> fetchWeeklyMenu(campus) async {
    final lunch = await ruService.fetchWeeklyMenu(campus, "A");
    final dinner = await ruService.fetchWeeklyMenu(campus, "J");

    if (lunch.weeklyMenu.isNotEmpty && dinner.weeklyMenu.isNotEmpty) {
      for (int i = 0; i < lunch.weeklyMenu.length; i++) {
        lunch.weeklyMenu[i].lunch = lunch.weeklyMenu[i].food;
        lunch.weeklyMenu[i].dinner = dinner.weeklyMenu[i].food;
        lunch.weeklyMenu[i].food = null;
      }
    } else if (lunch.weeklyMenu.isNotEmpty) {
      for (int i = 0; i < lunch.weeklyMenu.length; i++) {
        lunch.weeklyMenu[i].lunch = lunch.weeklyMenu[i].food;
        lunch.weeklyMenu[i].food = null;
      }
    } else if (dinner.weeklyMenu.isNotEmpty) {
      for (int i = 0; i < lunch.weeklyMenu.length; i++) {
        lunch.weeklyMenu[i].dinner = dinner.weeklyMenu[i].dinner;
        lunch.weeklyMenu[i].food = null;
      }
    }

    return lunch;
  }
}

final ruRepository = RuRepository();
