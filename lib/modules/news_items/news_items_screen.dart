import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uepgacadonline_flutter/models/news.dart';
import 'package:uepgacadonline_flutter/modules/news_items/bloc.dart';
import 'package:uepgacadonline_flutter/ui/screens/news_item.screen.dart';

class NewsItemsScreen extends StatefulWidget {
  NewsItemsScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _NewsItemsScreenState createState() => _NewsItemsScreenState();
}

class _NewsItemsScreenState extends State<NewsItemsScreen> {
  final newsItemsBloc = NewsItemsBloc();

  _NewsItemsScreenState() {
    newsItemsBloc.dispatch(NewsItemsFetch());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: BlocBuilder(
          bloc: newsItemsBloc,
          builder: (context, NewsItemsState state) {
            if (state is NewsItemsUninitialized) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is NewsItemsLoaded) {
              if (state.newsItems == null || state.newsItems.news.isEmpty) {
                return Center(
                  child: Text('Empty'),
                );
              }
              return ListView.builder(
                  itemCount: state.newsItems.news.length,
                  itemBuilder: (context, index) => _itemBuilder(
                      context, index, state.newsItems.news[index]));
            } else if (state is NewsItemsLoaded) {
              return Center(
                child: Text('Error'),
              );
            }
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
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          NewsItemScreen(title: news.title, news: news))),
            ),
          ))
        ],
      ),
    );
  }
}
