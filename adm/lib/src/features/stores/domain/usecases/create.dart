import '../../_infra/datasources/stores.dart';
import 'package:core/core.dart';

abstract class CreateStoreUseCase {
  Future call(Store store);
}

class CreateStoreUseCaseImpl implements CreateStoreUseCase {
  final StoresDataSource dataSource;

  CreateStoreUseCaseImpl(this.dataSource);
  @override
  call(Store store) {
    return dataSource.create(store);
  }
}
