import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uepgacadonline_flutter/modules/menu/bloc.dart';

class ContactScreen extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  MenuBloc _menuBloc;

  @override
  void initState() {
    super.initState();
    _menuBloc = MenuBloc();
    _menuBloc.dispatch(MenuFetch());
  }

  @override
  void dispose() {
    _menuBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Color(0xff4a6aff)),
        title: Text("Contato",
            style: TextStyle(
                fontSize: 14.0,
                color: Color(0xff4a6aff),
                fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: BlocBuilder(
          bloc: _menuBloc,
          builder: (context, MenuState state) {
            return Center(
              child: CircularProgressIndicator(),
            );
//            if (state is MenuUninitialized) {
//              return Center(
//                child: CircularProgressIndicator(),
//              );
//            }
//
//            if (state is MenuLoaded) {
//              return state.menu.isEmpty
//                  ? EmptyCard(
//                  "Aparentemente, a listagem do cardápio não foi cadastrada para esse campus.")
//                  : ListView.builder(
//                  padding: EdgeInsets.all(8.0),
//                  itemCount: state.menu.length,
//                  itemBuilder: (context, index) {
//                    return FoodCardItem(menu: state.menu[index]);
//                  });
//            }
//
//            if (state is MenuError) {
//              return ErrorCard(e: state.e);
//            }
          },
        ),
      ),
    );
  }
}
