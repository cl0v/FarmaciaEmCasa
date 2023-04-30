import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../dashboard/view.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String? _email;
  String? _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                initialValue: kDebugMode ? 'adm' : null,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o seu e-mail';
                  }
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                ),
                onSaved: (value) {
                  _email = value;
                },
              ),
              TextFormField(
                initialValue: kDebugMode ? '#DSDA(SJ#D(J!(JSA())))' : null,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a sua senha';
                  }
                  return null;
                },
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Senha',
                ),
                onSaved: (value) {
                  _password = value;
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      if (_email == 'adm' && _password == '#DSDA(SJ#D(J!(JSA())))') {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AdmDashboardPage(),
                            ));
                      }
                    }
                  },
                  child: Text('Entrar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
