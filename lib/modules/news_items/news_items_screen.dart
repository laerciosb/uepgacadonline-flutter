import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uepgacadonline_flutter/models/news.dart';
import 'package:uepgacadonline_flutter/modules/news_item/news_item.screen.dart';
import 'package:uepgacadonline_flutter/modules/news_items/bloc.dart';
import 'package:uepgacadonline_flutter/widgets/bottom_loader.dart';

class NewsItemsScreen extends StatefulWidget {
  NewsItemsScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _NewsItemsScreenState createState() => _NewsItemsScreenState();
}

class _NewsItemsScreenState extends State<NewsItemsScreen> {
  final _newsItemsBloc = NewsItemsBloc();

  final _scrollController = ScrollController();
  final _scrollThreshold = 100.0;

  @override
  initState() {
    super.initState();
    _newsItemsBloc.dispatch(NewsItemsFetch());
    _scrollController.addListener(() {
      final maxScroll = _scrollController.position.maxScrollExtent;
      final currentScroll = _scrollController.position.pixels;

      if (maxScroll - currentScroll <= _scrollThreshold) {
        print('Loading more');
        _newsItemsBloc.dispatch(NewsItemsFetch());
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _newsItemsBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: BlocBuilder(
          bloc: _newsItemsBloc,
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
                  controller: _scrollController,
                  itemCount: state.newsItems.news.length,
                  itemBuilder: (context, index) =>
                      index >= state.newsItems.news.length
                          ? BottomLoader()
                          : _itemBuilder(
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
                          NewsItemScreen(title: "Notícia", news: news))),
            ),
          ))
        ],
      ),
    );
  }
}
