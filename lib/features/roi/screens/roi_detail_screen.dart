import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/providers/database_provider.dart';
import '../providers/roi_provider.dart';
import '../../poi/providers/poi_provider.dart';

class RoiDetailScreen extends ConsumerWidget {
  final String roiId;

  const RoiDetailScreen({super.key, required this.roiId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final roiAsync = ref.watch(roiByIdProvider(roiId));
    final poisAsync = ref.watch(poisByRoiProvider(roiId));

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/pois?tab=region'),
        ),
        title: roiAsync.when(
          data: (roi) => Text(roi.name),
          loading: () => const Text('Loading...'),
          error: (_, _) => const Text('Error'),
        ),
        actions: [
          roiAsync.when(
            data: (roi) => PopupMenuButton<String>(
              onSelected: (action) {
                if (action == 'delete') {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const Text('Delete Region?'),
                      content: Text(
                          'This will permanently delete "${roi.name}" and all its locations.'),
                      actions: [
                        TextButton(
                            onPressed: () => Navigator.pop(ctx),
                            child: const Text('Cancel')),
                        FilledButton(
                          onPressed: () async {
                            final db = ref.read(databaseProvider);
                            await db.deleteRoi(roi.id);
                            if (context.mounted) {
                              Navigator.pop(ctx);
                              context.go('/rois');
                            }
                          },
                          child: const Text('Delete'),
                        ),
                      ],
                    ),
                  );
                }
              },
              itemBuilder: (_) => [
                const PopupMenuItem(value: 'delete', child: Text('Delete')),
              ],
            ),
            loading: () => const SizedBox.shrink(),
            error: (_, _) => const SizedBox.shrink(),
          ),
        ],
      ),
      body: poisAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
        data: (pois) {
          if (pois.isEmpty) {
            return const Center(
              child: Text('No locations yet. Tap + to add one.'),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: pois.length,
            itemBuilder: (context, index) {
              final poi = pois[index];
              return Card(
                child: ListTile(
                  title: Text(poi.name),
                  subtitle: poi.animeSeriesRef != null
                      ? Text(poi.animeSeriesRef!)
                      : poi.address != null
                          ? Text(poi.address!)
                          : null,
                  leading: const Icon(Icons.location_on),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => context.push('/pois/${poi.id}'),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/rois/$roiId/pois/new'),
        child: const Icon(Icons.add_location),
      ),
    );
  }
}
