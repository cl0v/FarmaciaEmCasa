import 'package:farmacia_em_casa/getit.dart';
import 'package:farmacia_em_casa/providers/user.dart';
import 'package:farmacia_em_casa/src/pages/login/domain/usecases/login.dart';
import 'package:farmacia_em_casa/src/pages/sign_up/view.dart';
import 'package:farmacia_em_casa/src/singletons/user.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../global/widgets/rounded_button.dart';
import '../../global/widgets/rounded_text_field.dart';
import '../home/view.dart';
import 'domain/errors/handler.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController =
      TextEditingController(text: kDebugMode ? "marcelofv12@hotmail.com" : "");
  final TextEditingController _passwordController =
      TextEditingController(text: kDebugMode ? "marcelofv12@hotmail.com" : "");

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      try {
        LoginUseCase useCase = LoginUseCaseImpl();

        await useCase(
          _emailController.text,
          _passwordController.text,
        ).then(
          (value) {
            getitInstance<UserSingleton>().authId = value;

            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => const HomePage()));
          },
        );
      } on FirebaseAuthLoginErrorHandler catch (e) {
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
        title: const Text("Olá"),
        centerTitle: true,
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Icon(
                    Icons.medication_rounded,
                    color: Colors.amber,
                    size: 128,
                  ),
                  const SizedBox(height: 16),
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
                  const SizedBox(
                    height: 8,
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
                  const SizedBox(
                    height: 8,
                  ),
                  RoundedButtonWidget(
                    onTap: _submitForm,
                    label: 'Entrar',
                  ),
                  TextButton(
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (_) => HomePage())),
                      child: Text("Esqueci minha senha")),
                  TextButton(
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (_) => HomePage())),
                      child: Text("Entrar sem cadastro")),
                  TextButton(
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (_) => SignUpPage())),
                      child: Text("Não possui conta? Cadastrar.")),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
