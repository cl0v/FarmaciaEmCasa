import '../../_infra/datasources/products.dart';
import 'package:core/core.dart';

abstract class CreateProductUseCase{
  Future call(Product product);
}

class CreateProductUseCaseImpl implements CreateProductUseCase {
  final ProductsDataSource dataSource;

  CreateProductUseCaseImpl(this.dataSource);
  @override
  call(Product product) {
    return dataSource.create(product);
  }
}