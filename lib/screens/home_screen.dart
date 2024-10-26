import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/money_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final moneyProvider = Provider.of<MoneyProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Money Management"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        color: Colors.grey[200],
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: _buildInfoSquare(
                        label: "Balance",
                        value: "\$${moneyProvider.balance.toStringAsFixed(2)}",
                        color: Colors.grey[600]!,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildInfoSquare(
                        label: "Total Income",
                        value:
                            "\$${moneyProvider.totalIncome.toStringAsFixed(2)}",
                        color: Colors.grey[500]!,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildInfoSquare(
                        label: "Total Expense",
                        value:
                            "\$${moneyProvider.totalExpense.toStringAsFixed(2)}",
                        color: Colors.grey[400]!,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: _buildActionButton(
                          context, "Add Income", '/income',
                          width: 220),
                    ),
                    const SizedBox(width: 16), // Space between buttons
                    Expanded(
                      child: _buildActionButton(
                          context, "Add Expense", '/expense',
                          width: 220),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                _buildRecentTransactionsSection(moneyProvider),
              ],
            ),
            Positioned(
              bottom: 16,
              right: 16,
              child: _buildActionButton(context, "Settings", '/settings'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentTransactionsSection(MoneyProvider moneyProvider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Recent Income",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: moneyProvider.recentIncome.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Chip(
                        label: Text(moneyProvider.recentIncome[index]),
                        backgroundColor: Colors.green[300],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 16), // Space between income and expense sections
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Recent Expenses",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: moneyProvider.recentExpenses.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Chip(
                        label: Text(moneyProvider.recentExpenses[index]),
                        backgroundColor: Colors.red[300],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton(BuildContext context, String title, String route,
      {double width = 180}) {
    return SizedBox(
      width: width,
      height: 60,
      child: ElevatedButton(
        onPressed: () => Navigator.pushNamed(context, route),
        child: Text(title, style: const TextStyle(fontSize: 20)),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[800],
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoSquare(
      {required String label, required String value, required Color color}) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: color,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
