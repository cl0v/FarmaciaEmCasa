import 'package:adm/src/features/products/features/list/view.dart';
import 'package:adm/src/features/stores/features/list/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_grid_button/flutter_grid_button.dart';

import '../../features/products/features/add_edit/view.dart';
import '../../features/stores/pages/dashboard/view.dart';

class AdmDashboardPage extends StatefulWidget {
  const AdmDashboardPage({super.key});

  @override
  State<AdmDashboardPage> createState() => _AdmDashboardPageState();
}

class _AdmDashboardPageState extends State<AdmDashboardPage> {
  final btnTextStyle = const TextStyle(color: Colors.black, fontSize: 24);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridButton(
          items: [
            [
              GridButtonItem(
                title: "Produtos",
                value: const ProductListPage(),
                textStyle: btnTextStyle,
                color: Colors.green,
              ),
              GridButtonItem(
                title: "Farmácias",
                textStyle: btnTextStyle,
                color: Colors.yellow,
                value: const StoreListPage(),
              ),
            ]
          ],
          onPressed: (value) => Navigator.push(
              context, MaterialPageRoute(builder: (_) => value))),
    );
  }
}
