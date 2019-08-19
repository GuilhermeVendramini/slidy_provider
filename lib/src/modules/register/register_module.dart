import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_bloc.dart';
import '../../modules/register/register_bloc.dart';
import '../../modules/register/register_page.dart';
import '../../repositories/hasura/user/hasura_user_repository.dart';

class RegisterModule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<AppProvider>(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<RegisterProvider>(
            builder: (_) => RegisterProvider(
                  HasuraUserRepository(),
                  _bloc,
                )),
      ],
      child: RegisterPage(),
    );
  }
}
