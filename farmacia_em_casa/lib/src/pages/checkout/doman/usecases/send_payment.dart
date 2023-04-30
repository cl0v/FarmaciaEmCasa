import '../../infra/datasources/checkout_provider.dart';

abstract class SendPaymentUseCase {
  call();
}

class SendPaymentUseCaseImpl implements SendPaymentUseCase {


  final CheckoutProviderDatSource dataSource;

  SendPaymentUseCaseImpl(this.dataSource);
  

  @override
  call() {
    return dataSource.getTransactions();
  }
}