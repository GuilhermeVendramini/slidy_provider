import 'package:flutter/foundation.dart';

import 'shared/models/user/user_model.dart';

class AppBloc with ChangeNotifier {
  UserModel _userController;
}

class App extends AppBloc {
  UserModel get getUser {
    return _userController;
  }
}

class AppProvider extends App {
  void cleanUser() {
    _userController = null;
    notifyListeners();
  }

  void setUser(UserModel user) {
    _userController = user;
    notifyListeners();
  }
}
