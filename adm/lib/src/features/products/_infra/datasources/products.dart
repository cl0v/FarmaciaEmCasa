import 'package:core/core.dart';

abstract class ProductsDataSource {
  Future<String>          create        (Product product);
  Future<String>          update        (Product product);
  Future<List<Product>>   fetchAll      ();
  Future<Product>         fetchById     (String id);
  Future<List<Product>>   search  (String name);
}
