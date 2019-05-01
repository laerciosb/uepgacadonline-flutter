import 'package:flutter/material.dart';
import 'package:uepgacadonline_flutter/blocs/news_bloc.dart';
import 'package:uepgacadonline_flutter/models/news.dart';

class NewsItemScreen extends StatefulWidget {
  NewsItemScreen({Key key, this.title, this.newsItem}) : super(key: key);

  final News newsItem;
  final String title;

  @override
  _NewsItemScreenState createState() => _NewsItemScreenState();
}

class _NewsItemScreenState extends State<NewsItemScreen> {
  @override
  Widget build(BuildContext context) {
    newsBloc.fetchNewItems();
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          child: Text(widget.newsItem.toString()),
        ));
  }
}
