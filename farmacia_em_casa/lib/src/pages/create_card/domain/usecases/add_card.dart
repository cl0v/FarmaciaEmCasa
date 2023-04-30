import 'package:farmacia_em_casa/getit.dart';
import 'package:farmacia_em_casa/src/pages/create_card/domain/entities/card.dart';
import 'package:farmacia_em_casa/src/pages/create_card/infra/repositories/add_card.dart';
import 'package:farmacia_em_casa/src/singletons/user.dart';

abstract class AddCardUseCase {
  call(CardDataEntity card);
}

class AddCardUseCaseImpl implements AddCardUseCase {
  AddCardRepository repository;

  AddCardUseCaseImpl(
    this.repository,
  );

  @override
  call(card) {
    final user = getitInstance<UserSingleton>();
    return repository.add(user.id, user.paymentId, card);
  }
}
