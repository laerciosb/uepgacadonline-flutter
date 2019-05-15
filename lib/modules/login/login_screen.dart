import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uepgacadonline_flutter/modules/authentication/bloc.dart';
import 'package:uepgacadonline_flutter/modules/login/bloc.dart';
import 'package:uepgacadonline_flutter/modules/login/login_form.dart';

class LoginScreen extends StatefulWidget {
  final AuthenticationBloc bloc;

  LoginScreen({Key key, this.bloc}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginBloc _loginBloc;

  @override
  void initState() {
    super.initState();
    _loginBloc = LoginBloc(authenticationBloc: widget.bloc);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/uepg_background.jpg"),
                  fit: BoxFit.cover)),
          child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                  child: LoginForm(
                      loginBloc: _loginBloc, authenticationBloc: widget.bloc),
                  decoration: BoxDecoration(color: Colors.grey[200])))),
    ));
  }

  @override
  void dispose() {
    _loginBloc.dispose();
    super.dispose();
  }
}
