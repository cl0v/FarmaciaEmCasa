import 'package:adm/src/features/products/_external/datasources/firestore_algolia.dart';
import 'package:flutter/material.dart';
import 'package:core/core.dart';
import '../../domain/usecases/search_by_name.dart';
import '../add_edit/view.dart';
import '../../domain/usecases/fetch.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  final dataSource = FirestoreProductDataSourceImpl();

  FetchProductListUseCase get fetchProductListUseCase =>
      FetchProductListUseCaseImpl(dataSource);

  SearchProductByNameUseCase get searchProductByNameUseCase =>
      SearchProductByNameUseCaseImpl(dataSource);

  List<Product>? products;

  @override
  void initState() {
    super.initState();
    fetchProductListUseCase().then((value) {
      setState(() {
        products = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Produtos"),
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text("Cadastrar produto"),
            trailing: const Icon(Icons.add),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const AddEditProductPage())),
          ),
          ListTile(
            title: TextField(
              decoration: const InputDecoration(hintText: 'Pesquisar'),
              onChanged: (value) =>
                  searchProductByNameUseCase(value).then((value) {
                setState(() {
                  products = value;
                });
              }),
            ),
            trailing: const Icon(Icons.search),
          ),
          Expanded(
            child: products == null
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: products!.length,
                    itemBuilder: (context, i) {
                      final Product product = products![i];
                      return ListTile(
                        title: Text(product.name),
                        trailing: const Icon(Icons.arrow_forward_ios_outlined),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => AddEditProductPage(
                              product: product,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
