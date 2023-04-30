import 'package:farmacia_em_casa/src/pages/create_card/domain/entities/card.dart';
import 'package:farmacia_em_casa/src/utils/helpers/http.dart';
import 'package:flutter/foundation.dart';

abstract class AddCardDataSource {
  Future addCard(String userId, CardDataEntity card);
}

class IuguAddCardDataSourceImpl implements AddCardDataSource {
  @override
  Future addCard(String userId, CardDataEntity card) async {
    const String apiUrl = "https://api.iugu.com/v1/payment_token";
    final httpHelper = HttpHelper();

    final response = await httpHelper.dio.post(
      apiUrl,
      options: httpHelper.options,
      data: {
        "account_id": userId,
        "method": "credit_card",
        "test": kDebugMode.toString(),
        "data": card.toJson(),
      }
    );
  }
}
