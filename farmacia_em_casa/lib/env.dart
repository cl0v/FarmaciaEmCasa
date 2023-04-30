import 'package:flutter/foundation.dart';

const String pagSeguroToken = "76a20ade-5ecc-494a-92e1-b45335dfa217835e92b2455e9db533bd0cb38b3fef5a961e-e64c-430a-810d-50f9e2f081e1";
const String pagSeguroSandboxToken = '';

String get token => kDebugMode? pagSeguroSandboxToken: pagSeguroToken;
const String pagSeguroApplicationKey = "3791A62AD7D7493774660F9597F1AB93";