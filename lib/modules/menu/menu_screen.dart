import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uepgacadonline_flutter/modules/menu/bloc.dart';
import 'package:uepgacadonline_flutter/widgets/empty_card.dart';
import 'package:uepgacadonline_flutter/widgets/error_card.dart';
import 'package:uepgacadonline_flutter/widgets/food_card_item.dart';

class WeeklyMenuScreen extends StatefulWidget {
  @override
  _WeeklyMenuScreenState createState() => _WeeklyMenuScreenState();
}

class _WeeklyMenuScreenState extends State<WeeklyMenuScreen>
    with SingleTickerProviderStateMixin {
  MenuBloc _menuBloc;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _menuBloc = MenuBloc();
    _menuBloc.dispatch(MenuFetch());
    _tabController = TabController(vsync: this, length: 2);
    _tabController.addListener(_handleTabIndex);
  }

  void _handleTabIndex() {
    _menuBloc.dispatch(MenuFetch(index: _tabController.index));
  }

  @override
  void dispose() {
    _menuBloc.dispose();
    _tabController.removeListener(_handleTabIndex);
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Color(0xff4a6aff)),
        title: Text("Restaurante",
            style: TextStyle(
                fontSize: 14.0,
                color: Color(0xff4a6aff),
                fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        bottom: TabBar(
            controller: _tabController,
            indicatorColor: Color(0xff4a6aff),
            unselectedLabelColor: Colors.grey[400],
            labelColor: Color(0xff4a6aff),
            tabs: [
              Tab(text: "Central", icon: Icon(Icons.restaurant_menu)),
              Tab(text: "Uvaranas", icon: Icon(Icons.restaurant)),
            ]),
      ),
      body: Container(
        child: BlocBuilder(
          bloc: _menuBloc,
          builder: (context, MenuState state) {
            if (state is MenuUninitialized) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is MenuLoaded) {
              return state.menu.isEmpty
                  ? EmptyCard(
                      "Aparentemente, a listagem do cardápio não foi cadastrada para esse campus.")
                  : ListView.builder(
                      padding: EdgeInsets.all(8.0),
                      itemCount: state.menu.length,
                      itemBuilder: (context, index) {
                        return FoodCardItem(menu: state.menu[index]);
                      });
            }

            if (state is MenuError) {
              return ErrorCard(e: state.e);
            }
          },
        ),
      ),
    );
  }
}
