import 'package:adm/getit.dart';
import 'package:adm/src/features/products/domain/usecases/create.dart';
import 'package:adm/src/features/products/features/add_edit/helpers.dart';
import 'package:flutter/material.dart';
import 'package:core/core.dart';

import 'components/generic_list.dart';
import 'components/original_selector.dart';

//TODO: Adicionar campo dos components
//TODO: Adicionar campos do price

class AddEditProductPage extends StatefulWidget {
  final Product? product;

  const AddEditProductPage({
    super.key,
    this.product,
  });

  @override
  State<AddEditProductPage> createState() => _AddEditProductPageState();
}

class _AddEditProductPageState extends State<AddEditProductPage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController nameController;
  late TextEditingController descController;
  late TextEditingController prescController;

  late bool isGeneric;
  late Original? original;
  late List<Generic>? generics;

  @override
  void initState() {
    nameController = TextEditingController(text: widget.product?.name);
    descController = TextEditingController(text: widget.product?.description);
    prescController =
        TextEditingController(text: widget.product?.prescription.join(','));
    isGeneric = widget.product?.isGeneric ?? false;
    original = widget.product?.original;
    generics = widget.product?.generics;

    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    descController.dispose();
    prescController.dispose();
    super.dispose();
  }

  create() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      //TODO: Verificar se ou generico é nulo, ou original é nulo, não podendo ambos serem não nulos.
      generics = original != null ? null : generics ?? [];
      final product = Product(
        id: widget.product?.id,
        name: nameController.text,
        description: descController.text,
        prescription: prescController.text.splitByCommaAndCapitalize(),
        generics: generics,
        original: original,
      );
      final createProductUseCase = getIt.get<CreateProductUseCase>();
      createProductUseCase(product);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '${widget.product == null ? "Cadastrando" : "Editando"}'
          '${isGeneric ? " Genérico" : ""}',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o nome do produto';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Nome do Produto',
                  ),
                ),
                TextFormField(
                  controller: prescController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira para que serve o produto';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Para que serve, separe por virgula (,)',
                  ),
                ),
                TextFormField(
                  controller: descController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira a descrição do produto';
                    }
                    return null;
                  },
                  maxLines: 5,
                  decoration: const InputDecoration(
                    labelText: 'Descrição',
                  ),
                ),
                Column(
                  children: [
                    RadioListTile(
                      title: const Text("Medicamento Original"),
                      value: false,
                      groupValue: isGeneric,
                      onChanged: (value) => setState(() {
                        setState(() {
                          isGeneric = value ?? isGeneric;
                        });
                      }),
                    ),
                    RadioListTile(
                      title: const Text("Medicamento Genérico"),
                      value: true,
                      groupValue: isGeneric,
                      onChanged: (value) => setState(() {
                        setState(() {
                          isGeneric = value ?? isGeneric;
                        });
                      }),
                    ),
                  ],
                ),
               
                isGeneric
                    ? OriginalSelectorWidget(
                        original: original,
                        onSelected: (original) => this.original = original,
                      )
                    : GenericListWidget(
                        generics: generics,
                        onChanged: (generics) => this.generics = generics,
                      ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: create,
                    child: const SizedBox(
                      width: double.infinity,
                      child: Center(
                        child: Text('Cadastrar'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
