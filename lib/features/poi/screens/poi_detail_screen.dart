import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' show Value;
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as p;
import 'package:uuid/uuid.dart';

import '../../../core/database/database.dart';
import '../../../core/providers/database_provider.dart';
import '../providers/poi_provider.dart';

class PoiDetailScreen extends ConsumerWidget {
  final String poiId;

  const PoiDetailScreen({super.key, required this.poiId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final poiAsync = ref.watch(poiByIdProvider(poiId));
    final mediaAsync = ref.watch(mediaAssetsByPoiProvider(poiId));
    final chunksAsync = ref.watch(timeChunksByPoiProvider(poiId));

    return Scaffold(
      appBar: AppBar(
        title: poiAsync.when(
          data: (poi) => Text(poi.name),
          loading: () => const Text('Loading...'),
          error: (_, _) => const Text('Error'),
        ),
        actions: [
          poiAsync.when(
            data: (poi) => PopupMenuButton<String>(
              onSelected: (action) =>
                  _handleAction(context, ref, action, poi),
              itemBuilder: (_) => [
                const PopupMenuItem(value: 'edit', child: Text('Edit')),
                const PopupMenuItem(value: 'delete', child: Text('Delete')),
              ],
            ),
            loading: () => const SizedBox.shrink(),
            error: (_, _) => const SizedBox.shrink(),
          ),
        ],
      ),
      body: poiAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
        data: (poi) => SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (poi.animeSeriesRef != null) ...[
                Chip(label: Text(poi.animeSeriesRef!)),
                const SizedBox(height: 12),
              ],
              if (poi.description != null) ...[
                Text(
                  poi.description!,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 16),
              ],
              if (poi.address != null)
                ListTile(
                  leading: const Icon(Icons.location_on),
                  title: Text(poi.address!),
                  contentPadding: EdgeInsets.zero,
                ),
              ListTile(
                leading: const Icon(Icons.gps_fixed),
                title: Text('${poi.lat}, ${poi.lng}'),
                contentPadding: EdgeInsets.zero,
              ),
              if (poi.businessHours != null)
                ListTile(
                  leading: const Icon(Icons.access_time),
                  title: Text(poi.businessHours!),
                  contentPadding: EdgeInsets.zero,
                ),
              if (poi.tags != null) ...[
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: (poi.tags!.split(','))
                      .map((tag) => Chip(label: Text(tag.trim())))
                      .toList(),
                ),
              ],

              // Schedule section
              const Divider(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Schedule',
                      style: Theme.of(context).textTheme.titleMedium),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () =>
                        _showScheduleDialog(context, ref, poi.id),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              chunksAsync.when(
                loading: () => const CircularProgressIndicator(),
                error: (err, _) => Text('Error: $err'),
                data: (chunks) {
                  if (chunks.isEmpty) {
                    return const Text('Not scheduled yet. Tap + to add.');
                  }
                  return Column(
                    children: chunks
                        .map((chunk) => Card(
                              child: ListTile(
                                leading: _statusIcon(chunk.status),
                                title: Text(chunk.date ?? 'Backlog'),
                                subtitle: chunk.startTime != null
                                    ? Text(
                                        '${chunk.startTime} - ${chunk.endTime ?? '?'}')
                                    : null,
                                trailing: PopupMenuButton<String>(
                                  onSelected: (action) =>
                                      _handleChunkAction(
                                          context, ref, action, chunk),
                                  itemBuilder: (_) => [
                                    const PopupMenuItem(
                                        value: 'schedule',
                                        child: Text('Schedule')),
                                    const PopupMenuItem(
                                        value: 'complete',
                                        child: Text('Complete')),
                                    const PopupMenuItem(
                                        value: 'skip',
                                        child: Text('Skip')),
                                    const PopupMenuItem(
                                        value: 'backlog',
                                        child: Text('To Backlog')),
                                    const PopupMenuItem(
                                        value: 'delete',
                                        child: Text('Delete')),
                                  ],
                                ),
                              ),
                            ))
                        .toList(),
                  );
                },
              ),

              // Media section
              const Divider(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Media Assets',
                      style: Theme.of(context).textTheme.titleMedium),
                  FilledButton.tonalIcon(
                    onPressed: () =>
                        context.push('/camera?poiId=${poi.id}'),
                    icon: const Icon(Icons.camera_alt, size: 18),
                    label: const Text('Take Photo'),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              mediaAsync.when(
                loading: () => const CircularProgressIndicator(),
                error: (err, _) => Text('Error: $err'),
                data: (assets) {
                  if (assets.isEmpty) {
                    return const Text('No media assets yet.');
                  }
                  return Column(
                    children: assets
                        .map((asset) => _MediaAssetTile(
                              asset: asset,
                              onRename: () =>
                                  _renameMediaAsset(context, ref, asset),
                              onDelete: () =>
                                  _deleteMediaAsset(context, ref, asset),
                              onPreview: _isPreviewableImage(asset)
                                  ? () => _showImagePreview(context, asset)
                                  : null,
                              title: _mediaAssetTitle(asset),
                              icon: _iconForType(asset.type),
                            ))
                        .toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleAction(
      BuildContext context, WidgetRef ref, String action, Poi poi) {
    switch (action) {
      case 'edit':
        context.push('/rois/${poi.roiId}/pois/${poi.id}/edit');
        break;
      case 'delete':
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Delete Location?'),
            content: Text('This will permanently delete "${poi.name}".'),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(ctx),
                  child: const Text('Cancel')),
              FilledButton(
                onPressed: () async {
                  final db = ref.read(databaseProvider);
                  await db.deletePoi(poi.id);
                  if (context.mounted) {
                    Navigator.pop(ctx);
                    context.pop();
                  }
                },
                child: const Text('Delete'),
              ),
            ],
          ),
        );
        break;
    }
  }

  void _showScheduleDialog(
      BuildContext context, WidgetRef ref, String poiId) {
    DateTime? selectedDate;
    final startController = TextEditingController(text: '10:00');
    final endController = TextEditingController(text: '12:00');
    String status = 'backlog';

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          title: const Text('Add Time Slot'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SegmentedButton<String>(
                segments: const [
                  ButtonSegment(value: 'backlog', label: Text('Backlog')),
                  ButtonSegment(value: 'scheduled', label: Text('Schedule')),
                ],
                selected: {status},
                onSelectionChanged: (s) =>
                    setDialogState(() => status = s.first),
              ),
              const SizedBox(height: 16),
              if (status == 'scheduled') ...[
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.calendar_today),
                  title: Text(selectedDate != null
                      ? DateFormat('yyyy-MM-dd').format(selectedDate!)
                      : 'Select Date'),
                  onTap: () async {
                    final picked = await showDatePicker(
                      context: ctx,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2024),
                      lastDate: DateTime(2030),
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
            ],
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(ctx),
                child: const Text('Cancel')),
            FilledButton(
              onPressed: () {
                final db = ref.read(databaseProvider);
                db.insertTimeChunk(TimeChunksCompanion.insert(
                  id: const Uuid().v4(),
                  poiId: poiId,
                  date: Value(selectedDate != null
                      ? DateFormat('yyyy-MM-dd').format(selectedDate!)
                      : null),
                  startTime: Value(status == 'scheduled'
                      ? startController.text.trim()
                      : null),
                  endTime: Value(status == 'scheduled'
                      ? endController.text.trim()
                      : null),
                  status: Value(status),
                ));
                Navigator.pop(ctx);
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }

  void _handleChunkAction(BuildContext context, WidgetRef ref, String action,
      TimeChunk chunk) async {
    final db = ref.read(databaseProvider);
    switch (action) {
      case 'delete':
        await db.deleteTimeChunk(chunk.id);
        break;
      case 'schedule':
      case 'complete':
      case 'skip':
      case 'backlog':
        await db.updateTimeChunk(TimeChunksCompanion(
          id: Value(chunk.id),
          poiId: Value(chunk.poiId),
          date: Value(chunk.date),
          startTime: Value(chunk.startTime),
          endTime: Value(chunk.endTime),
          status: Value(action == 'schedule'
              ? 'scheduled'
              : action == 'complete'
                  ? 'completed'
                  : action == 'skip'
                      ? 'skipped'
                      : 'backlog'),
        ));
        break;
    }
  }

  Widget _statusIcon(String status) {
    return switch (status) {
      'completed' => const Icon(Icons.check_circle, color: Colors.green),
      'scheduled' => const Icon(Icons.schedule, color: Colors.blue),
      'skipped' => const Icon(Icons.skip_next, color: Colors.orange),
      _ => const Icon(Icons.inbox, color: Colors.grey),
    };
  }

  Widget _iconForType(String type) {
    return switch (type) {
      'reference_frame' => const Icon(Icons.image),
      'user_photo' => const Icon(Icons.camera_alt),
      'uploaded_image' => const Icon(Icons.save_alt),
      'ticket_qr' => const Icon(Icons.qr_code),
      'audio_bgm' => const Icon(Icons.music_note),
      _ => const Icon(Icons.attachment),
    };
  }

  String _mediaAssetTitle(MediaAsset asset) {
    final fileName = p.basenameWithoutExtension(asset.localUri);
    return fileName.isEmpty ? asset.type : fileName;
  }

  Future<void> _renameMediaAsset(
    BuildContext context,
    WidgetRef ref,
    MediaAsset asset,
  ) async {
    final oldFile = File(asset.localUri);
    final currentName = p.basenameWithoutExtension(asset.localUri);
    final controller = TextEditingController(text: currentName);

    final newName = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Rename Image'),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: const InputDecoration(labelText: 'Image name'),
          textInputAction: TextInputAction.done,
          onSubmitted: (value) => Navigator.pop(ctx, value.trim()),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, controller.text.trim()),
            child: const Text('Rename'),
          ),
        ],
      ),
    );

    controller.dispose();
    if (newName == null || newName.isEmpty || newName == currentName) return;
    if (!context.mounted) return;

    final sanitizedName = p.basenameWithoutExtension(_sanitizeFileName(newName));
    if (sanitizedName.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid image name.')),
      );
      return;
    }

    if (!await oldFile.exists()) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Image file not found: ${asset.localUri}')),
      );
      return;
    }

    final extension = p.extension(asset.localUri).isEmpty
        ? '.jpg'
        : p.extension(asset.localUri);
    final newPath = await _nextAvailableMediaPath(
      p.dirname(asset.localUri),
      sanitizedName,
      extension,
      asset.localUri,
    );

    try {
      await oldFile.rename(newPath);

      await ref.read(databaseProvider).updateMediaAssetLocalUri(
            asset.id,
            newPath,
          );

      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Image renamed.')),
      );
    } catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Rename failed: $e')),
      );
    }
  }

  Future<void> _deleteMediaAsset(
    BuildContext context,
    WidgetRef ref,
    MediaAsset asset,
  ) async {
    final shouldDelete = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Image?'),
        content: Text('This will remove "${_mediaAssetTitle(asset)}".'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (shouldDelete != true) return;

    try {
      final file = File(asset.localUri);
      if (await file.exists()) {
        await file.delete();
      }

      await ref.read(databaseProvider).deleteMediaAsset(asset.id);

      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Image deleted.')),
      );
    } catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Delete failed: $e')),
      );
    }
  }

  String _sanitizeFileName(String input) {
    return input.replaceAll(RegExp(r'[\\/:*?"<>|]'), '_').trim();
  }

  Future<String> _nextAvailableMediaPath(
    String directory,
    String baseName,
    String extension,
    String currentPath,
  ) async {
    var candidate = p.join(directory, '$baseName$extension');
    var suffix = 1;

    while (candidate != currentPath && await File(candidate).exists()) {
      candidate = p.join(directory, '$baseName-$suffix$extension');
      suffix += 1;
    }

    return candidate;
  }

  bool _isPreviewableImage(MediaAsset asset) {
    final uri = asset.localUri.toLowerCase();
    final isKnownImageType = asset.type == 'user_photo' ||
        asset.type == 'uploaded_image' ||
        asset.type == 'reference_frame' ||
        asset.type == 'ticket_qr';
    final hasImageExtension = uri.endsWith('.jpg') ||
        uri.endsWith('.jpeg') ||
        uri.endsWith('.png') ||
        uri.endsWith('.webp') ||
        uri.endsWith('.gif') ||
        uri.endsWith('.heic');

    return isKnownImageType || hasImageExtension;
  }

  void _showImagePreview(BuildContext context, MediaAsset asset) {
    final imageFile = File(asset.localUri);

    showDialog(
      context: context,
      builder: (ctx) => Dialog.fullscreen(
        backgroundColor: Colors.black,
        child: Stack(
          fit: StackFit.expand,
          children: [
            FutureBuilder<bool>(
              future: imageFile.exists(),
              builder: (context, snapshot) {
                final exists = snapshot.data ?? false;

                if (snapshot.connectionState != ConnectionState.done) {
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  );
                }

                if (!exists) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Text(
                        'Image file not found:\n${asset.localUri}',
                        style: const TextStyle(color: Colors.white70),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }

                return InteractiveViewer(
                  minScale: 0.75,
                  maxScale: 4,
                  child: Center(
                    child: Image.file(imageFile, fit: BoxFit.contain),
                  ),
                );
              },
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SafeArea(
                child: AppBar(
                  backgroundColor: Colors.black54,
                  foregroundColor: Colors.white,
                  title: Text(asset.type),
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(ctx),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MediaAssetTile extends StatelessWidget {
  final MediaAsset asset;
  final String title;
  final Widget icon;
  final VoidCallback onRename;
  final VoidCallback onDelete;
  final VoidCallback? onPreview;

  const _MediaAssetTile({
    required this.asset,
    required this.title,
    required this.icon,
    required this.onRename,
    required this.onDelete,
    required this.onPreview,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(title, maxLines: 1, overflow: TextOverflow.ellipsis),
      subtitle: Text(
        asset.localUri,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      contentPadding: EdgeInsets.zero,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            tooltip: 'Rename',
            icon: const Icon(Icons.edit_outlined),
            onPressed: onRename,
          ),
          IconButton(
            tooltip: 'Delete',
            icon: const Icon(Icons.delete_outline),
            onPressed: onDelete,
          ),
          IconButton(
            tooltip: 'Preview',
            icon: const Icon(Icons.open_in_full),
            onPressed: onPreview,
          ),
        ],
      ),
    );
  }
}
