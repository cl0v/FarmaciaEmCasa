class FirebaseAuthSignUpErrorHandler {
  late String message;

  FirebaseAuthSignUpErrorHandler(String code) {
    message = _fetchMessage(code);
  }

  /// [https://stackoverflow.com/questions/67617502/what-are-the-error-codes-for-flutter-firebase-auth-exception]
  _fetchMessage(String code) {
    switch (code) {
      case "email-already-in-use":
        return "O email já está cadastrado.";
      case "invalid-email":
        return "Email inválido.";
      case "operation-not-allowed":
        return "Operação não permitida, contate o suporte.";
      case "weak-password":
        return "A senha precisa ser mais forte.";
      default:
        return "Erro desconhecido, contate o suporte!";
    }
  }
}
