import 'package:adm/src/features/products/_external/datasources/firestore_algolia.dart';
import 'package:adm/src/features/products/domain/usecases/fetch.dart';
import 'package:get_it/get_it.dart';

import 'src/features/products/_infra/datasources/products.dart';
import 'src/features/products/domain/usecases/create.dart';
import 'src/features/products/domain/usecases/search_by_name.dart';

final getIt = GetIt.instance;

void getItSetup() {
  final ProductsDataSource productDataSource = FirestoreProductDataSourceImpl();

  getIt.registerFactory<CreateProductUseCase>(
      () => CreateProductUseCaseImpl(productDataSource));
  getIt.registerFactory<FetchProductListUseCase>(
      () => FetchProductListUseCaseImpl(productDataSource));
  getIt.registerFactory<SearchProductByNameUseCase>(
      () => SearchProductByNameUseCaseImpl(productDataSource));
}
