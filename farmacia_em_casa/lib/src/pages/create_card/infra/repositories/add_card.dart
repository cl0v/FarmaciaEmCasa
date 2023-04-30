import 'package:farmacia_em_casa/src/pages/create_card/domain/entities/card.dart';

abstract class AddCardRepository {
  add(String userId, String apiUserId, CardDataEntity card);
}

class AddCardRepositoryImpl implements AddCardRepository{
  
  @override
  add(String userId, String apiUserId, CardDataEntity card) {
    // TODO: implement add
    throw UnimplementedError();
  }
}