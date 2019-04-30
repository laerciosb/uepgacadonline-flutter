import 'package:flutter/material.dart';
import 'package:uepgacadonline_flutter/blocs/news_bloc.dart';
import 'package:uepgacadonline_flutter/models/news.dart';

class NewsScreen extends StatefulWidget {
  NewsScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    newsBloc.fetchNewItems();
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: StreamBuilder(
          stream: newsBloc.dailyNews,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.news.length,
                  itemBuilder: (context, index) =>
                      _itemBuilder(context, index, snapshot.data.news[index]));
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }

  Widget _itemBuilder(BuildContext context, int index, News news) {
    return Container(
      child: Card(
        child: Column(
          children: <Widget>[Text(news.title)],
        ),
      ),
    );
  }
}
