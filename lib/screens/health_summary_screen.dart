import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';
import '../providers/health_data_provider.dart';

/// Shows a simple line chart of health data.
class HealthSummaryScreen extends StatelessWidget {
  const HealthSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final entries = context.watch<HealthDataProvider>().entries;
    final spots = entries.asMap().entries.map((e) {
      return FlSpot(e.key.toDouble(), e.value.systolic.toDouble());
    }).toList();
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: LineChart(
          LineChartData(
            lineBarsData: [
              LineChartBarData(spots: spots),
            ],
          ),
        ),
      ),
    );
  }
}
