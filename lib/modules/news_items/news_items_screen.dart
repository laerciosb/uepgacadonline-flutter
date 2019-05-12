import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:uepgacadonline_flutter/helpers/string_helper.dart';
import 'package:uepgacadonline_flutter/models/news.dart';
import 'package:uepgacadonline_flutter/models/news_items.dart';
import 'package:uepgacadonline_flutter/modules/news_item/news_item.screen.dart';
import 'package:uepgacadonline_flutter/modules/news_items/bloc.dart';
import 'package:uepgacadonline_flutter/widgets/bottom_loader.dart';
import 'package:uepgacadonline_flutter/widgets/card_thumbnail.dart';

class NewsItemsScreen extends StatefulWidget {
  @override
  _NewsItemsScreenState createState() => _NewsItemsScreenState();
}

class _NewsItemsScreenState extends State<NewsItemsScreen> {
  final _newsItemsBloc = NewsItemsBloc();

  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;

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
    return Container(
      decoration: BoxDecoration(color: Colors.grey[100]),
      child: BlocBuilder(
        bloc: _newsItemsBloc,
        builder: (context, NewsItemsState state) {
          if (state is NewsItemsUninitialized) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is NewsItemsLoaded) {
            print(state.newsItems);
            if (state.newsItems == null) {
              return Center(
                child: Text('Empty'),
              );
            }
            return ListView.builder(
                padding: EdgeInsets.all(8.0),
                controller: _scrollController,
                itemCount: state.hasReachedMax
                    ? state.newsItems.length
                    : state.newsItems.length + 1,
                itemBuilder: (context, index) => index >= state.newsItems.length
                    ? BottomLoader()
                    : _rowBuilder(context, index, state.newsItems[index]));
          }

          if (state is NewsItemsError) {
            return Center(
              child: Text('Error'),
            );
          }
        },
      ),
    );
  }

  Widget _rowBuilder(BuildContext context, int index, NewsItems news) {
    final dateDay = capitalize(DateFormat("EEEE", "pt_br").format(news.date));
    final dateRemain =
        DateFormat(",  dd \'d\'e MMMM \'d\'e yyyy", "pt_BR").format(news.date);

    return Column(children: <Widget>[
      Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.fromLTRB(48.0, index != 0 ? 32.0 : 16.0, 4.0, 4.0),
        child: RichText(
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                  text: dateDay,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Color(0xff4a6aff))),
              TextSpan(
                  text: dateRemain,
                  style: TextStyle(fontWeight: FontWeight.w100)),
            ],
          ),
        ),
      ),
      ListView.builder(
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          itemCount: news.news.length,
          itemBuilder: (context, index) =>
              _itemBuilder(context, index, news.news[index]))
    ]);
  }

  Widget _itemBuilder(BuildContext context, int index, News news) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: <Widget>[
        _itemCard(news),
        CardThumbnail(
            icon: Icon(news.iconData, color: Colors.white),
            color: news.color)
      ],
    );
  }

  Widget _itemCard(News news) {
    return Container(
      child: Card(
        margin: EdgeInsets.fromLTRB(48.0, 4.0, 16.0, 4.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        elevation: 4.0,
        child: Stack(
          children: <Widget>[_itemCardContent(news), _itemInkWell(news)],
        ),
      ),
    );
  }

  Widget _itemCardContent(News news) {
    return Row(
      children: <Widget>[
        Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(24.0, 16.0, 8.0, 16.0),
              child: Column(
                children: <Widget>[
                  Text(news.title),
                  SizedBox(height: 8.0),
                  _itemCardInfo(news),
                ],
              ),
            ),
            flex: 100),
        Flexible(
            child: Container(
                child: Icon(Icons.keyboard_arrow_right,
                    size: 20.0, color: Color(0xff4a6aff))),
            flex: 15)
      ],
    );
  }

  Widget _itemCardInfo(News news) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
      Icon(Icons.access_time, size: 12.0, color: Colors.grey[400]),
      SizedBox(width: 4.0),
      Text(news.time, style: TextStyle(fontSize: 12.0, color: Colors.grey[400]))
    ]);
  }

  Widget _itemInkWell(News news) {
    return Positioned.fill(
        child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.all(Radius.circular(16.0)),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          NewsItemScreen(title: "Notícia", news: news))),
            )));
  }
}
