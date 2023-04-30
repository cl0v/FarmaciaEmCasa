import 'package:adm/getit.dart';
import 'package:adm/src/features/products/domain/usecases/search_by_name.dart';
import 'package:flutter/material.dart';
import 'package:core/core.dart';


class ProductSelectorDialogWidget extends StatefulWidget {
  const ProductSelectorDialogWidget({super.key});

  @override
  State<ProductSelectorDialogWidget> createState() =>
      _ProductSelectorDialogWidgetState();
}

class _ProductSelectorDialogWidgetState
    extends State<ProductSelectorDialogWidget> {
  final searchByNameUseCase = getIt.get<SearchProductByNameUseCase>();

  String productName = "";

  onSelected(BuildContext context, Product product) =>
      Navigator.pop(context, product);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: TextField(
        onChanged: (value) {
          if (value.length <= 3) return;
          setState(() {
            productName = value;
          });
        },
      ),
      content: FutureBuilder<List<Product>>(
        future: searchByNameUseCase(productName),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final List<Product> items = snapshot.data ?? [];

          return ListView.builder(
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (context, i) {
              final product = items[i];
              return ListTile(
                title: Text(product.name),
                onTap: () => onSelected(context, product),
              );
            },
          );
        },
      ),
    );
  }
}
