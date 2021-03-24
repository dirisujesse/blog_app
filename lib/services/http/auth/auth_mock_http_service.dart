import 'dart:async';

import 'package:blog/models/http/requests/app_request_models.dart';
import 'package:blog/models/http/response/app_response_models.dart';
import 'package:blog/services/http/auth/auth_contract.dart';
import 'package:blog/services/storage/storage.dart';

class AuthMockHttpService implements AuthService {
  @override
  FutureOr<AuthData> login(LoginData model) async {
    try {
      final data = AuthData(
        email: model.email,
        password: model.password,
        token: "demo_token",
      );
      LocalStorage.setItem(key: LocalStorage.token, value: data.token);
      LocalStorage.setItem(key: LocalStorage.isLoggedIn, value: true);
      return data;
    } catch (e) {
      throw e;
    }
  }

  @override
  FutureOr<void> logout() async {
    LocalStorage.removeItem(LocalStorage.token);
    LocalStorage.setItem(key: LocalStorage.isLoggedIn, value: false);
    return null;
  }
}
