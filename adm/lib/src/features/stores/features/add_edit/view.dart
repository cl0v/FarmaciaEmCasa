import 'package:core/core.dart';
import 'package:flutter/material.dart';

class AddEditStorePage extends StatefulWidget {
  const AddEditStorePage({super.key, this.store});

  final Store? store;

  @override
  State<AddEditStorePage> createState() => _AddEditStorePageState();
}

class _AddEditStorePageState extends State<AddEditStorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Adicionar Farmácia"),),
      body: SafeArea(child: Form(child: Column(
        children: [
          ElevatedButton(onPressed: (){}, child: Text("Adicionar"))
        ],
      ))),
    );
  }
}