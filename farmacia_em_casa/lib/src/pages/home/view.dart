import 'package:farmacia_em_casa/providers/user.dart';
import 'package:farmacia_em_casa/src/global/widgets/rounded_button.dart';
import 'package:farmacia_em_casa/src/global/widgets/rounded_text_field.dart';
import 'package:farmacia_em_casa/src/pages/client_form/view.dart';
import 'package:farmacia_em_casa/src/pages/home/domain/usecases/ask_help.dart';
import 'package:farmacia_em_casa/src/pages/home/domain/usecases/fetch_drugs.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../global/domain/entities/drug_entity.dart';
import 'external/datasources/product.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          leading: IconButton(
            onPressed
            : () {
              AskHelpUseCase askHelp = AskHelpUseCaseImpl();
              askHelp('Preciso de ajuda!');
            },
            icon: const Icon(Icons.help),
            
          ),
          actions: [TextButton.icon(onPressed: (){}, icon: Icon(Icons.search), label: Text('Pesquisar'))],
          title: const Text('Farmácia em casa'),
          centerTitle: true,
        ),
        body: Consumer<UserProvider>(builder: (context, user, child) {
          if (user.isCepNull) {
            TextEditingController cepController =
                TextEditingController(text: kDebugMode ? "39890-000" : "");
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RoundedTextFieldWidget(
                    labelText: "CEP",
                    //TODO: Adicionar mascara para o CEP
                    textAlign: TextAlign.center,
                    controller: cepController,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  RoundedButtonWidget(
                    onTap: () {
                      user.cep = cepController.text;
                      cepController.dispose();
                    },
                    label: "Pesquisar CEP",
                  ),
                ],
              ),
            );
          }
          return Column(
            children: [
              ListTile(
                title: Text("CEP: ${user.cep}"),
                subtitle: const Text("Toque aqui para trocar o endereço"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () => user.clearCep(),
              ),
              Expanded(child: HorizontalProductList()),
            ],
          );
        }));
  }
}

class HorizontalProductList extends StatelessWidget {
  final FetchDrugsUseCase fetchDrugsUseCase =
      FetchDrugsUseCaseImpl(ProductDataSource());

  HorizontalProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DrugEntity>>(
        future: fetchDrugsUseCase(context.watch<UserProvider>().cep),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: snapshot.data?.length ?? 0,
            itemBuilder: (BuildContext context, int i) {
              return CustomCard(snapshot.data![i]);
            },
          );
        });
  }
}

class CustomCard extends StatelessWidget {
  final DrugEntity drug;

  const CustomCard(this.drug, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ClientFormPage(),
          )),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 4.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    drug.name,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "R\$${drug.price.toStringAsFixed(2).replaceAll('.', ',')}",
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 8.0),
              child: Text(
                drug.usageString,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
              child: Text(
                drug.description,
                style: const TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
