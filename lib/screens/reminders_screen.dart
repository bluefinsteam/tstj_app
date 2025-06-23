import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/medication_provider.dart';
import '../models/medication_reminder.dart';

/// Shows medication reminders and allows adding new ones.
class RemindersScreen extends StatelessWidget {
  const RemindersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<MedicationProvider>(
        builder: (context, provider, _) {
          return ListView.builder(
            itemCount: provider.reminders.length,
            itemBuilder: (context, index) {
              final r = provider.reminders[index];
              return ListTile(
                title: Text(r.name),
                subtitle: Text('${r.time.hour}:${r.time.minute.toString().padLeft(2, '0')}'),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addReminder(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _addReminder(BuildContext context) async {
    final nameController = TextEditingController();
    TimeOfDay? selectedTime;
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add reminder'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () async {
                  final time = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (time != null) {
                    selectedTime = time;
                  }
                },
                child: const Text('Select time'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (selectedTime != null && nameController.text.isNotEmpty) {
                  final now = DateTime.now();
                  final dt = DateTime(now.year, now.month, now.day, selectedTime!.hour, selectedTime!.minute);
                  final reminder = MedicationReminder(name: nameController.text, time: dt);
                  context.read<MedicationProvider>().addReminder(reminder);
                  Navigator.pop(context);
                }
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
