import 'package:farmacia_em_casa/src/pages/address_form/view.dart';
import 'package:flutter/material.dart';

import '../../global/widgets/rounded_button.dart';

class OrderReviewPage extends StatelessWidget {
  const OrderReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Revise o pedido"),
        centerTitle: true,
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: RoundedButtonWidget(
                label: "Confirmar",
                onTap: () {},
              ),
      ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const ProductReviewWidget(),
             Card(
              child: ListTile(
                title: Text("Praça Paris, n01, Centro - Joaíma / MG"),
                subtitle: Text("Toque para trocar o endereço de entrega"),
                trailing: Icon(Icons.arrow_forward_ios_outlined),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AddEditAddressFormPage())),
              ),
            ),
            const Card(
              child: ListTile(
                title: Text("Cartão VISA com final 4023"),
                subtitle: Text("Toque para trocar a forma de pagamento."),
                trailing: Icon(Icons.arrow_forward_ios_outlined),
              ),
            ),
            
          ],
        ),
      )),
    );
  }
}

class ProductReviewWidget extends StatelessWidget {
  const ProductReviewWidget({super.key});

// Exibir o nome do produto
  // A variação (generico ou não)
  // Dosagem informada (1ml, 2ml, etc)
  // Quantidade comprada
  // Preço da unidade

  // EXP: Ibuprofeno 1ml x 2 un x R$30,00
  // TOTAL : R$ 60,00

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      width: double.infinity,
      color: Colors.amber[100],
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("2 x Ibuprofeno 1ml (30)"),
              Text("R\$30,00"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("2 x Dipirona 1ml (30)"),
              Text("R\$30,00"),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("TOTAL*"),
              Text("R\$60,00"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("ENTREGA"),
              Text("R\$4,00"),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "TOTAL + ENTREGA",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "R\$64,00",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
