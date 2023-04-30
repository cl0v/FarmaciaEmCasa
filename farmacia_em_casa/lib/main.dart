import 'package:farmacia_em_casa/providers/cart.dart';
import 'package:farmacia_em_casa/providers/user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/pages/home/view.dart';
import 'src/theme/color_schemes.g.dart';
import 'src/utils/helpers/http.dart';

/*  Verde, Amarelo, Azul => Bandeira do Brasil

    Proporção de V:   = 50,36% 
    Proporção de Am:  = 27,03%
    Proporção de Az:  = 22,61%

    Usar o tema do app com essas proporções.
*/

// Adicionar uma barra de pesquisa com filtro pela dor e pelo nome do remedio
// (recomendar generico)
// Atualizar o status do pedido por whatsapp ()
// Homologar o ambiente de pagamentos [https://dev.pagseguro.uol.com.br/reference/request-approval]

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  //Coisas que precisam estar disponíveis
  /*
  - ID de usuário registrado no Firebase.
  - Endereço cadastrado.
  */

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Farmácia em Casa',
      navigatorKey: HttpHelper.alice.getNavigatorKey(),
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      home: const HomePage(),
    );
  }
}
