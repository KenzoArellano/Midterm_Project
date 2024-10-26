import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Settings",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ListTile(
              title: const Text("Change Theme"),
              onTap: () {},
            ),
            ListTile(
              title: const Text("Manage Notifications"),
              onTap: () {},
            ),
            ListTile(
              title: const Text("Privacy Policy"),
              onTap: () {},
            ),
            ListTile(
              title: const Text("About"),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
