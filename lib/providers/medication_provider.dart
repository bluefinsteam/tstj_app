import 'package:flutter/material.dart';
import '../models/medication_reminder.dart';

/// Stores medication reminders. Replace with local notification integration
/// when implementing real reminders.
class MedicationProvider extends ChangeNotifier {
  final List<MedicationReminder> _reminders = [];

  List<MedicationReminder> get reminders => List.unmodifiable(_reminders);

  void addReminder(MedicationReminder reminder) {
    _reminders.add(reminder);
    notifyListeners();
  }
}
