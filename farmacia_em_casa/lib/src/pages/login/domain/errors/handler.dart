class FirebaseAuthLoginErrorHandler {
  late String message;

  FirebaseAuthLoginErrorHandler(String code) {
    message = _fetchMessage(code);
  }

  /// [https://stackoverflow.com/questions/67617502/what-are-the-error-codes-for-flutter-firebase-auth-exception]
  _fetchMessage(String code){
    switch (code) {
      case "user-not-found":
        return "Usuário não encontrado";
      case "wrong-password":
        return "Senha incorreta";
      case "invalid-email":
        return "Email incorreto";
      case "user-disabled":
        return "Usuário desativado, contate o suporte!";
      default:
        return "Erro desconhecido, contate o suporte!";
    }
  }
}
