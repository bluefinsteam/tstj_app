import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../services/api_service.dart';
import '../providers/health_data_provider.dart';
import 'data_history_screen.dart';
import 'health_form_screen.dart';
import 'health_summary_screen.dart';
import 'reminders_screen.dart';
import 'settings_screen.dart';

/// Main dashboard with bottom navigation.
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _index = 0;
  Map<String, dynamic>? _apiData;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    final data = await const ApiService().fetchExamplePost();
    setState(() => _apiData = data);
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      const HealthSummaryScreen(),
      const DataHistoryScreen(),
      const RemindersScreen(),
      const SettingsScreen(),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(_apiData != null ? _apiData!['title'] as String : 'Dashboard'),
      ),
      body: IndexedStack(index: _index, children: pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(icon: Icon(Icons.alarm), label: 'Reminders'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
      floatingActionButton: _index == 1
          ? FloatingActionButton(
              onPressed: () => context.push('/add'),
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}
