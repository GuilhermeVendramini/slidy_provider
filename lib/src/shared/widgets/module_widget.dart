import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class ModuleWidget extends StatelessWidget {
  List<Provider> get blocs;

  Widget get view;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: blocs,
      child: view,
    );
  }
}
