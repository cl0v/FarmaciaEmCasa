import '../../_infra/datasources/products.dart';
import 'package:core/core.dart';

abstract class SearchProductByNameUseCase{
  Future<List<Product>> call(String name);
}

class SearchProductByNameUseCaseImpl implements SearchProductByNameUseCase {
  final ProductsDataSource dataSource;

  SearchProductByNameUseCaseImpl(this.dataSource);
  @override
  call(name) {
    return dataSource.search(name);
  }
}