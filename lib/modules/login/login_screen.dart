import 'package:flutter/material.dart';
import 'package:uepgacadonline_flutter/modules/login/bloc.dart';
import 'package:uepgacadonline_flutter/modules/login/login_form.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginBloc _loginBloc;

  @override
  void initState() {
    super.initState();
    _loginBloc = LoginBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Material(child: LoginForm());
  }

  @override
  void dispose() {
    _loginBloc.dispose();
    super.dispose();
  }
}
