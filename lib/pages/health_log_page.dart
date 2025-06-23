import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/health_entry.dart';
import '../providers/health_data_provider.dart';

/// Screen that allows users to log health data.
class HealthLogPage extends StatefulWidget {
  const HealthLogPage({super.key});

  @override
  State<HealthLogPage> createState() => _HealthLogPageState();
}

class _HealthLogPageState extends State<HealthLogPage> {
  final _formKey = GlobalKey<FormState>();
  final _systolicController = TextEditingController();
  final _diastolicController = TextEditingController();
  final _sugarController = TextEditingController();
  final _weightController = TextEditingController();

  @override
  void dispose() {
    _systolicController.dispose();
    _diastolicController.dispose();
    _sugarController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  void _saveEntry() {
    if (_formKey.currentState!.validate()) {
      final entry = HealthEntry(
        date: DateTime.now(),
        systolic: int.parse(_systolicController.text),
        diastolic: int.parse(_diastolicController.text),
        bloodSugar: int.parse(_sugarController.text),
        weight: double.parse(_weightController.text),
      );
      Provider.of<HealthDataProvider>(context, listen: false).addEntry(entry);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('บันทึกสุขภาพ')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _systolicController,
                decoration: const InputDecoration(labelText: 'ความดันบน (mmHg)'),
                keyboardType: TextInputType.number,
                validator: (v) => v!.isEmpty ? 'กรุณาใส่ค่า' : null,
              ),
              TextFormField(
                controller: _diastolicController,
                decoration: const InputDecoration(labelText: 'ความดันล่าง (mmHg)'),
                keyboardType: TextInputType.number,
                validator: (v) => v!.isEmpty ? 'กรุณาใส่ค่า' : null,
              ),
              TextFormField(
                controller: _sugarController,
                decoration: const InputDecoration(labelText: 'น้ำตาลในเลือด (mg/dL)'),
                keyboardType: TextInputType.number,
                validator: (v) => v!.isEmpty ? 'กรุณาใส่ค่า' : null,
              ),
              TextFormField(
                controller: _weightController,
                decoration: const InputDecoration(labelText: 'น้ำหนัก (kg)'),
                keyboardType: TextInputType.number,
                validator: (v) => v!.isEmpty ? 'กรุณาใส่ค่า' : null,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _saveEntry,
                child: const Text('บันทึก'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
