import 'package:farmacia_em_casa/src/pages/checkout/infra/datasources/checkout_provider.dart';




class PagSeguroCheckoutDataSource implements CheckoutProviderDatSource{

  // final Dio dio = Dio();

Future<void> getTransactions() async {
  throw UnimplementedError();
//   final url = '$pageSeguroUrl/v3/transactions';

//   final response = await dio.get(url, data: {
//     'Content-Type': 'application/json',
//     'Accept': 'application/vnd.pagseguro.com.br.v3+json',
//     'Authorization': 'Bearer $pagSeguroToken',
//   });

//   if (response.statusCode == 200) {
//     print(response.data);
//   } else {
//     // Tratar o erro
//   }
// }

}

  @override
  void init() {
    // TODO: implement init
  }
}
