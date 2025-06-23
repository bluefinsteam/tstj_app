import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../providers/health_data_provider.dart';

/// Page displaying simple charts of health data and allowing export to PDF.
class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  Future<void> _exportPDF(BuildContext context) async {
    final entries =
        Provider.of<HealthDataProvider>(context, listen: false).entries;
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        build: (context) => pw.Column(
          children: entries
              .map((e) => pw.Text(
                  '${e.date}: BP ${e.systolic}/${e.diastolic} mmHg, Sugar ${e.bloodSugar}, Weight ${e.weight}'))
              .toList(),
        ),
      ),
    );
    await Printing.layoutPdf(onLayout: (format) => pdf.save());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('รายงานย้อนหลัง'),
        actions: [
          IconButton(
            icon: const Icon(Icons.picture_as_pdf),
            onPressed: () => _exportPDF(context),
          )
        ],
      ),
      body: Consumer<HealthDataProvider>(
        builder: (context, provider, _) {
          final spots = provider.entries
              .asMap()
              .entries
              .map((e) => FlSpot(
                    e.key.toDouble(),
                    e.value.systolic.toDouble(),
                  ))
              .toList();
          return Padding(
            padding: const EdgeInsets.all(16),
            child: LineChart(
              LineChartData(
                lineBarsData: [
                  LineChartBarData(spots: spots, isCurved: true),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
