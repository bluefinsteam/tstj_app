import 'package:flutter/material.dart';
import '../models/health_entry.dart';
import '../services/local_storage_service.dart';

/// Holds the logged health data in memory. This can later be replaced with real
/// persistence.
class HealthDataProvider extends ChangeNotifier {
  final List<HealthEntry> _entries = [];

  HealthDataProvider() {
    _load();
  }

  List<HealthEntry> get entries => List.unmodifiable(_entries);

  void addEntry(HealthEntry entry) {
    _entries.add(entry);
    _save();
    notifyListeners();
  }

  Future<void> _load() async {
    final data = await LocalStorageService.instance.loadHealthEntries();
    _entries
      ..clear()
      ..addAll(data.map((e) => HealthEntry.fromMap(e as Map<String, dynamic>)));
    notifyListeners();
  }

  Future<void> _save() async {
    final list = _entries.map((e) => e.toMap()).toList();
    await LocalStorageService.instance.saveHealthEntries(list);
  }
}
