import 'package:adm/src/features/products/_infra/datasources/products.dart';
import 'package:core/core.dart';


abstract class FetchProductListUseCase{
  Future<List<Product>> call();
}

class FetchProductListUseCaseImpl implements FetchProductListUseCase {
  final ProductsDataSource productsDataSource;

  FetchProductListUseCaseImpl(this.productsDataSource);
  @override
  call() {
    return productsDataSource.fetchAll();
  }
}