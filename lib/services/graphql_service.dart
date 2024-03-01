import 'package:graphql_flutter/graphql_flutter.dart';

import 'auth_service.dart';

class GraphQlService {
  final AuthService authService;

  GraphQlService({required this.authService});

  //Utilizando late é preciso que init seja executado antes de client seja utilizado
  late GraphQLClient client;

  // Função para inicializar o cliente GraphQL com as configurações necessárias.
  Future<void> init() async {
    // Obtém o token de usuário do serviço de autenticação.
    final token = await authService.userToken;

    // Cria um link HTTP para se conectar ao endpoint GraphQL do GitHub.
    final HttpLink httpLink = HttpLink(
      'https://api.github.com/graphql',
    );

    // Cria um link de autenticação que inclui o token JWT no cabeçalho de autorização.
    final AuthLink authLink = AuthLink(
      // Função que retorna o token JWT para ser adicionado ao cabeçalho de autorização.
      getToken: () async => 'Bearer $token',
      // OU
      // getToken: () => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
    );

    // Concatena os links de autenticação e HTTP para criar um link combinado.
    final Link link = authLink.concat(httpLink);

    // Inicializa o cliente GraphQL com o link combinado e uma instância de cache.
    client = GraphQLClient(
      link: link,
      // O armazenamento padrão é o InMemoryStore, que NÃO persiste no disco.
      cache: GraphQLCache(store: HiveStore()),
    );
  }
}
