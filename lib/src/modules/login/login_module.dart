import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_bloc.dart';
import '../../repositories/hasura/user/hasura_user_repository.dart';
import 'login_bloc.dart';
import 'login_page.dart';

class LoginModule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<AppProvider>(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginProvider>(
            builder: (_) => LoginProvider(
                  HasuraUserRepository(),
                  _bloc,
                )),
      ],
      child: LoginPage(),
    );
  }
}
