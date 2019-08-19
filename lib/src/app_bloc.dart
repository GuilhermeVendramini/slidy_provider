import 'package:flutter/foundation.dart';
import 'package:rxdart/subjects.dart';

import 'shared/models/user/user_model.dart';

class AppBloc with ChangeNotifier {
  BehaviorSubject<UserModel> userController = BehaviorSubject<UserModel>();

  @override
  void dispose() {
    userController.close();
    super.dispose();
  }
}

class App extends AppBloc {
  /**
   * Bloc output functions here
   **/
}

class AppProvider extends App {
  /**
   * Bloc actions functions here
   **/
}
