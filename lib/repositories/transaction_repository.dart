import 'dart:developer';
import 'dart:html';

import 'package:cloudfunction_app/common/constants/queries/get_all_transactions.dart';
import 'package:cloudfunction_app/locator/locator.dart';
import 'package:cloudfunction_app/services/graphql_service.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../common/models/transaction_model.dart';

abstract class TransactionRepository {
  Future<void> addTransaction();
  Future<List<TransactionModel>> getAllTransactions();
}

class TransactionRepositoryImpl implements TransactionRepository {
  final client = locator.get<GraphQlService>().client;

  @override
  Future<void> addTransaction() {
    // TODO: implement addTransaction
    throw UnimplementedError();
  }

  @override
  Future<List<TransactionModel>> getAllTransactions() async {
    await Future.delayed(const Duration(seconds: 2));

    // return [
    //   TransactionModel(
    //       title: 'Salary',
    //       value: 500,
    //       date: DateTime.now().millisecondsSinceEpoch),
    //   TransactionModel(
    //     title: 'Dinner',
    //     value: -50,
    //     date: DateTime.now()
    //         .subtract(const Duration(days: 7))
    //         .millisecondsSinceEpoch,
    //   )
    // ];

    try {
      final response =
          await client.query(QueryOptions(document: gql(qGetAllTransactions)));
      log(response.data.toString());
      return [];
    } catch (e) {
      rethrow;
    }
  }
}
