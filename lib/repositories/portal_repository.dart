import 'package:uepgacadonline_flutter/models/response.dart';
import 'package:uepgacadonline_flutter/services/portal_service.dart';

class PortalRepository {
  final portalService = PortalService();

  Future<Response> fetchNewsItems(int page) async {
    final currentDateTime = DateTime.now();
    final response = await portalService.fetchNewsItems(page);

    response.newsItems = response.newsItems
        .map((dailyNews) {
          final isTodayNews =
              dailyNews.date.difference(currentDateTime).inDays == 0;

          if (isTodayNews) {
            dailyNews.news = dailyNews.news.where((news) {
              final hourMinute = news.time
                  .split("h")
                  .map((element) => int.parse(element))
                  .toList();

              // Faz a comparação de hora e minuto da notícia
              // em relação a hora e minuto atual.
              return (hourMinute[0] <= currentDateTime.hour &&
                      hourMinute[1] <= currentDateTime.minute) ||
                  (hourMinute[0] < currentDateTime.hour);
            }).toList();
          }

          return dailyNews;
        })
        .where((dailyNews) => dailyNews.news.isNotEmpty)
        .toList();

    return response;
  }

  Future<Response> fetchNewsItem(String cod) =>
      portalService.fetchNewsItem(cod);
}

final portalRepository = PortalRepository();
