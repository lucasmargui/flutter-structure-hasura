// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloudfunction_app/features/home/home_state.dart';
import 'package:cloudfunction_app/services/graphql_service.dart';
import 'package:flutter/foundation.dart';

import '../../common/models/transaction_model.dart';
import '../../repositories/transaction_repository.dart';

class HomeController extends ChangeNotifier {
  final TransactionRepository transactionRepository;

  HomeController({required this.transactionRepository});

  HomeState _state = HomeInitialState();

  HomeState get state => _state;

  List<TransactionModel> _transactions = [];

  List<TransactionModel> get transactions => _transactions;

  void _changeState(HomeState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> getAllTransactions() async {
    _changeState(HomeLoadingState());

    try {
      await transactionRepository.getAllTransactions();

      _changeState(HomeSuccessState());
    } catch (e) {
      _changeState(HomeErrorState(e.toString()));
    }
  }
}
