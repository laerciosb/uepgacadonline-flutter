import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uepgacadonline_flutter/modules/authentication/bloc.dart';
import 'package:uepgacadonline_flutter/modules/login/bloc.dart';
import 'package:uepgacadonline_flutter/widgets/login_button.dart';

import 'package:get_version/get_version.dart';

class LoginForm extends StatefulWidget {
  final LoginBloc loginBloc;
  final AuthenticationBloc authenticationBloc;

  LoginForm({this.loginBloc, this.authenticationBloc});

  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _raController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool get isPopulated =>
      _raController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  bool isLoginButtonEnabled(LoginState state) {
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }

  @override
  void initState() {
    super.initState();

    _raController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
  }

  @override
  Widget build(BuildContext context) {
    final focus = FocusNode();
    return BlocListener(
      bloc: widget.loginBloc,
      listener: (BuildContext context, LoginState state) {
        if (state.isFailure) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Erro ao realizar login!'),
                    Icon(Icons.error)
                  ],
                ),
                backgroundColor: Colors.red,
              ),
            );
        }
        if (state.isSubmitting) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Conectando...'),
                    CircularProgressIndicator(),
                  ],
                ),
              ),
            );
        }
        if (state.isSuccess) {
          widget.authenticationBloc.dispatch(LoggedIn());
        }
      },
      child: BlocBuilder(
        bloc: widget.loginBloc,
        builder: (BuildContext context, LoginState state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 32.0),
              Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 0.0),
                        child: Card(
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0)),
                          child: Container(
                            padding:
                                EdgeInsets.fromLTRB(32.0, 64.0, 32.0, 32.0),
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  controller: _raController,
                                  decoration: InputDecoration(
                                    icon: Icon(Icons.person),
                                    labelText: 'Registro Acadêmico',
                                  ),
                                  maxLength: 8,
                                  autovalidate: true,
                                  autocorrect: false,
                                  textInputAction: TextInputAction.next,
                                  autofocus: true,
                                  onFieldSubmitted: (v) {
                                    FocusScope.of(context).requestFocus(focus);
                                  },
                                  validator: (_) {
                                    return !state.isRaValid
                                        ? 'Registro Acadêmico Inválido'
                                        : null;
                                  },
                                ),
                                TextFormField(
                                  controller: _passwordController,
                                  decoration: InputDecoration(
                                    icon: Icon(Icons.lock),
                                    labelText: 'Senha',
                                  ),
                                  obscureText: true,
                                  autovalidate: true,
                                  autocorrect: false,
                                  focusNode: focus,
                                  validator: (_) {
                                    return !state.isPasswordValid
                                        ? 'Senha inválida'
                                        : null;
                                  },
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      LoginButton(
                                        onPressed: isLoginButtonEnabled(state)
                                            ? _onFormSubmitted
                                            : null,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 16.0),
                            Text(
                              "Desenvolvido por alunos e ex-alunos ❤️",
                              style: TextStyle(color: Colors.grey),
                            ),
                            FutureBuilder<String>(
                                future: GetVersion.projectVersion,
                                builder:
                                    (context, AsyncSnapshot<String> snapshot) {
                                  return Text(
                                    "v${snapshot.data}",
                                    style: TextStyle(color: Colors.grey),
                                  );
                                })
                          ],
                        ),
                      )
                    ],
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Material(
                      borderRadius: BorderRadius.circular(16.0),
                      elevation: 4.0,
                      child: Container(
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: Color(0xff4a6aff)),
                        child:
                            Icon(Icons.edit, size: 48.0, color: Colors.white),
                      ),
                    ),
                  )
                ],
              )
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _raController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onEmailChanged() {
    widget.loginBloc.dispatch(
      RaChanged(ra: _raController.text),
    );
  }

  void _onPasswordChanged() {
    widget.loginBloc.dispatch(
      PasswordChanged(password: _passwordController.text),
    );
  }

  void _onFormSubmitted() {
    widget.loginBloc.dispatch(
      LoginWithCredentialsPressed(
        ra: _raController.text,
        password: _passwordController.text,
      ),
    );
  }
}
