import 'package:farmacia_em_casa/providers/user.dart';
import 'package:farmacia_em_casa/src/pages/create_card/domain/usecases/add_card.dart';
import 'package:farmacia_em_casa/src/pages/create_card/infra/repositories/add_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'domain/entities/card.dart';

class CreateCardFormPage extends StatefulWidget {
  const CreateCardFormPage({super.key});

  @override
  State<CreateCardFormPage> createState() => _CreateCardFormPageState();
}

class _CreateCardFormPageState extends State<CreateCardFormPage> {
  final _formKey = GlobalKey<FormState>();
  late String _number;
  late int _expMonth;
  late int _expYear;
  late String _cvc;
  late String _firstName;
  late String _lastName;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Número do Cartão',
            ),
            initialValue: kDebugMode ? "4111111111111111" : "",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, informe o número do cartão';
              }
              return null;
            },
            onSaved: (value) {
              _number = value!;
            },
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Mês de Vencimento',
                  ),
                  initialValue: kDebugMode ? "05" : "",
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, informe o mês de vencimento';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _expMonth = int.parse(value!);
                  },
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Ano de Vencimento',
                  ),
                  initialValue: kDebugMode ? "2026" : "",
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, informe o ano de vencimento';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _expYear = int.parse(value!);
                  },
                ),
              ),
            ],
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'CVC',
            ),
            initialValue: kDebugMode ? "213" : "",
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, informe o CVC';
              }
              return null;
            },
            onSaved: (value) {
              _cvc = value!;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Nome',
            ),
            initialValue: kDebugMode ? "José" : "",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, informe o nome';
              }
              return null;
            },
            onSaved: (value) {
              _firstName = value!;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Sobrenome',
            ),
            initialValue: kDebugMode ? "Silva" : "",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, informe o sobrenome';
              }
              return null;
            },
            onSaved: (value) {
              _lastName = value!;
            },
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                final cardData = CardDataEntity(
                  number: _number,
                  expMonth: _expMonth,
                  expYear: _expYear,
                  cvv: _cvc,
                  firstName: _firstName,
                  lastName: _lastName,
                );
                AddCardUseCase useCase =
                    AddCardUseCaseImpl(AddCardRepositoryImpl());
                useCase(cardData);
              }
            },
            child: Text('Cadastrar'),
          ),
        ],
      ),
    );
  }
}
