class Menu {
  DateTime date;
  String day;
  List<String> food;

  Menu.fromJson(Map<String, dynamic> json) {
    date = DateTime.parse(json['date']);
    day = json[day];
    food = (json['food'] as List)?.map((i) => i.toString())?.toList();
  }
}