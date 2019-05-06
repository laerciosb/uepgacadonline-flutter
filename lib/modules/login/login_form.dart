import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uepgacadonline_flutter/modules/authentication/bloc.dart';
import 'package:uepgacadonline_flutter/modules/login/bloc.dart';
import 'package:uepgacadonline_flutter/widgets/login_button.dart';

class LoginForm extends StatefulWidget {
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _raController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginBloc _loginBloc;
  AuthenticationBloc _authenticationBloc;

  bool get isPopulated =>
      _raController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  bool isLoginButtonEnabled(LoginState state) {
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }

  @override
  void initState() {
    super.initState();
    _loginBloc = LoginBloc();
    _authenticationBloc = AuthenticationBloc();
    _raController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _loginBloc,
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
          _authenticationBloc.dispatch(LoggedIn());
        }
      },
      child: BlocBuilder(
        bloc: _loginBloc,
        builder: (BuildContext context, LoginState state) {
          return Column(
            children: <Widget>[
              Expanded(flex: 6, child: Container()),
              Expanded(
                flex: 10,
                child: ListView(
                  children: <Widget>[
//                Padding(
//                  padding: EdgeInsets.symmetric(vertical: 20),
//                  child: Image.asset('images/uepg_logo.png', height: 200),
//                ),
                    Card(
                      child: Container(
                        padding: EdgeInsets.all(16.0),
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
                              validator: (_) {
                                return !state.isPasswordValid
                                    ? 'Senha inválida'
                                    : null;
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  ],
                ),
              ),
              Expanded(
                  flex: 4,
                  child: Opacity(
                    opacity: 0.25,
                    child: Container(
                        margin: EdgeInsets.only(bottom: 24.0),
                        alignment: Alignment.bottomCenter,
                        child: Text("v0.0.1",
                            style: TextStyle(color: Colors.white))),
                  ))
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
    _loginBloc.dispatch(
      RaChanged(ra: _raController.text),
    );
  }

  void _onPasswordChanged() {
    _loginBloc.dispatch(
      PasswordChanged(password: _passwordController.text),
    );
  }

  void _onFormSubmitted() {
    _loginBloc.dispatch(
      LoginWithCredentialsPressed(
        ra: _raController.text,
        password: _passwordController.text,
      ),
    );
  }
}
