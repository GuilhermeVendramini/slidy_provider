import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_bloc.dart';
import '../../repositories/hasura/message/hasura_message_repository.dart';
import 'home_bloc.dart';
import 'home_page.dart';

class HomeModule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<AppProvider>(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(
            builder: (_) => HomeProvider(
                  HasuraMessageRepository(),
                  _bloc,
                )),
      ],
      child: HomePage(),
    );
  }
}
