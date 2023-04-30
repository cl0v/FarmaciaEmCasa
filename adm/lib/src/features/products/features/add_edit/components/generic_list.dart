import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:core/core.dart';

import '../../../presenter/components/product_selector_dialog.dart';

class GenericListWidget extends StatefulWidget {
  final List<Generic>? generics;
  final Function(List<Generic> generics) onChanged;

  const GenericListWidget({
    super.key,
    this.generics,
    required this.onChanged,
  });

  @override
  State<GenericListWidget> createState() => _GenericListWidgetState();
}

class _GenericListWidgetState extends State<GenericListWidget> {
  late List<Generic> items;

  @override
  void initState() {
    items = widget.generics ?? [];
    super.initState();
  }

  select() async {
    final result = await showDialog(
      context: context,
      builder: (_) => const ProductSelectorDialogWidget(),
    );
    print(result.runtimeType);
    // ... Adicionar o item a lista de items, convertendo de produto para generico.
  }

  @override
  Widget build(BuildContext context) {
    return ExpandablePanel(
      header: const Text(
        "Lista de Genericos:",
        style: TextStyle(fontSize: 22),
      ),
      theme: const ExpandableThemeData(
        headerAlignment: ExpandablePanelHeaderAlignment.center,
      ),
      collapsed: Container(),
      expanded: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            ListTile(
              title: const Text("Adicionar genérico"),
              trailing: const Icon(Icons.add),
              onTap: select,
            ),
            ...items
                .map<ListTile>((g) => ListTile(
                      title: Text(g.name),
                      subtitle: Text(g.id),
                    ))
                .toList()
          ],
        ),
      ),
    );
  }
}
