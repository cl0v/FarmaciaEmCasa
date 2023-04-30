import 'package:flutter/foundation.dart';


const String baseURL = 'https://ws.pagseguro.uol.com.br';
const String sandboxURL = 'https://ws.sandbox.pagseguro.uol.com.br';
String get pageSeguroUrl => kDebugMode ? sandboxURL : baseURL;