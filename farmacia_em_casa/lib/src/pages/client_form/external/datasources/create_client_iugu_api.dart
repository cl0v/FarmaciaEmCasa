import 'package:dio/dio.dart';
import 'package:farmacia_em_casa/src/utils/helpers/http.dart';
import '../../../../../iugu_env.dart';
import '../../domain/entities/client.dart';

abstract class CreateClientIuguAPIDataSource {
  Future<String> create(ClientEntity client);
}

class CreateClientIuguAPIDataSourceImpl
    implements CreateClientIuguAPIDataSource {
  @override
  Future<String> create(client) async {
    const String apiUrl = 'https://api.iugu.com/v1/customers';

    final dio = HttpHelper().dio;

    final response = await dio.post(
      apiUrl,
      options: Options(
        headers: {
          'Authorization': "Bearer ${IuguEnv.token}",
        },
      ),
      data: client.toJson(),
    );

    return response.data["id"];
  }
}
