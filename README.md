<H1 align="center">Flutter Firebase integração com Hasura</H1>
<p align="center">🚀 Desenvolvimento de uma estrutura contendo Firebase,GraphQL e CloudFunctions para referências futuras</p>

## Recursos Utilizados
- Flutter 3.3.5
- Get_it 7.6.0
- Firebase_core 2.24.2
- Firebase_auth 4.16.0
- cloud_functions: ^4.6.0
- graphql_flutter: ^5.1.2


## Configuração Hasura:

### Criação do Projeto Hasura 

Acesse o site do Hasura em https://hasura.io/.
Faça login ou crie uma conta se ainda não tiver uma.
Crie um novo projeto no Hasura.

### Criação do banco de dados 

Após criar o projeto, você pode criar um banco de dados dentro do Hasura.
Siga as instruções fornecidas na interface do Hasura para criar o banco de dados.


<div align="center">
  <img src="https://github.com/lucasmargui/Flutter_Estrutura_Hasura_Integracao/assets/157809964/f96a0bd3-e985-44d1-a87c-e4131804509a" style="width:70%">
</div>

### Criação de tabelas


Utilize a interface do Hasura para criar as tabelas necessárias seguindo o fluxograma. Isso normalmente envolve a definição dos campos, tipos de dados e relações entre as tabelas.



<div align="center">
  <img src="https://github.com/lucasmargui/Flutter_Estrutura_Hasura_Integracao/assets/157809964/03a7ae93-42f2-4cbd-ada8-38a90f3e5ee4" style="width:90%">
</div>


## Configuração de variáveis Hasura

O Hasura_graphql_jwt_secret é uma chave secreta utilizada para a geração e validação de tokens JWT (JSON Web Tokens) no Hasura. JWTs são frequentemente utilizados para autenticação e autorização em sistemas distribuídos.

No contexto do Hasura, essa chave é usada para assinar os tokens JWT gerados pelo Hasura quando um usuário é autenticado. Esses tokens JWT podem conter informações de autorização e outras informações necessárias para acessar recursos protegidos pelo Hasura.

### Adição da Key "Hasura_graphql_jwt_secret" nas variáveis da api gerando um  JWT Config para Firebase



### Passo 1 : No projeto  abra "Env vars" e clique em "New Env Var".


<div align="center">
  <img src="https://github.com/lucasmargui/Flutter_Estrutura_Hasura_Integracao/assets/157809964/e5b195b3-cef9-445c-9959-c6f9de460ee4" style="width:70%">
</div>


### Passo 2 : Selecione HASURA_GRAPHQL_JWT_SECRET



<div align="center">
  <img src="https://github.com/lucasmargui/Flutter_Estrutura_Hasura_Integracao/assets/157809964/27a3f53c-1342-4a19-b61f-c0e5e685819c" style="width:70%">
</div>

### Passo 3 : Geração de JWT Config para Firebase

Acesse o site https://hasura.io/jwt-config e preencha com as informações do projeto.


<div align="center">
  <img src="https://github.com/lucasmargui/Flutter_Estrutura_Hasura_Integracao/assets/157809964/53ae3331-b7e0-4f91-b345-409a426fcc28" style="width:70%">
</div>

### Passo 4 : JWT CONFIG

Com jwt gerado adicione a key e salve HASURA_GRAPHQL_JWT_SECRET



<div align="center">
  <img src="https://github.com/lucasmargui/Flutter_Estrutura_Hasura_Integracao/assets/157809964/9a342838-fe4d-4014-af9a-321f77c302cb" style="width:70%">
</div>

## Configuração Firebase:

### Criação do Projeto Firebase

Acesse o Console do Firebase em https://console.firebase.google.com/.
Crie um novo projeto ou selecione um projeto existente.

```
dart pub global activate flutterfire_cli

flutter pub add cloud_functions

flutterfire configure

```

### Inicializando Firebase init no projeto Flutter:

```
firebase init
```

Abra um terminal e navegue até o diretório do seu projeto Flutter.
Execute o comando para iniciar a configuração do Firebase no seu projeto Flutter.

### Escolhendo a configuração de Functions:

Durante o processo de inicialização do Firebase, você será solicitado a escolher quais recursos deseja configurar. Escolha as Cloud Functions para esse projeto.


<div align="center">
  <img src="https://github.com/lucasmargui/Flutter_Estrutura_Hasura_Integracao/assets/157809964/e8f35bea-1e93-4e5d-860f-f5325193809e" style="width:90%">
</div>


### Escolhendo Javascript como linguagem das functions:

Durante o processo de inicialização das Cloud Functions, você será solicitado a escolher a linguagem de programação. Escolha JavaScript.

### Instalação das dependências de GraphQL:

```
npm install --save graphql-request
```

Ao finalizar a configuração de Firebase Init, utilize o gerenciador de pacotes do seu projeto (normalmente npm ou yarn) para instalar as dependências necessárias para trabalhar com GraphQL.

## Configuração functions

### Index.js

Configuração do index.js com base no console do projeto criado no Hasura.



<div align="center">
  <img src="https://github.com/lucasmargui/Flutter_Estrutura_Hasura_Integracao/assets/157809964/7ae03f00-7238-4170-8363-ea6153709125" style="width:50%">
</div>


<div align="center">
   <img src="https://github.com/lucasmargui/Flutter_Estrutura_Hasura_Integracao/assets/157809964/52c805fc-eb17-4629-ba1b-8987c3839a44" style="width:100%">
</div>

### Exportando funções para Cloud Functions

Configure as funções de acordo com a lógica desejada e com base nas necessidades do seu projeto e nos endpoints fornecidos pelo Hasura. Isso normalmente envolve a definição de resolvers GraphQL e a conexão com o banco de dados Hasura. Ao final de exportar as funções utilize o comando para exportar as funções para cloud function.



<div align="center">
   <img src="https://github.com/lucasmargui/Flutter_Estrutura_Hasura_Integracao/assets/157809964/530de225-dbd5-431f-85bf-136428306321" style="width:100%">
</div>

Comando para exportar as funções

```
firebase deploy

```


## Configuração Front-End

Adicione o pacote graphql ao flutter.

```
flutter pub add graphql_flutter

```

### Utilizando as funções do CloudFunction

Para utilizar as funções que foram exportadas para CloudFunction basta criar uma instância de FirebaseFunction.



<div align="center">
   <img src="https://github.com/lucasmargui/Flutter_Estrutura_Hasura_Integracao/assets/157809964/f7fecd29-5d78-4c3e-bf78-128ce9c9ab79" style="width:70%">
</div>

e invoca-las através de um httpsCallable e o nome da função exportada

<div align="center">
   <img src="https://github.com/lucasmargui/Flutter_Estrutura_Hasura_Integracao/assets/157809964/6209524e-e581-4909-b83b-d7cec3a9af5d" style="width:70%">
</div>

### Criação de GraphQLService



<div align="center">
  <img src="https://github.com/lucasmargui/Flutter_Estrutura_Hasura_Integracao/assets/157809964/087977a0-3827-430d-b62f-2ae628ad4ad2" style="width:100%">
</div>

Ao definir GraphQLClient como uma variável late, significa que a declaramos, mas ainda não passaremos seu valor. Seu valor será inicializado após a chamada da função Future<void> init, que se conecta ao endpoint do GraphQL, cria um link de autenticação utilizando o token Bearer e, posteriormente, passa esse link concatenado para assim instanciar o cliente (client), passando o link com autenticação como propriedade.

Para evitar a criação repetida dessa instância em locator, podemos registrar GraphQLClient como um lazySingleton. Dessa forma, ele será instanciado apenas uma vez quando for invocado, e poderemos acessar as propriedades da classe repetidamente, pois estarão armazenadas em memória.



<div align="center">
  <img src="https://github.com/lucasmargui/Flutter_Estrutura_Hasura_Integracao/assets/157809964/a10864f5-63a0-43fe-b9c8-20260fa6d21e" style="width:70%">
</div>


### Consulta utilizando GraphQLService

Final client está recuperando a propriedade client da classe GraphQLService que é um Singleton, quando a função init foo executada (no caso de um registro ou de login bem sucedido) o link de autenticação armazenado em client vai pertencer a classe GraphQLService e será armazenada em memória podendo ser acessado em nivel global a qualquer momento


<div align="center">
  <img src="https://github.com/lucasmargui/Flutter_Estrutura_Hasura_Integracao/assets/157809964/9bc44fb6-feb0-456d-b824-b29b7f90c63e" style="width:70%">
</div>


Com acesso autenticado, realizaremos uma query através da API do Hasura e faremos uma consulta no banco de dados na tabela Transactions e ulilizaremos a query armazenada em constants/queries



<div align="center">
  <img src="https://github.com/lucasmargui/Flutter_Estrutura_Hasura_Integracao/assets/157809964/6773d5f5-6356-4a07-b3e3-e5c2e1b59a60" style="width:45%">
   <img src="https://github.com/lucasmargui/Flutter_Estrutura_Hasura_Integracao/assets/157809964/db686221-8f65-41c6-adbe-3bc0757f99ef" style="width:45%">
</div>












