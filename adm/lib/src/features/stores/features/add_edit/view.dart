import 'package:adm/src/features/stores/_external/datasources/firestore_algolia.dart';
import 'package:adm/src/features/stores/domain/usecases/create.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class AddEditStorePage extends StatefulWidget {
  const AddEditStorePage({super.key, this.store});

  final Store? store;

  @override
  State<AddEditStorePage> createState() => _AddEditStorePageState();
}

class _AddEditStorePageState extends State<AddEditStorePage> {
  late final TextEditingController nameController;
  late final TextEditingController obsController;
  late final TextEditingController addressController;
  late final TextEditingController addressComplementController;
  late final TextEditingController phoneController;

  List<StoreOperationDay> daysSelected = weekDays
      .sublist(2)
      .map<StoreOperationDay>((e) => StoreOperationDay(day: e))
      .toList();

  validateAndCreate() async {
    final CreateStoreUseCase create =
        CreateStoreUseCaseImpl(FirestorAlgoliaeStoreDataSourceImpl());

    await create(Store(
      name: nameController.text,
      address: [
        _splitAddress(addressController.text, addressComplementController.text)
      ],
      phone: phoneController.text,
      isActive: true,
      operationInfo: StoreOperationTimeInfo(days: <StoreOperationDay>[]),
    ));
  }

  Address _splitAddress(String add, String complement) {
    final l = add.split(',').map((e) => e.trimRight().trimLeft()).toList();
    return Address(
        number: l[1], street: l[0], district: l[2], complement: complement);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adicionar Farmácia"),
      ),
      body: SafeArea(
          child: Form(
              child: Column(
        children: [
          MultiSelectChipField(
            items: weekDays
                .map<MultiSelectItem>((e) => MultiSelectItem(e, e))
                .toList(),
            initialValue: daysSelected.map((e) => e.day).toList(),
            title: const Text("Dias da semana"),
            headerColor: Colors.blue.withOpacity(0.5),
            selectedChipColor: Colors.blue.withOpacity(0.5),
            selectedTextStyle: TextStyle(color: Colors.blue[800]),
            onTap: (values) {
              setState(() {
                daysSelected = values.map((e) => StoreOperationDay(day: e)).toList();
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              
              children: daysSelected.map((e) {
                return Row(children: [
                  Text(e.day),
                  Column(
                    mainAxisSize: MainAxisSize.min ,
                    children: [
                      Expanded(child: TextFormField(initialValue: e.open,)),
                      Expanded(child: TextFormField(initialValue: e.close,)),
                    ],
                  )
                ],);
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: validateAndCreate,
              child: const SizedBox(
                width: double.infinity,
                child: Center(
                  child: Text('Cadastrar'),
                ),
              ),
            ),
          ),
        ],
      ))),
    );
  }
}
