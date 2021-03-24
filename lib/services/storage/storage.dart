import 'dart:async';

import 'package:flutter/foundation.dart' show required;
import 'package:hive/hive.dart';

class LocalStorage {
  static const isLoggedIn = "isLoggedIn";
  static const token = "token";
  static const activeUser = "user";
  
  static final Box _db = Hive.box("app_data");

  static FutureOr<bool> removeItem(String key) async {
    try {
      await _db.delete(key);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static FutureOr<dynamic> getItem(String key, {dynamic defaultValue}) {
    try {
      final value = _db.get(key, defaultValue: defaultValue);
      return value;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static FutureOr<bool> setItem({@required String key, @required dynamic value}) async {
    try {
      await _db.put(key, value);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static FutureOr<bool> setItems(Map<String, dynamic> data) async {
    try {
      await _db.putAll(data);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
