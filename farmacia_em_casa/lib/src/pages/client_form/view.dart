import 'package:farmacia_em_casa/src/pages/address_form/view.dart';
import 'package:farmacia_em_casa/src/pages/client_form/domain/usecases/create_client.dart';
import 'package:farmacia_em_casa/src/pages/client_form/external/datasources/create_client_firestore.dart';
import 'package:farmacia_em_casa/src/pages/client_form/external/datasources/create_client_iugu_api.dart';
import 'package:farmacia_em_casa/src/pages/client_form/infra/repositories/create_client.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'domain/entities/client.dart';

class ClientFormPage extends StatefulWidget {
  const ClientFormPage({
    super.key,
    this.client,
  });

  final ClientEntity? client;

  @override
  State<ClientFormPage> createState() => _ClientFormPageState();
}

class _ClientFormPageState extends State<ClientFormPage> {
  ClientEntity clientData = ClientEntity.empty();

  bool get isEdditing => widget.client != null;

  @override
  void initState() {
    clientData = widget.client ?? clientData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastrar"),
        centerTitle: true,
      ),
      body: Form(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nome',
                ),
                onChanged: (value) {
                  // Salva o valor do campo "name" na instância do objeto ClientData
                  clientData.name = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                readOnly: isEdditing,
                onChanged: (value) {
                  // Salva o valor do campo "email" na instância do objeto ClientData
                  clientData.email = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Telefone com DDD',
                ),
                onChanged: (value) {
                  final p = value.split(')');
                  final phonePrefix = p[0].substring(1, 3);
                  final phone = p[1];
                  // Salva o valor do campo "phone" na instância do objeto ClientData
                  clientData.phone = phone;
                  clientData.phonePrefix = phonePrefix;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'CPF/CNPJ',
                ),
                onChanged: (value) {
                  // Salva o valor do campo "cpf_cnpj" na instância do objeto ClientData
                  clientData.cpfCnpj = value;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () async {
                    CreateClientUseCase createClientUseCase =
                        CreateClientUseCaseImpl(
                      CreateClientRepositoryImpl(
                        CreateClientIuguAPIDataSourceImpl(),
                        CreateClientFirestoreDataSourceImpl(),
                      ),
                    );
                    if (kDebugMode) {
                      clientData = ClientEntity(
                          id: "",
                          name: "Marcelo",
                          email: 'marcelo@email.com',
                          phone: "998525199",
                          phonePrefix: "33",
                          cpfCnpj: "09847031606");
                    }
                    final clientId = await createClientUseCase(clientData);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              AddEditAddressFormPage()),
                    );
                  },
                  child: Text('Salvar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
