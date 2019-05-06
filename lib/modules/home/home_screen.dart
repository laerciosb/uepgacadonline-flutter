import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:uepgacadonline_flutter/models/featured.dart';
import 'package:uepgacadonline_flutter/models/news.dart';
import 'package:uepgacadonline_flutter/modules/grade/grade_screen.dart';
import 'package:uepgacadonline_flutter/modules/home/bloc.dart';
import 'package:uepgacadonline_flutter/modules/menu/menu_screen.dart';
import 'package:uepgacadonline_flutter/modules/news_item/news_item.screen.dart';
import 'package:uepgacadonline_flutter/modules/news_items/news_items_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _homeBloc = HomeBloc();

  int _selectedItem = 0;

  @override
  initState() {
    super.initState();
    _homeBloc.dispatch(HomeFetch());
  }

  Widget _bottomNavigationBarItem(int index) {
    return [
      NewsItemsScreen(),
      GradeScreen(),
      WeeklyMenuScreen()
    ][index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        drawer: Drawer(),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedItem,
            onTap: _onItemTapped,
            items: [
          BottomNavigationBarItem(title: Text("Notícias"), icon: Icon(Icons.note)),
          BottomNavigationBarItem(title: Text("Notas"), icon: Icon(Icons.grade)),
          BottomNavigationBarItem(title: Text("Restaurante"), icon: Icon(Icons.restaurant))
        ]),
        body: _bottomNavigationBarItem(_selectedItem)
    );
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

  void _onItemTapped(int index) {
    setState(() {
      _selectedItem = index;
    });
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
