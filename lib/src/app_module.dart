import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_bloc.dart';
import 'app_widget.dart';

class AppModule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppProvider>(builder: (_) => AppProvider()),
      ],
      child: AppWidget(),
    );
  }
}
