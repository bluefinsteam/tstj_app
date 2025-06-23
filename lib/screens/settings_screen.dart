import 'package:flutter/material.dart';

/// Settings screen with placeholders for language and font size.
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        ListTile(
          title: const Text('Language'),
          trailing: DropdownButton<String>(
            value: 'en',
            items: const [
              DropdownMenuItem(value: 'en', child: Text('English')),
              DropdownMenuItem(value: 'th', child: Text('ไทย')),
            ],
            onChanged: (_) {},
          ),
        ),
        ListTile(
          title: const Text('Font size'),
          trailing: DropdownButton<double>(
            value: 16,
            items: const [
              DropdownMenuItem(value: 14, child: Text('Small')),
              DropdownMenuItem(value: 16, child: Text('Normal')),
              DropdownMenuItem(value: 20, child: Text('Large')),
            ],
            onChanged: (_) {},
          ),
        ),
      ],
    );
  }
}
