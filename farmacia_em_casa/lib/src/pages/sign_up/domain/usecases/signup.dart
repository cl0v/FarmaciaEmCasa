import 'package:firebase_auth/firebase_auth.dart';

import '../errors/handler.dart';

abstract class SignupUseCase {
  Future<String> call(String email, String password);
}

class SignupUseCaseImpl implements SignupUseCase {
  final auth = FirebaseAuth.instance;
  @override
  Future<String> call(String email, String password) async {
    try {
      final u = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return u.user!.uid;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthSignUpErrorHandler(e.code);
    }
  }
}
