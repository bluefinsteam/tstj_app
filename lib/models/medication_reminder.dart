/// Represents a reminder to take medication.
/// Represents a reminder to take medication.
class MedicationReminder {
  MedicationReminder({required this.time, required this.name});

  final String name; // Name of the medication
  final DateTime time; // Time to take it

  /// Converts the reminder to a JSON encodable map.
  Map<String, dynamic> toMap() => {
        'name': name,
        'time': time.toIso8601String(),
      };

  /// Creates a reminder from stored data.
  factory MedicationReminder.fromMap(Map<String, dynamic> map) =>
      MedicationReminder(
        name: map['name'] as String,
        time: DateTime.parse(map['time'] as String),
      );
}
