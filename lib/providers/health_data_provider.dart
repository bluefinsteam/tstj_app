import 'package:flutter/material.dart';
import '../models/health_entry.dart';

/// Holds the logged health data in memory. This can later be replaced with real
/// persistence.
class HealthDataProvider extends ChangeNotifier {
  final List<HealthEntry> _entries = [];

  List<HealthEntry> get entries => List.unmodifiable(_entries);

  void addEntry(HealthEntry entry) {
    _entries.add(entry);
    notifyListeners();
  }
}
