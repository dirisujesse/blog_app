import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

_parseAndDecode(String response) {
  return jsonDecode(response);
}

parseJson(String text) {
  return compute(_parseAndDecode, text);
}

String lower(String text) => text.toLowerCase();

bool contains(String base, String comparator) =>
    lower(base).contains(lower(comparator));

String parseError(
  dynamic errorResponse,
  String defaultMessage,
  BuildContext context, [
  bool ignore401 = false,
]) {
  print("xxxx: $errorResponse");
  try {
    final fallbackMessage = defaultMessage != null && defaultMessage.isNotEmpty
        ? defaultMessage
        : "Your request failed due to an unexpected error, please try again";
    try {
      final int statusCode = errorResponse["statusCode"] ?? 400;
      final dynamic error = errorResponse["data"];

      print("error: $error");

      if (error is Map) {
        if (error["message"] != null &&
            error["message"] is String &&
            error["message"].isNotEmpty) {
          return error["message"];
        } else if (error.containsKey("errors") && error["errors"] != null) {
          return _parseErrorArray(error["errors"]) ??
              _fallBackMessage(statusCode, defaultMessage);
        } else {
          return _fallBackMessage(statusCode, fallbackMessage);
        }
      }
      if (error is String) {
        return error != null && error.isNotEmpty
            ? error
            : _fallBackMessage(statusCode, fallbackMessage);
      }
      return _fallBackMessage(statusCode, fallbackMessage);
    } catch (_) {
      return fallbackMessage;
    }
  } catch (_) {
    return defaultMessage ??
        "Your request failed due to an unexpected error, please try again";
  }
}

String parseSuccess(dynamic data, String defaultMessage) {
  final fallbackMessage = defaultMessage != null && defaultMessage.isNotEmpty
      ? defaultMessage
      : "Success";
  try {
    if (data is Map) {
      if (data["message"] != null &&
          data["message"] is String &&
          data["message"].isNotEmpty) {
        return data["message"];
      }
      return fallbackMessage;
    }
    return fallbackMessage;
  } catch (_) {
    return fallbackMessage;
  }
}

String _parseErrorArray(Map error) {
  try {
    final data = Map<String, List>.from(error);
    List errorMessages = [];
    data.keys.forEach((it) {
      errorMessages.addAll(data[it]);
    });
    return errorMessages.join(", ");
  } catch (_) {
    return null;
  }
}

String _fallBackMessage(int statusCode, String defaultMessage) {
  if (statusCode == 405) {
    return "Sorry, you are not permitted to carry out this action at this time";
  } else if (statusCode == 404) {
    return "Sorry, the requested data could not be found at this time";
  } else if (statusCode == 401) {
    return "Unauthorized";
  } else if (statusCode >= 400 && statusCode < 500) {
    return "Sorry, your request could not be resolved at this time, please retry";
  } else if (statusCode >= 500 && statusCode < 600) {
    return "Sorry, your request could not be resolved at this time because of an unexpected error";
  } else {
    return defaultMessage;
  }
}
