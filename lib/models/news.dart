class News {
  String cod;
  String time;
  String title;

  News.fromJson(Map<String, dynamic> json) {
    cod = json['cod'];
    time = json['time'];
    title = json['title'];
  }
}