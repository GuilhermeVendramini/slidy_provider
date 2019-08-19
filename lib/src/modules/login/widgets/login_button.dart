import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../login_bloc.dart';

class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<LoginProvider>(context);
    void _submit() async {
      bool result = await _bloc.login();
      if (!result) {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text(_bloc.message),
            duration: Duration(seconds: 3),
          ),
        );
      }
    }

    return StreamBuilder<bool>(
      stream: _bloc.outSubmitValid,
      builder: (context, snapshot) {
        return RaisedButton(
          child: Text("Login"),
          onPressed: snapshot.hasData ? _submit : null,
        );
      },
    );
  }
}
