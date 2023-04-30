import 'package:flutter/foundation.dart';

class UserProvider extends ChangeNotifier {

  String? _cep;

  String get cep => _cep!;
  bool get isCepNull => _cep == null;

  set cep(String c) {
    _cep = c;
    notifyListeners();
  }

  clearCep() {
    _cep = null;
    notifyListeners();
  }
}
