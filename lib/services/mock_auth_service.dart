import '../common/models/user_model.dart';
import '../services/auth_service.dart';

class MockAuthService implements AuthService {
  @override
  Future<UserModel> signIn(
      {required String email, required String password}) async {
    await Future.delayed(Duration(seconds: 2));
    try {
      return UserModel(id: email.hashCode.toString(), email: email);
    } catch (e) {
      if (password.startsWith('123')) {
        throw 'Erro ao logar. Tente novamente';
      }
      throw 'Não foi possivel realizar login nesse momento. Tente mais tarde';
    }
  }

  @override
  Future<UserModel> signUp(
      {String? name, required String email, required String password}) async {
    await Future.delayed(Duration(seconds: 2));
    try {
      //Simulando um erro
      if (password.startsWith('123')) {
        throw Exception();
      }

      return UserModel(id: email.hashCode.toString(), name: name, email: email);
    } catch (e) {
      if (password.startsWith('123')) {
        throw 'Senha insegura. Digite uma nova senha forte.';
      }
      throw 'Não foi possivel criar sua conta nesse momento. Tente mais tarde';
    }
  }

  @override
  // TODO: implement userToken
  Future<String> get userToken => throw UnimplementedError();
}
