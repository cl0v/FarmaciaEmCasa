import 'package:core/core.dart';
import 'package:farmacia_em_casa/getit.dart';
import 'package:farmacia_em_casa/src/singletons/user.dart';
import '../../infra/repositories/create_address.dart';

abstract class CreateAddressUseCase{
  Future<void> call(Address address);
}

class CreateAddressUseCaseImpl implements CreateAddressUseCase{
  final CreateAddressRepository repository;

  CreateAddressUseCaseImpl(this.repository);
  @override
  call(address) {
    final user = getitInstance<UserSingleton>();
    return repository.create(user.id, address);
  }
}