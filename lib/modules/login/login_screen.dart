import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uepgacadonline_flutter/modules/authentication/bloc.dart';
import 'package:uepgacadonline_flutter/modules/login/bloc.dart';
import 'package:uepgacadonline_flutter/modules/login/login_form.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginBloc _loginBloc;
  AuthenticationBloc _authenticationBloc;

  @override
  void initState() {
    super.initState();
    _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    _loginBloc = LoginBloc(authenticationBloc: _authenticationBloc);
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
                      child: LoginForm(loginBloc: _loginBloc, authenticationBloc: _authenticationBloc),
                      decoration: BoxDecoration(
                          color: Color(0x04336d).withOpacity(0.5))))),
        ));
  }

  @override
  void dispose() {
    _loginBloc.dispose();
    _authenticationBloc.dispose();
    super.dispose();
  }
}
