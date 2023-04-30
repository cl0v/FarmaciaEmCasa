import 'package:core/core.dart';
import 'package:farmacia_em_casa/src/pages/address_form/external/datasources/create_address_firestore.dart';
import 'package:farmacia_em_casa/src/pages/address_form/infra/repositories/create_address.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'domain/usecases/create_address.dart';
import 'external/datasources/create_address_iugu_api.dart';

class AddEditAddressFormPage extends StatefulWidget {
  final Address? address;

  const AddEditAddressFormPage({
    super.key,
    this.address,
  });

  @override
  State<AddEditAddressFormPage> createState() => _AddEditAddressFormPageState();
}

class _AddEditAddressFormPageState extends State<AddEditAddressFormPage> {
  final _formKey = GlobalKey<FormState>();

  Address addressEntity = Address.empty();
  @override
  void initState() {
    addressEntity = widget.address ?? addressEntity;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastrar endereço"),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                initialValue: "39890-000",
                decoration: InputDecoration(labelText: 'CEP'),
                validator: (value) {
                  if (value?.isEmpty ?? false) {
                    return 'Por favor, informe o CEP';
                  }
                  return null;
                },
                onSaved: (value) {
                  addressEntity.zipCode = value ?? addressEntity.zipCode;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Número'),
                validator: (value) {
                  if (value?.isEmpty ?? false) {
                    return 'Por favor, informe o número';
                  }
                  return null;
                },
                onSaved: (value) {
                  addressEntity.number = value ?? addressEntity.number;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Rua'),
                validator: (value) {
                  if (value?.isEmpty ?? false) {
                    return 'Por favor, informe a rua';
                  }
                  return null;
                },
                onSaved: (value) {
                  addressEntity.street = value ?? addressEntity.street;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Estado'),
                validator: (value) {
                  if (value?.isEmpty ?? false) {
                    return 'Por favor, informe o estado';
                  }
                  return null;
                },
                onSaved: (value) {
                  addressEntity.state = value ?? addressEntity.state;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Bairro'),
                validator: (value) {
                  if (value?.isEmpty ?? false) {
                    return 'Por favor, informe o bairro';
                  }
                  return null;
                },
                onSaved: (value) {
                  addressEntity.district = value ?? addressEntity.district;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Complemento'),
                onSaved: (value) {
                  addressEntity.complement = value ?? addressEntity.complement;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () async {
                    final CreateAddressUseCase useCase =
                        CreateAddressUseCaseImpl(CreateAddressRepositoryImpl(
                      CreateAddressIuguAPIDataSourceImpl(),
                      CreateAddressFirestoreDataSourceImpl(),
                    ));
                    if (kDebugMode) {
                      addressEntity = Address.fromJson({
                        "zip_code": "01310-100",
                        "number": "666",
                        "street": "Avenida Paulista",
                        "state": "São Paulo",
                        "city": "Saopa",
                        "district": "Bela Vista",
                        "complement": "666A"
                      });
                    }
                    await useCase(addressEntity);
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
