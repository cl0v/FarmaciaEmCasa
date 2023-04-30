import 'package:core/core.dart';
import '../../_infra/datasources/stores.dart';

abstract class FetchStoreListUseCase{
  Future<List<Store>> call();
}

class FetchStoreListUseCaseImpl implements FetchStoreListUseCase {
  final StoresDataSource storesDataSource;

  FetchStoreListUseCaseImpl(this.storesDataSource);
  @override
  call() {
    return storesDataSource.fetchAll();
  }
}