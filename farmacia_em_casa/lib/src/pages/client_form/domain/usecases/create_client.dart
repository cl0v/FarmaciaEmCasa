import 'package:farmacia_em_casa/src/pages/client_form/infra/repositories/create_client.dart';

import '../../external/datasources/create_client_iugu_api.dart';
import '../entities/client.dart';

abstract class CreateClientUseCase {
  Future<String> call(ClientEntity client);
}

class CreateClientUseCaseImpl implements CreateClientUseCase {

  final CreateClientRepository repository;

  CreateClientUseCaseImpl(this.repository);

  @override
  Future<String> call(client) {
    return repository.create(client);
  }
}
