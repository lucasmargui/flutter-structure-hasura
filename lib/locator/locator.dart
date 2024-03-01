import 'package:get_it/get_it.dart';
import '../features/sign_in/sign_in_controller.dart';
import '../services/auth_service.dart';
import '../services/firebase_auth_service.dart';
import '../services/mock_auth_service.dart';

import '../features/sign_up/sign_up_controller.dart';

final locator = GetIt.instance;

void setupDependencies() {
  locator.registerLazySingleton<AuthService>((() => FirebaseAuthService()));

  locator.registerFactory<SignInController>(
      () => SignInController(locator.get<AuthService>()));

  locator.registerFactory<SignUpController>(
      () => SignUpController(locator.get<AuthService>()));
}
