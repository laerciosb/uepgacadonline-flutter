import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:uepgacadonline_flutter/models/featured.dart';
import 'package:uepgacadonline_flutter/models/news.dart';
import 'package:uepgacadonline_flutter/modules/home/bloc.dart';
import 'package:uepgacadonline_flutter/modules/news_item/news_item.screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _homeBloc = HomeBloc();

  @override
  initState() {
    super.initState();
    _homeBloc.dispatch(HomeFetch());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        drawer: Drawer(),
        body: Container(
          child: BlocBuilder(
              bloc: _homeBloc,
              builder: (context, HomeState state) {
                if (state is HomeUninitialized) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is HomeLoaded) {
                  return Column(
                    children: <Widget>[
//                      Expanded(
//                          flex: 16,
//                          child: Material(
//                            elevation: 4.0,
//                            child: Container(
//                                padding: EdgeInsets.symmetric(vertical: 16.0),
//                                decoration: BoxDecoration(color: Colors.blue),
//                                child: _buildSwiper(state.featured)),
//                          )),
                      Container(
                        padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 4.0),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Notícias", style: TextStyle(fontSize: 16.0))),
                      ),
                      Expanded(
                        flex: 44,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 8.0),
                          child: ListView.builder(
                              itemCount: state.newsItems.news.length,
                              itemBuilder: (context, index) => _itemBuilder(
                                  context, index, state.newsItems.news[index])),
                        ),
                      )
                    ],
                  );
                } else if (state is HomeError) {
                  return Center(
                    child: Text('Error'),
                  );
                }
              }),
        ));
  }

  Widget _buildSwiper(List<Featured> featured) {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return _buildSwiperItem(featured[index]);
      },
      itemCount: featured.length,
      autoplay: true,
      duration: 2000,
      viewportFraction: 0.8,
      scale: 0.8,
    );
  }

  Widget _buildSwiperItem(Featured featured) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: Image.network(
        featured.image,
        fit: BoxFit.fill,
      ),
    );
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
