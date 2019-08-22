import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_bloc.dart';
import 'modules/home/home_module.dart';
import 'modules/login/login_module.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<AppProvider>(context);
    return MaterialApp(
      title: 'Flutter Slidy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _bloc.getUser != null ? HomeModule() : LoginModule(),
    );
  }
}
