<H1 align="center">Flutter Firebase integração com Hasura</H1>
<p align="center">🚀 Desenvolvimento de uma estrutura contendo Firebase,GraphQL e CloudFunctions para referências futuras</p>

## Recursos Utilizados
- Flutter 3.3.5
- Get_it 7.6.0
- Firebase_core 2.24.2
- Firebase_auth 4.16.0
- cloud_functions: ^4.6.0
- graphql_flutter: ^5.1.2

## Estrutura

A estrutura a seguir foi desenvolvida como base a utilização de Flutter_Estrutura_Firebase.




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

Configuração do index.js com base no console do projeto criado no Hasura:



<div align="center">
  <img src="https://github.com/lucasmargui/Flutter_Estrutura_Hasura_Integracao/assets/157809964/7ae03f00-7238-4170-8363-ea6153709125" style="width:50%">
</div>


<div align="center">
   <img src="https://github.com/lucasmargui/Flutter_Estrutura_Hasura_Integracao/assets/157809964/52c805fc-eb17-4629-ba1b-8987c3839a44" style="width:100%">
</div>

### Exportando funções para Cloud Functions

Configure as funções de acordo com a lógica desejada e com base nas necessidades do seu projeto e nos endpoints fornecidos pelo Hasura. Isso normalmente envolve a definição de resolvers GraphQL e a conexão com o banco de dados Hasura. Ao final de exportar as funções utilize o comando para exportar as funções para cloud function



<div align="center">
   <img src="https://github.com/lucasmargui/Flutter_Estrutura_Hasura_Integracao/assets/157809964/530de225-dbd5-431f-85bf-136428306321" style="width:100%">
</div>

Comando para exportar as funções

```
firebase deploy

```





