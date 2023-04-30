import '../../_infra/datasources/stores.dart';
import 'package:core/core.dart';

abstract class SearchStoreByNameUseCase{
  Future<List<Store>> call(String name);
}

class SearchStoreByNameUseCaseImpl implements SearchStoreByNameUseCase {
  final StoresDataSource dataSource;

  SearchStoreByNameUseCaseImpl(this.dataSource);
  @override
  call(name) {
    return dataSource.searchByName(name);
  }
}