import 'package:flutter/foundation.dart';

class IuguEnv {
  //TODO: Receber dados via RealtimeDatabase Firebase
  static const apiTokenDebug =
      "7AA7338DA4788318E1765503028318832CF16ED7CD25769F8198A8121E42820B:";
  static const apiTokenBase64Debug =
      "N0FBNzMzOERBNDc4ODMxOEUxNzY1NTAzMDI4MzE4ODMyQ0YxNkVEN0NEMjU3NjlGODE5OEE4MTIxRTQyODIwQjo=";

  static const apiTokenProd =
      "3E1115E116028981E5E82C1115E4733B82EE159155890711F9583CBB381C22DE:";
  static const apiTokenBase64Prod =
      "M0UxMTE1RTExNjAyODk4MUU1RTgyQzExMTVFNDczM0I4MkVFMTU5MTU1ODkwNzExRjk1ODNDQkIzODFDMjJERTo=";

  static String get token =>
      kDebugMode ? apiTokenBase64Debug : apiTokenBase64Prod;


  static String apiId= "iugu_api_id";
}
