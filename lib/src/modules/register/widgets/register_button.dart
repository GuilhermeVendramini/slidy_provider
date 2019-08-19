import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../register_bloc.dart';

class RegisterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<RegisterProvider>(context);
    void _submit() async {
      bool result = await _bloc.register();
      if (!result) {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text(_bloc.message),
            duration: Duration(seconds: 3),
          ),
        );
      } else {
        Navigator.pop(context);
      }
    }

    return StreamBuilder<bool>(
      stream: _bloc.outSubmitValid,
      builder: (context, snapshot) {
        return RaisedButton(
          child: Text("Register"),
          onPressed: snapshot.hasData ? _submit : null,
        );
      },
    );
  }
}
