class NewsItem {
  String author;
  String title;
  String subtitle;
  String content;

  //DateTime created_at;
  //DateTime updated_at;

  NewsItem.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    title = json['title'];
    subtitle = json['subtitle'];
    content = json['content'];
  }
}