import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' show Value;
import 'package:intl/intl.dart';

import '../../../core/database/database.dart';
import '../../../core/providers/database_provider.dart';

Future<void> handleTimeChunkAction(BuildContext context, WidgetRef ref, String action, TimeChunk chunk) async {
  final db = ref.read(databaseProvider);
  switch (action) {
    case 'delete':
      await confirmDeleteTimeChunkAndRemove(context, ref, chunk);
      break;
    case 'edit':
      showScheduleEditDialog(context, ref, chunk);
      break;
    case 'scheduled':
    case 'completed':
    case 'skipped':
      await db.updateTimeChunk(TimeChunksCompanion(
        id: Value(chunk.id),
        poiId: Value(chunk.poiId),
        date: Value(chunk.date),
        startTime: Value(chunk.startTime),
        endTime: Value(chunk.endTime),
        status: Value(action),
      ));
      break;
    case 'backlog':
      await db.updateTimeChunk(TimeChunksCompanion(
        id: Value(chunk.id),
        poiId: Value(chunk.poiId),
        date: Value(null),
        startTime: Value(null),
        endTime: Value(null),
        status: Value(action),
      ));
      break;
  }
}

void showScheduleEditDialog(
  BuildContext context, WidgetRef ref, TimeChunk chunk) {
DateTime? selectedDate = chunk.date != null 
  ? DateFormat('yyyy-MM-dd').parse(chunk.date!) 
  : DateTime.now();
final startController = TextEditingController(text: chunk.startTime ?? '10:00');
final endController = TextEditingController(text: chunk.endTime ?? '12:00');

  showDialog(
    context: context,
    builder: (ctx) => StatefulBuilder(
      builder: (ctx, setDialogState) => AlertDialog(
        title: const Text('Edit Time Slot'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.calendar_today),
              title: Text(selectedDate != null
                  ? DateFormat('yyyy-MM-dd').format(selectedDate!)
                  : 'Select Date'),
              onTap: () async {
                final picked = await showDatePicker(
                  context: ctx,
                  initialDate: selectedDate,
                  firstDate: DateTime(DateTime.now().year - 10),
                  lastDate: DateTime(DateTime.now().year + 10),
                );
                if (picked != null) {
                  setDialogState(() => selectedDate = picked);
                }
              },
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: startController,
                    decoration:
                        const InputDecoration(labelText: 'Start'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    controller: endController,
                    decoration:
                        const InputDecoration(labelText: 'End'),
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Cancel')),
          FilledButton(
            onPressed: () {
              final db = ref.read(databaseProvider);
              db.updateTimeChunk(TimeChunksCompanion(
                id: Value(chunk.id),
                poiId: Value(chunk.poiId),
                date: Value(selectedDate != null
                    ? DateFormat('yyyy-MM-dd').format(selectedDate!)
                    : null),
                startTime: Value(startController.text.trim()),
                endTime: Value(endController.text.trim()),
                status: Value(chunk.status != 'backlog' ? chunk.status : 'scheduled'),
              ));
              Navigator.pop(ctx);
            },
            child: const Text('Edit'),
          ),
        ],
      ),
    ),
  );
}

Future<void> confirmDeleteTimeChunkAndRemove(
    BuildContext context, WidgetRef ref, TimeChunk chunk) async {
  final confirm = await showDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: const Text('Delete Schedule?'),
      content: const Text('This will permanently delete the schedule entry.'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(ctx).pop(false),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.of(ctx).pop(true),
          child: const Text('Delete'),
        ),
      ],
    ),
  );
  if (confirm == true) {
    await _deleteChunk(ref, chunk);
  }
}

Future<void> _deleteChunk(WidgetRef ref, TimeChunk chunk) async {
  final db = ref.read(databaseProvider);
  await db.deleteTimeChunk(chunk.id);
}