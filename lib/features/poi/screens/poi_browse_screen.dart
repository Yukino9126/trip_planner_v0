import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:drift/drift.dart' show Value;
import 'package:uuid/uuid.dart';

import '../../../core/database/database.dart';
import '../../../core/providers/database_provider.dart';
import '../../roi/providers/roi_provider.dart';
import '../providers/poi_provider.dart';

class PoiBrowseScreen extends StatelessWidget {
  final String? initialTab;

  const PoiBrowseScreen({super.key, this.initialTab});

  static const _tabOrder = ['region', 'anime', 'tag', 'all'];

  @override
  Widget build(BuildContext context) {
    final initialIndex = _tabOrder.indexOf(initialTab ?? '');
    return DefaultTabController(
      length: 4,
      initialIndex: initialIndex >= 0 ? initialIndex : 0,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.go('/'),
          ),
          title: const Text('View POIs'),
          bottom: const TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            tabs: [
              Tab(icon: Icon(Icons.layers), text: 'By Region'),
              Tab(icon: Icon(Icons.movie_outlined), text: 'By Anime'),
              Tab(icon: Icon(Icons.label_outline), text: 'By Tag'),
              Tab(icon: Icon(Icons.list), text: 'All'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _ByRegionTab(),
            _ByAnimeTab(),
            _ByTagTab(),
            _AllPoisTab(),
          ],
        ),
        floatingActionButton: _ContextualFab(),
      ),
    );
  }
}

class _ContextualFab extends StatefulWidget {
  @override
  State<_ContextualFab> createState() => _ContextualFabState();
}

class _ContextualFabState extends State<_ContextualFab> {
  TabController? _controller;
  int _currentIndex = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final controller = DefaultTabController.of(context);
    if (controller != _controller) {
      _controller?.removeListener(_handleChange);
      _controller = controller;
      _controller!.addListener(_handleChange);
      _currentIndex = controller.index;
    }
  }

  void _handleChange() {
    if (!mounted) return;
    setState(() => _currentIndex = _controller!.index);
  }

  @override
  void dispose() {
    _controller?.removeListener(_handleChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_currentIndex == 0) {
      return FloatingActionButton(
        onPressed: () => _showCreateRoiDialog(context),
        tooltip: 'New Region',
        child: const Icon(Icons.add),
      );
    }
    return const SizedBox.shrink();
  }
}

class _ByRegionTab extends ConsumerWidget {
  const _ByRegionTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final roisAsync = ref.watch(allRoisProvider);

    return roisAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) => Center(child: Text('Error: $err')),
      data: (rois) {
        if (rois.isEmpty) {
          return const Center(
            child: Text('No regions yet. Tap + to create one.'),
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: rois.length,
          itemBuilder: (context, index) {
            final roi = rois[index];
            return Card(
              child: ListTile(
                leading: Icon(
                  roi.isOfflineCached == 1
                      ? Icons.cloud_done
                      : Icons.cloud_outlined,
                  color: Theme.of(context).colorScheme.primary,
                ),
                title: Text(roi.name),
                subtitle: roi.description != null
                    ? Text(roi.description!, maxLines: 2)
                    : null,
                trailing: const Icon(Icons.chevron_right),
                onTap: () => context.push('/rois/${roi.id}'),
              ),
            );
          },
        );
      },
    );
  }
}

class _ByAnimeTab extends ConsumerWidget {
  const _ByAnimeTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncSeries = ref.watch(distinctAnimeSeriesProvider);

    return asyncSeries.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) => Center(child: Text('Error: $err')),
      data: (names) {
        if (names.isEmpty) {
          return const Center(
            child: Text('No anime series yet. Add some when creating POIs.'),
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: names.length,
          itemBuilder: (context, index) {
            final name = names[index];
            return Card(
              child: ListTile(
                leading: Icon(
                  Icons.movie_outlined,
                  color: Theme.of(context).colorScheme.primary,
                ),
                title: Text(name),
                trailing: const Icon(Icons.chevron_right),
                onTap: () =>
                    context.push('/anime/${Uri.encodeComponent(name)}'),
              ),
            );
          },
        );
      },
    );
  }
}

class _ByTagTab extends ConsumerWidget {
  const _ByTagTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncTags = ref.watch(distinctTagsProvider);

    return asyncTags.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) => Center(child: Text('Error: $err')),
      data: (tags) {
        if (tags.isEmpty) {
          return const Center(
            child: Text('No tags yet. Add some when creating POIs.'),
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: tags.length,
          itemBuilder: (context, index) {
            final tag = tags[index];
            return Card(
              child: ListTile(
                leading: Icon(
                  Icons.label_outline,
                  color: Theme.of(context).colorScheme.primary,
                ),
                title: Text(tag),
                trailing: const Icon(Icons.chevron_right),
                onTap: () =>
                    context.push('/tag/${Uri.encodeComponent(tag)}'),
              ),
            );
          },
        );
      },
    );
  }
}

class _AllPoisTab extends ConsumerWidget {
  const _AllPoisTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final poisAsync = ref.watch(allPoisProvider);

    return poisAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) => Center(child: Text('Error: $err')),
      data: (poisMap) {
        final pois = poisMap.values.toList()
          ..sort((a, b) => a.name.compareTo(b.name));
        if (pois.isEmpty) {
          return const Center(child: Text('No POIs yet.'));
        }
        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: pois.length,
          itemBuilder: (context, index) {
            final poi = pois[index];
            return Card(
              child: ListTile(
                leading: const Icon(Icons.location_on),
                title: Text(poi.name),
                subtitle: poi.animeSeriesRef != null
                    ? Text(poi.animeSeriesRef!)
                    : poi.address != null
                        ? Text(poi.address!)
                        : null,
                trailing: const Icon(Icons.chevron_right),
                onTap: () => context.push('/pois/${poi.id}'),
              ),
            );
          },
        );
      },
    );
  }
}

void _showCreateRoiDialog(BuildContext context) {
  final nameController = TextEditingController();
  final descController = TextEditingController();

  showDialog(
    context: context,
    builder: (ctx) => Consumer(
      builder: (ctx, ref, _) => AlertDialog(
        title: const Text('New Region'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
              autofocus: true,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: descController,
              decoration: const InputDecoration(labelText: 'Description'),
              maxLines: 2,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              final name = nameController.text.trim();
              if (name.isEmpty) return;

              final db = ref.read(databaseProvider);
              db.insertRoi(RoisCompanion.insert(
                id: const Uuid().v4(),
                name: name,
                description: Value(descController.text.trim().isEmpty
                    ? null
                    : descController.text.trim()),
                createdAt: DateTime.now().millisecondsSinceEpoch,
              ));
              Navigator.pop(ctx);
            },
            child: const Text('Create'),
          ),
        ],
      ),
    ),
  );
}
