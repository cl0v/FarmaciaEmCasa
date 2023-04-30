import 'package:alice/alice.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../iugu_env.dart';

class HttpHelper {
  Dio dio = Dio();

  HttpHelper() {
    if(kDebugMode) dio.interceptors.add(alice.getDioInterceptor());
  }

  Options get options => Options(
        headers: {
          'Authorization': "Bearer ${IuguEnv.token}",
          'Content-Type': 'application/json',
        },
      );

  static final Alice alice = Alice(showNotification: true);
}
