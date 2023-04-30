import 'package:dio/dio.dart';
import 'package:core/core.dart';

import 'package:farmacia_em_casa/src/utils/helpers/http.dart';

import '../../../../../iugu_env.dart';

abstract class CreateAddressIuguAPIDataSource {
  Future create(String clientId, Address address);
}

class CreateAddressIuguAPIDataSourceImpl implements CreateAddressIuguAPIDataSource {
  @override
  Future create(clientId, address) async {
    final String apiUrl = "https://api.iugu.com/v1/customers/$clientId";

    final dio = HttpHelper().dio;

    final response = await dio.put(apiUrl,
        options: Options(
          headers: {
            'Authorization': "Bearer ${IuguEnv.token}",
            'Content-Type': 'application/json',
          },
        ),
        data: address.toJson());

    return response.data;

  }
}
