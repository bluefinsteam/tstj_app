import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/health_data_provider.dart';

/// Displays logged health entries in a list.
class DataHistoryScreen extends StatelessWidget {
  const DataHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final entries = context.watch<HealthDataProvider>().entries;
    return ListView.builder(
      itemCount: entries.length,
      itemBuilder: (context, index) {
        final e = entries[index];
        return ListTile(
          title: Text('${e.systolic}/${e.diastolic} mmHg'),
          subtitle: Text(
              'Sugar: ${e.bloodSugar} mg/dL  Weight: ${e.weight} kg'),
          trailing: Text('${e.date.month}/${e.date.day}'),
        );
      },
    );
  }
}
