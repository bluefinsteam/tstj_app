import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

/// Simple wrapper around [SharedPreferences] for saving and loading
/// JSON encoded data. This can be extended to persist any model.
class LocalStorageService {
  LocalStorageService._();
  static final LocalStorageService instance = LocalStorageService._();

  static const _healthKey = 'health_entries';
  static const _reminderKey = 'medication_reminders';

  /// Saves a list of JSON encodable objects under the given key.
  Future<void> _saveList(String key, List<dynamic> list) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, jsonEncode(list));
  }

  /// Loads a list of dynamic objects from storage. Returns an empty list if
  /// nothing is stored.
  Future<List<dynamic>> _loadList(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonStr = prefs.getString(key);
    if (jsonStr == null) return [];
    return jsonDecode(jsonStr) as List<dynamic>;
  }

  Future<void> saveHealthEntries(List<Map<String, dynamic>> entries) async {
    await _saveList(_healthKey, entries);
  }

  Future<List<dynamic>> loadHealthEntries() async {
    return _loadList(_healthKey);
  }

  Future<void> saveReminders(List<Map<String, dynamic>> reminders) async {
    await _saveList(_reminderKey, reminders);
  }

  Future<List<dynamic>> loadReminders() async {
    return _loadList(_reminderKey);
  }
}
