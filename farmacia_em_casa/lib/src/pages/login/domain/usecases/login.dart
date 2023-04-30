import 'package:farmacia_em_casa/src/pages/login/domain/errors/handler.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginUseCase {
 Future<String> call(String email, String password);
}

class LoginUseCaseImpl implements LoginUseCase{
  final auth = FirebaseAuth.instance;
  @override
  call(e, p) async{

   try {
     final u  =  await auth.signInWithEmailAndPassword(
          email: e,
          password: p,
        );
    return u.user!.uid;
   } on FirebaseAuthException catch (e) {
     throw FirebaseAuthLoginErrorHandler(e.code);
   }
  }
}