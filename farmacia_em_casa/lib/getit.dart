import 'package:farmacia_em_casa/providers/user.dart';
import 'package:farmacia_em_casa/src/singletons/user.dart';
import 'package:get_it/get_it.dart';

final getitInstance = GetIt.instance;

getItSetup() {
  getitInstance.registerLazySingleton<UserSingleton>(
    () => UserSingleton.empty(),
  );
}
