import 'dart:async';

import 'package:blog/models/http/requests/app_request_models.dart';
import 'package:blog/models/http/response/app_response_models.dart';
import 'package:blog/services/http/auth/auth_contract.dart';
import 'package:blog/services/http/base_http.dart';
import 'package:blog/services/storage/storage.dart';
import 'package:dio/dio.dart';

class AuthHttpService extends AppHttpService implements AuthService {
  @override
  FutureOr<AuthData> login(LoginData model) async {
    try {
      final req = await http.post("/login", data: model.json);
      final data = AuthData.fromJson(Map.from(req.data));
      LocalStorage.setItem(key: LocalStorage.token, value: data.token);
      LocalStorage.setItem(key: LocalStorage.isLoggedIn, value: true);
      return data;
    } on DioError catch (e) {
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
