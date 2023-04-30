import 'package:farmacia_em_casa/src/pages/checkout/doman/usecases/send_payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'external/datasources/mercadopago.dart';
import 'external/datasources/pagseguro.dart';

class CheckoutPage extends StatelessWidget {

  final SendPaymentUseCase useCase = SendPaymentUseCaseImpl(MercadoPagoCheckoutDataSource());
  
  CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    useCase();
    return Scaffold(
      backgroundColor: Colors.red,
    );
  }
}