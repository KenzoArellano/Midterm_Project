import 'package:flutter/foundation.dart';

class MoneyProvider with ChangeNotifier {
  double _balance = 0.0;
  double _totalIncome = 0.0;
  double _totalExpense = 0.0;

  final List<String> _recentIncome = [];
  final List<String> _recentExpenses = [];

  double get balance => _balance;
  double get totalIncome => _totalIncome;
  double get totalExpense => _totalExpense;

  List<String> get recentIncome => _recentIncome;
  List<String> get recentExpenses => _recentExpenses;

  void addIncome(String name, double amount) {
    _balance += amount;
    _totalIncome += amount;

    _recentIncome.insert(0, "$name: \$${amount.toStringAsFixed(2)}");
    notifyListeners();
  }

  void addExpense(String name, double amount) {
    _balance -= amount;
    _totalExpense += amount;

    _recentExpenses.insert(0, "$name: \$${amount.toStringAsFixed(2)}");
    notifyListeners();
  }
}
