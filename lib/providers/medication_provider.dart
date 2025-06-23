import 'package:flutter/material.dart';
import '../models/medication_reminder.dart';
import '../services/local_storage_service.dart';

/// Stores medication reminders. Replace with local notification integration
/// when implementing real reminders.
class MedicationProvider extends ChangeNotifier {
  final List<MedicationReminder> _reminders = [];

  MedicationProvider() {
    _load();
  }

  List<MedicationReminder> get reminders => List.unmodifiable(_reminders);

  void addReminder(MedicationReminder reminder) {
    _reminders.add(reminder);
    _save();
    notifyListeners();
  }

  Future<void> _load() async {
    final data = await LocalStorageService.instance.loadReminders();
    _reminders
      ..clear()
      ..addAll(
        data.map((e) => MedicationReminder.fromMap(e as Map<String, dynamic>)),
      );
    notifyListeners();
  }

  Future<void> _save() async {
    final list = _reminders.map((e) => e.toMap()).toList();
    await LocalStorageService.instance.saveReminders(list);
  }
}
