import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../providers/poi_provider.dart';

class PoisByAnimeScreen extends ConsumerWidget {
  final String animeName;

  const PoisByAnimeScreen({super.key, required this.animeName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final poisAsync = ref.watch(poisByAnimeSeriesProvider(animeName));

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/pois?tab=anime'),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Anime', style: TextStyle(fontSize: 12)),
            Text(animeName,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
      body: _PoiListView(poisAsync: poisAsync, emptyText: 'No POIs for $animeName'),
    );
  }
}

class PoisByTagScreen extends ConsumerWidget {
  final String tag;

  const PoisByTagScreen({super.key, required this.tag});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final poisAsync = ref.watch(poisByTagProvider(tag));

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/pois?tab=tag'),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Tag', style: TextStyle(fontSize: 12)),
            Text(tag,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
      body: _PoiListView(poisAsync: poisAsync, emptyText: 'No POIs tagged "$tag"'),
    );
  }
}

class _PoiListView extends StatelessWidget {
  final AsyncValue poisAsync;
  final String emptyText;

  const _PoiListView({required this.poisAsync, required this.emptyText});

  @override
  Widget build(BuildContext context) {
    return poisAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) => Center(child: Text('Error: $err')),
      data: (pois) {
        if (pois.isEmpty) {
          return Center(child: Text(emptyText));
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
                subtitle: poi.address != null ? Text(poi.address!) : null,
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
