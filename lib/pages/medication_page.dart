import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/medication_reminder.dart';
import '../providers/medication_provider.dart';

/// Page listing medication reminders.
class MedicationPage extends StatelessWidget {
  const MedicationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('แจ้งเตือนยา')),
      body: Consumer<MedicationProvider>(
        builder: (context, provider, _) {
          return ListView.builder(
            itemCount: provider.reminders.length,
            itemBuilder: (context, index) {
              final reminder = provider.reminders[index];
              return ListTile(
                title: Text(reminder.name),
                subtitle: Text('เวลา ${reminder.time.hour}:${reminder.time.minute.toString().padLeft(2, '0')}'),
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
          title: const Text('เพิ่มการเตือนยา'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'ชื่อยา'),
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
                child: const Text('เลือกเวลา'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('ยกเลิก'),
            ),
            TextButton(
              onPressed: () {
                if (selectedTime != null && nameController.text.isNotEmpty) {
                  final now = DateTime.now();
                  final dt = DateTime(now.year, now.month, now.day,
                      selectedTime!.hour, selectedTime!.minute);
                  final reminder = MedicationReminder(
                    name: nameController.text,
                    time: dt,
                  );
                  Provider.of<MedicationProvider>(context, listen: false)
                      .addReminder(reminder);
                  Navigator.pop(context);
                }
              },
              child: const Text('บันทึก'),
            ),
          ],
        );
      },
    );
  }
}
