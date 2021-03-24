import 'package:blog/services/storage/storage.dart';
import 'package:dio/dio.dart';

import 'package:blog/utils/connection.dart';
import 'package:blog/utils/helpers.dart';

class AppTransformer extends DefaultTransformer {
  AppTransformer() : super(jsonDecodeCallback: parseJson);
}

class AppHttpService {
  Dio http;
  CancelToken cancelToken;

  AppHttpService() {
    cancelToken = new CancelToken();
    http = Dio(
      BaseOptions(
        baseUrl: "https://60585b2ec3f49200173adcec.mockapi.io/api/v1",
        connectTimeout: 1000 * 60,
        receiveTimeout: 1000 * 60,
        headers: {'Accept': "application/json"},
      ),
    )
      ..interceptors.add(
        InterceptorsWrapper(onRequest: (RequestOptions opts) async {
          print({
            "url": "${opts?.baseUrl}${opts?.path}",
            "body": opts?.data,
            "params": opts?.queryParameters,
            "header": opts?.headers
          });
          final token =
              LocalStorage.getItem(LocalStorage.token, defaultValue: "");
          opts.headers["Authorization"] = "Bearer $token";
          return opts;
        }, onError: (DioError e) async {
          print({
            "statusCode": e?.response?.statusCode ?? 400,
            "statusMessage": e?.response?.statusMessage,
            "data": e?.response?.data ?? {"message": e?.error ?? e}
          });
          bool result = true;
          try {
            result = await hasConnection();
          } catch (_) {}
          if (!result) {
            return DioError(
              request: e.request,
              response: Response(
                data: {
                  "message":
                      "kindly check your internet connection and try again"
                },
                statusCode: 5000,
                statusMessage: "No Internet Connection",
              ),
            );
          }

          return e;
        }, onResponse: (Response res) {
          print({
            "data": res?.data,
            "statusCode": res?.statusCode,
            "statusMessage": res?.statusMessage,
          });
          return res;
        }),
      )
      ..transformer = AppTransformer();
  }

  void cancelReqs() {
    cancelToken.cancel("Request has been cancelled");
  }

  FormData generateFormData(Map data) {
    return FormData.fromMap(data);
  }
}
