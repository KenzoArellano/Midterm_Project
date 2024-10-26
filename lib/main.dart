import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/money_provider.dart';
import 'screens/home_screen.dart';
import 'screens/income_screen.dart';
import 'screens/expense_screen.dart';
import 'screens/settings_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MoneyProvider(),
      child: MaterialApp(
        title: 'Money Management',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeScreen(),
          '/income': (context) => const IncomeScreen(),
          '/expense': (context) => const ExpenseScreen(),
          '/settings': (context) => const SettingsScreen(),
        },
      ),
    );
  }
}
