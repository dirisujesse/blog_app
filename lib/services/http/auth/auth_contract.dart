import 'dart:async';
import 'package:blog/models/http/requests/app_request_models.dart';
import 'package:blog/models/http/response/app_response_models.dart';

abstract class AuthService {
  FutureOr<AuthData> login(LoginData model);
  FutureOr<void> logout();
}
