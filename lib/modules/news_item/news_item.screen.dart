import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:uepgacadonline_flutter/models/news.dart';
import 'package:uepgacadonline_flutter/modules/news_item/bloc.dart';

class NewsItemScreen extends StatefulWidget {
  NewsItemScreen({Key key, this.title, this.news}) : super(key: key);

  final News news;
  final String title;

  @override
  _NewsItemScreenState createState() => _NewsItemScreenState();
}

class _NewsItemScreenState extends State<NewsItemScreen> {
  final newsItemBloc = NewsItemBloc();

  @override
  initState() {
    super.initState();
    newsItemBloc.dispatch(NewsItemFetch(cod: widget.news.cod));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: BlocBuilder(
            bloc: newsItemBloc,
            builder: (context, NewsItemState state) {
              if (state is NewsItemUninitialized) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is NewsItemLoaded) {
                return Container(
                    child: SingleChildScrollView(
                        child: Html(data: state.newsItem.content)));
              } else if (state is NewsItemError) {
                Center(
                  child: Text('Error'),
                );
              }
            }));
  }
}
