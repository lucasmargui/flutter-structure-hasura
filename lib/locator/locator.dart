import 'package:cloudfunction_app/services/graphql_service.dart';
import 'package:get_it/get_it.dart';
import '../features/home/home_controller.dart';
import '../repositories/transaction_repository.dart';
import '../services/auth_service.dart';
import '../services/firebase_auth_service.dart';
import '../services/mock_auth_service.dart';

import '../features/sign_up/sign_up_controller.dart';

final locator = GetIt.instance;

void setupDependencies() {
  locator.registerFactory<AuthService>((() => FirebaseAuthService()));

  locator.registerLazySingleton<GraphQlService>(
    () => GraphQlService(authService: locator.get<AuthService>()),
  );

  locator.registerFactory<TransactionRepository>(
    () => TransactionRepositoryImpl(),
  );

  locator.registerFactory<HomeController>(() => HomeController(
        transactionRepository: locator.get<TransactionRepository>(),
      ));

  locator.registerFactory<SignUpController>(() => SignUpController(
        authService: locator.get<AuthService>(),
        graphQLService: locator.get<GraphQlService>(),
      ));
}
