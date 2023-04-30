import 'package:core/core.dart';

abstract class StoresDataSource {
  Future<String>          create        (Store store);
  Future<String>          update        (Store store);
  Future<List<Store>>     fetchAll      ();
  Future<Store>           fetchById     (String id);
  Future<List<Store>>     searchByName  (String name);
}
