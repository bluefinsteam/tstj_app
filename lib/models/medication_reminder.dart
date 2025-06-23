/// Represents a reminder to take medication.
class MedicationReminder {
  MedicationReminder({required this.time, required this.name});

  final String name; // Name of the medication
  final DateTime time; // Time to take it
}
