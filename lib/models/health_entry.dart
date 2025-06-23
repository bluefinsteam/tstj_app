import 'package:flutter/material.dart';

/// Represents a single log of health data.
/// Represents a single log of health data.
class HealthEntry {
  HealthEntry({
    required this.date,
    required this.systolic,
    required this.diastolic,
    required this.bloodSugar,
    required this.weight,
  });

  final DateTime date;
  final int systolic;
  final int diastolic;
  final int bloodSugar;
  final double weight;

  /// Converts this entry to a JSON encodable map.
  Map<String, dynamic> toMap() => {
        'date': date.toIso8601String(),
        'systolic': systolic,
        'diastolic': diastolic,
        'bloodSugar': bloodSugar,
        'weight': weight,
      };

  /// Creates an entry from a previously encoded map.
  factory HealthEntry.fromMap(Map<String, dynamic> map) => HealthEntry(
        date: DateTime.parse(map['date'] as String),
        systolic: map['systolic'] as int,
        diastolic: map['diastolic'] as int,
        bloodSugar: map['bloodSugar'] as int,
        weight: (map['weight'] as num).toDouble(),
      );
}
