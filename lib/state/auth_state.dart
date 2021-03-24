import 'package:blog/models/config/app_config.dart';
import 'package:blog/models/http/requests/app_request_models.dart';
import 'package:blog/models/http/response/app_response_models.dart';
import 'package:blog/services/http/auth/auth_contract.dart';
import 'package:blog/services/http/auth/auth_http_service.dart';
import 'package:blog/services/http/auth/auth_mock_http_service.dart';
import 'package:flutter/foundation.dart' show ChangeNotifier, ValueNotifier;

class AuthState extends ChangeNotifier {
  static AuthState _instance;
  AuthService _service;
  ValueNotifier<AuthData> _user = ValueNotifier(null);

  AuthState() {
    _service = AppConfig.isMock ? AuthMockHttpService() : AuthHttpService();
  }

  static AuthState get instance {
    if (_instance == null) {
      _instance = AuthState();
    }
    return _instance;
  }

  resetState() {
    _user.value = null;
  }

  Future<AuthData> login(LoginData model) async {
    try {
      final data = await _service.login(model);
      _user.value = data;
      return data;
    } catch(e) {
      throw e;
    }
  }

  Future<void> logout() async {
    try {
      await _service.logout();
      _user.value = null;
    } catch(e) {
      throw e;
    }
  }
}
