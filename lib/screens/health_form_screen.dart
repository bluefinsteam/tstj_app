import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/health_entry.dart';
import '../providers/health_data_provider.dart';

/// Form screen for entering health data.
class HealthFormScreen extends StatefulWidget {
  const HealthFormScreen({super.key});

  @override
  State<HealthFormScreen> createState() => _HealthFormScreenState();
}

class _HealthFormScreenState extends State<HealthFormScreen> {
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
      context.read<HealthDataProvider>().addEntry(entry);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Log Health Data')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _systolicController,
                decoration: const InputDecoration(labelText: 'Systolic (mmHg)'),
                keyboardType: TextInputType.number,
                validator: (v) => v!.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: _diastolicController,
                decoration: const InputDecoration(labelText: 'Diastolic (mmHg)'),
                keyboardType: TextInputType.number,
                validator: (v) => v!.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: _sugarController,
                decoration: const InputDecoration(labelText: 'Blood Sugar (mg/dL)'),
                keyboardType: TextInputType.number,
                validator: (v) => v!.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: _weightController,
                decoration: const InputDecoration(labelText: 'Weight (kg)'),
                keyboardType: TextInputType.number,
                validator: (v) => v!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 24),
              ElevatedButton(onPressed: _saveEntry, child: const Text('Save')),
            ],
          ),
        ),
      ),
    );
  }
}
