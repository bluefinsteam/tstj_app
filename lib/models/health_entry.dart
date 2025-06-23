import 'package:flutter/material.dart';

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
}
