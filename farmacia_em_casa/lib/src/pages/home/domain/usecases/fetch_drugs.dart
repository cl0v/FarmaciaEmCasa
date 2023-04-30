import 'package:farmacia_em_casa/src/pages/home/external/datasources/product.dart';

import '../../../../global/domain/entities/drug_entity.dart';

abstract class FetchDrugsUseCase {
  Future<List<DrugEntity>> call(String? cep);
}

class FetchDrugsUseCaseImpl implements FetchDrugsUseCase {
  final ProductDataSource dataSource;

  FetchDrugsUseCaseImpl(this.dataSource);

  @override
  Future<List<DrugEntity>> call(String? cep) {
    print("CEP: $cep");

    return dataSource.fetchDrugs();
  }
}
