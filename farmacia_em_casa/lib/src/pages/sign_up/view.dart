import 'package:farmacia_em_casa/getit.dart';
import 'package:farmacia_em_casa/providers/user.dart';
import 'package:farmacia_em_casa/src/global/widgets/rounded_button.dart';
import 'package:farmacia_em_casa/src/global/widgets/rounded_text_field.dart';
import 'package:farmacia_em_casa/src/pages/home/view.dart';
import 'package:farmacia_em_casa/src/pages/sign_up/domain/errors/handler.dart';
import 'package:farmacia_em_casa/src/pages/sign_up/domain/usecases/signup.dart';
import 'package:farmacia_em_casa/src/singletons/user.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;

  @override
  void initState() {
    _emailController = TextEditingController(
      text: kDebugMode ? "marcelofv12@hotmail.com" : null,
    );
    _passwordController = TextEditingController(
      text: kDebugMode ? "marcelofv12@hotmail.com" : null,
    );
    _confirmPasswordController = TextEditingController(
      text: kDebugMode ? "marcelofv12@hotmail.com" : null,
    );
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      try {
        SignupUseCase useCase = SignupUseCaseImpl();
        await useCase(
          _emailController.text,
          _passwordController.text,
        ).then((value) {
          getitInstance<UserSingleton>().authId = value;

          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const HomePage(),
              ));
        });
      } on FirebaseAuthSignUpErrorHandler catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro: ${e.message}')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastrar"),
        centerTitle: true,
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 12),
        child: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  RoundedTextFieldWidget(
                    controller: _emailController,
                    labelText: 'Email',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, digite um email válido';
                      }
                      return null;
                    },
                  ),
                  RoundedTextFieldWidget(
                    obscure: true,
                    controller: _passwordController,
                    labelText: 'Senha',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, digite uma senha válida';
                      }
                      return null;
                    },
                  ),
                  RoundedTextFieldWidget(
                    obscure: true,
                    controller: _confirmPasswordController,
                    labelText: 'Confirmar Senha',
                    validator: (value) {
                      if (value!.isEmpty || value != _passwordController.text) {
                        return 'As senhas não coincidem';
                      }
                      return null;
                    },
                  ),
                  RoundedButtonWidget(
                    onTap: _submitForm,
                    label:'Cadastrar',
                  ),
                  //TODO: Adicionar cadastro com GPlay e Apple, talvez FB
                ].map((e) => Padding(padding: EdgeInsets.only(top: 12), child: e,)).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
