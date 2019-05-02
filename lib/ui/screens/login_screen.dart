import 'package:flutter/material.dart';
import 'package:uepgacadonline_flutter/modules/login_bloc/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        margin: EdgeInsets.all(16.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
//        Image.asset('uepg_logo.png', fit: BoxFit.cover),

//              StreamBuilder(
//                stream: loginBloc.ra,
//                builder: (context, snapshot) {
//                  return TextField(
//                    onChanged: loginBloc.changeRa,
//                    keyboardType: TextInputType.number,
//                    maxLength: 8,
//                    decoration: InputDecoration(
//                        labelText: 'Registro acadêmico',
//                        errorText: snapshot.error),
//                  );
//                },
//              ),
//
//              StreamBuilder(
//                stream: loginBloc.password,
//                builder: (context, snapshot) {
//                  return TextField(
//                    obscureText: true,
//                    onChanged: loginBloc.changePassword,
//                    decoration: InputDecoration(
//                        labelText: 'Senha', errorText: snapshot.error),
//                  );
//                },
//              ),
//
//              StreamBuilder(
//                stream: loginBloc.isValid,
//                builder: (context, snapshot) {
//                  return RaisedButton(
//                    child: Text('Entrar'),
//                    onPressed: snapshot.hasData ? loginBloc.submit : null,
//                  );
//                },
//              )
            ]),
      ),
    );
  }
}
