import 'package:flutter/material.dart';
import 'package:core/core.dart';

import '../../../presenter/components/product_selector_dialog.dart';

class OriginalSelectorWidget extends StatefulWidget {
  const OriginalSelectorWidget({
    super.key,
    this.original,
    required this.onSelected,
  });

  final Original? original;
  final Function(Original? original) onSelected;

  @override
  State<OriginalSelectorWidget> createState() => _OriginalSelectorWidgetState();
}

class _OriginalSelectorWidgetState extends State<OriginalSelectorWidget> {
  Original? original;

  @override
  void initState() {
    original = widget.original;
    super.initState();
  }

  select(BuildContext context) async {
    final result = await showDialog<Product>(
      context: context,
      builder: (_) => const ProductSelectorDialogWidget(),
    );
    if (result == null) return;
    final o = Original(result.id!, result.name);
    widget.onSelected(o);
    setState(() {
      original = o;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(original?.name ?? "Selecione o Original"),
        subtitle: original != null ? Text(original!.id) : null,
        trailing: Icon(original == null ? Icons.search : Icons.refresh),
        onTap: () => select(context),
      ),
    );
  }
}
