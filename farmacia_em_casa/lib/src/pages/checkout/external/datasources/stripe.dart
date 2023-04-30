// import 'package:farmacia_em_casa/src/pages/checkout/infra/datasources/checkout_provider.dart';
// import 'package:farmacia_em_casa/stripe_env.dart';
// import 'package:stripe_payment/stripe_payment.dart';

// class StripeCheckout implements CheckoutProviderDatSource {
//   init() {
//     StripePayment.setOptions(
//       StripeOptions(
//         publishableKey: StripeEnviroment.publishableKey,
//         androidPayMode: 'test',
//       ),
//     );
//   }

//   Future<void> processPayment(CreditCard card) async {
//     // criar um token de pagamento usando os dados do cartão de crédito
//     final PaymentMethod paymentMethod = await StripePayment.createPaymentMethod(
//       PaymentMethodRequest(card: card),
//     );
//     final String paymentMethodId = paymentMethod.id ?? '';

//     // realizar o pagamento usando o token de pagamento gerado
//     final PaymentIntentResult paymentIntent = await StripePayment.confirmPaymentIntent(
//       PaymentIntent(
//         // amount: ((_paymentAmount * 100) as int),
//         // currency: 'BRL',
//         paymentMethodId: paymentMethodId,
//       ),
//     );

//     // armazenar o token de pagamento gerado
    
//   }

//   @override
//   Future<void> getTransactions() {
//     // TODO: implement getTransactions
//     throw UnimplementedError();
//   }
// }
