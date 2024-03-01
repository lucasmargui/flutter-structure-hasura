import 'package:cloudfunction_app/services/graphql_service.dart';
import 'package:get_it/get_it.dart';
import '../services/auth_service.dart';
import '../services/firebase_auth_service.dart';

import '../features/sign_up/sign_up_controller.dart';

final locator = GetIt.instance;

void setupDependencies() {
  locator.registerFactory<AuthService>((() => FirebaseAuthService()));

  //tenho que criar esse objeto e esse objeto tem que ser unico,armazenado na memória, para que eu possa acessa-lo em outros lugares
  locator.registerLazySingleton<GraphQlService>(
    () => GraphQlService(authService: locator.get<AuthService>()),
  );

  locator.registerFactory<SignUpController>(() => SignUpController(
        authService: locator.get<AuthService>(),
        graphQLService: locator.get<GraphQlService>(),
      ));
}
