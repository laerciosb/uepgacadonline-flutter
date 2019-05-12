import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;
import 'package:uepgacadonline_flutter/models/news.dart';
import 'package:uepgacadonline_flutter/modules/news_item/bloc.dart';

class NewsItemScreen extends StatefulWidget {
  NewsItemScreen({Key key, this.news}) : super(key: key);

  final News news;

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
            titleSpacing: 0.0,
            centerTitle: true,
            iconTheme: IconThemeData(color: Color(0xff4a6aff)),
            title: Text(widget.news.title,
                style: TextStyle(
                    fontSize: 16.0,
                    color: Color(0xff4a6aff),
                    fontWeight: FontWeight.bold)),
            backgroundColor: Colors.white
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
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 12.0),
                            Text(state.newsItem.title,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(height: state.newsItem.subtitle != "" ? 12.0 : 0.0),
                            Text(state.newsItem.subtitle,
                                style: TextStyle(
                                    color: Colors.grey, fontSize: state.newsItem.subtitle != "" ? 14.0 : 0.0),
                                textAlign: TextAlign.center),
                            SizedBox(height: 12.0),
//                            Text("Criado em: ${state.newsItem}")
                            Divider(),
                            Html(
                              data: state.newsItem.content,
                              defaultTextStyle: TextStyle(
                                  fontFamily: 'Roboto', fontSize: 14.0),
                              customRender: (node, children) {
                                if (node is dom.Element) {
                                  switch (node.localName) {
                                    case "img":
                                      return Container(
                                        margin: EdgeInsets.symmetric(vertical: 8.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.network(
                                              node.attributes['src']),
                                        ),
                                      );
                                      break;
                                    case "p":
                                      return Container(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 8.0),
                                        child: Column(
                                          children: children,
                                        ),
                                      );
                                  }
                                }
                              },
                            ),
                          ],
                        )));
              } else if (state is NewsItemError) {
                Center(
                  child: Text('Error'),
                );
              }
            }));
  }
}
