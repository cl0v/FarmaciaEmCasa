import 'package:flutter/material.dart';
import 'package:flutter_grid_button/flutter_grid_button.dart';

import '../../features/add_edit/view.dart';
import '../../features/list/view.dart';

class StoresDashboardPage extends StatefulWidget {
  const StoresDashboardPage({super.key});

  @override
  State<StoresDashboardPage> createState() => _StoresDashboardPageState();
}

class _StoresDashboardPageState extends State<StoresDashboardPage> {
  final btnTextStyle = const TextStyle(color: Colors.black, fontSize: 24);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridButton(
          items: [
            [
              GridButtonItem(
                title: "Adicionar",
                value: const AddEditStorePage(),
                textStyle: btnTextStyle,
                color: Colors.green,
              ),
            ],
            [
              GridButtonItem(
                title: "Listar",
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
