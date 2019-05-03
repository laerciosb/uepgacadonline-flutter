import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:uepgacadonline_flutter/models/featured.dart';
import 'package:uepgacadonline_flutter/modules/home/bloc.dart';

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
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 160.0,
                child: BlocBuilder(
                    bloc: _homeBloc,
                    builder: (context, HomeState state) {
                      if (state is HomeUninitialized) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is HomeLoaded) {
                        return _buildSwiper(state.featured);
                      } else if (state is HomeError) {
                        return Center(
                          child: Text('Error'),
                        );
                      }
                    }),
              ),
            ],
          ),
        ));
  }

  Widget _buildSwiper(List<Featured> featured) {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return _buildSwiperItem(featured[index]);
      },
      itemCount: 3,
      autoplay: true,
      duration: 2000,
      viewportFraction: 0.8,
      scale: 0.9,
    );
  }

  Widget _buildSwiperItem(Featured featured) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(16.0))),
      child: Image.network(
        featured.image,
        fit: BoxFit.fill,
      ),
    );
  }
}
