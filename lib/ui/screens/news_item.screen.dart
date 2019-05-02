import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:uepgacadonline_flutter/models/news.dart';
import 'package:uepgacadonline_flutter/models/news_item.dart';
import 'package:uepgacadonline_flutter/modules/news_item_bloc.dart';

class NewsItemScreen extends StatefulWidget {
  NewsItemScreen({Key key, this.title, this.news}) : super(key: key);

  final News news;
  final String title;

  @override
  _NewsItemScreenState createState() => _NewsItemScreenState();
}

class _NewsItemScreenState extends State<NewsItemScreen> {
  @override
  Widget build(BuildContext context) {
    newsItemBloc.fetchNewItem(widget.news.cod);
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: StreamBuilder(
          stream: newsItemBloc.newsItem,
          builder: (context, AsyncSnapshot<NewsItem> snapshot) {
            if (snapshot.hasData) {
              return Container(
                child: SingleChildScrollView(
                  child: Html(
                    data: snapshot.data.content
                  ),
                ),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        ));
  }
}
