import 'package:blog/services/storage/storage.dart';
import 'package:flutter/foundation.dart' show ChangeNotifier;

class SplashState extends ChangeNotifier {
  static SplashState _instance;

  static SplashState get instance {
    if (_instance == null) {
      _instance = SplashState();
    }
    return _instance;
  }

  bool get isLoggedIn {
    return LocalStorage.getItem(
      LocalStorage.isLoggedIn,
      defaultValue: false,
    );
  }
}
