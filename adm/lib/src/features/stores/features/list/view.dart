import 'package:flutter/material.dart';
import 'package:core/core.dart';
import '../../_external/datasources/firestore_algolia.dart';
import '../../domain/usecases/search_by_name.dart';
import '../add_edit/view.dart';
import '../../domain/usecases/fetch.dart';

class StoreListPage extends StatefulWidget {
  const StoreListPage({super.key});

  @override
  State<StoreListPage> createState() => _StoreListPageState();
}

class _StoreListPageState extends State<StoreListPage> {
  final dataSource = FirestorAlgoliaeStoreDataSourceImpl();

  FetchStoreListUseCase get fetchStoreListUseCase =>
      FetchStoreListUseCaseImpl(dataSource);

  SearchStoreByNameUseCase get searchStoreByNameUseCase =>
      SearchStoreByNameUseCaseImpl(dataSource);

  List<Store>? stores;

  @override
  void initState() {
    super.initState();
    fetchStoreListUseCase().then((value) {
      setState(() {
        stores = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Lojas"),
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text("Cadastrar loja"),
            trailing: const Icon(Icons.add),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const AddEditStorePage())),
          ),
          ListTile(
            title: TextField(
              decoration: const InputDecoration(hintText: 'Pesquisar'),
              onChanged: (value) => searchStoreByNameUseCase(value).then(
                (value) {
                  setState(
                    () {
                      stores = value;
                    },
                  );
                },
              ),
            ),
            trailing: const Icon(Icons.search),
          ),
          Expanded(
            child: stores == null
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: stores!.length,
                    itemBuilder: (context, i) {
                      final Store store = stores![i];
                      return ListTile(
                        title: Text(store.name),
                        trailing: const Icon(Icons.arrow_forward_ios_outlined),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => AddEditStorePage(
                              store: store,
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
