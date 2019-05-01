import 'package:flutter/material.dart';
import 'package:uepgacadonline_flutter/blocs/news_bloc.dart';
import 'package:uepgacadonline_flutter/models/news.dart';
import 'package:uepgacadonline_flutter/ui/screens/news_item.screen.dart';

class NewsItemsScreen extends StatefulWidget {
  NewsItemsScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _NewsItemsScreenState createState() => _NewsItemsScreenState();
}

class _NewsItemsScreenState extends State<NewsItemsScreen> {
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
    return Card(
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[Text(news.title)],
            ),
          ),
          Positioned.fill(
              child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => NewsItemScreen(title: news.title, newsItem: news))),
            ),
          ))
        ],
      ),
    );
  }
}
