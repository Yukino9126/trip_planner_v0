import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'tables.dart';

part 'database.g.dart';

@DriftDatabase(tables: [Rois, Pois, TimeChunks, MediaAssets])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // --- ROI Queries ---
  Future<List<Roi>> getAllRois() => select(rois).get();

  Stream<List<Roi>> watchAllRois() => select(rois).watch();

  Future<Roi> getRoiById(String id) =>
      (select(rois)..where((r) => r.id.equals(id))).getSingle();

  Future<int> insertRoi(RoisCompanion roi) => into(rois).insert(roi);

  Future<bool> updateRoi(RoisCompanion roi) => update(rois).replace(
        Roi(
          id: roi.id.value,
          name: roi.name.value,
          description: roi.description.value,
          isOfflineCached: roi.isOfflineCached.value,
          createdAt: roi.createdAt.value,
        ),
      );

  Future<int> deleteRoi(String id) =>
      (delete(rois)..where((r) => r.id.equals(id))).go();

  // --- POI Queries ---
  Future<List<Poi>> getPoisByRoi(String roiId) =>
      (select(pois)..where((p) => p.roiId.equals(roiId))).get();

  Stream<List<Poi>> watchPoisByRoi(String roiId) =>
      (select(pois)..where((p) => p.roiId.equals(roiId))).watch();

  Future<Poi> getPoiById(String id) =>
      (select(pois)..where((p) => p.id.equals(id))).getSingle();

  Future<int> insertPoi(PoisCompanion poi) => into(pois).insert(poi);

  Future<bool> updatePoi(PoisCompanion poi) => update(pois).replace(
        Poi(
          id: poi.id.value,
          roiId: poi.roiId.value,
          name: poi.name.value,
          description: poi.description.value,
          address: poi.address.value,
          lat: poi.lat.value,
          lng: poi.lng.value,
          businessHours: poi.businessHours.value,
          contactInfo: poi.contactInfo.value,
          coverImageUri: poi.coverImageUri.value,
          tags: poi.tags.value,
          animeSeriesRef: poi.animeSeriesRef.value,
        ),
      );

  Future<List<Poi>> getAllPois() => select(pois).get();

  Future<int> deletePoi(String id) =>
      (delete(pois)..where((p) => p.id.equals(id))).go();

  // --- TimeChunk Queries ---
  Future<List<TimeChunk>> getTimeChunksByPoi(String poiId) =>
      (select(timeChunks)..where((t) => t.poiId.equals(poiId))).get();

  Stream<List<TimeChunk>> watchTimeChunksByDate(String date) =>
      (select(timeChunks)..where((t) => t.date.equals(date))).watch();

  Stream<List<TimeChunk>> watchBacklogChunks() => (select(timeChunks)
        ..where((t) => t.status.equals('backlog')))
      .watch();

  Future<int> insertTimeChunk(TimeChunksCompanion chunk) =>
      into(timeChunks).insert(chunk);

  Future<bool> updateTimeChunk(TimeChunksCompanion chunk) =>
      update(timeChunks).replace(
        TimeChunk(
          id: chunk.id.value,
          poiId: chunk.poiId.value,
          date: chunk.date.value,
          startTime: chunk.startTime.value,
          endTime: chunk.endTime.value,
          status: chunk.status.value,
        ),
      );

  Stream<List<TimeChunk>> watchAllScheduledChunks() => (select(timeChunks)
        ..where((t) => t.status.equals('scheduled'))
        ..orderBy([(t) => OrderingTerm.asc(t.date)]))
      .watch();

  Future<int> deleteTimeChunk(String id) =>
      (delete(timeChunks)..where((t) => t.id.equals(id))).go();

  // --- MediaAsset Queries ---
  Future<List<MediaAsset>> getMediaAssetsByPoi(String poiId) =>
      (select(mediaAssets)..where((m) => m.poiId.equals(poiId))).get();

  Stream<List<MediaAsset>> watchMediaAssetsByPoi(String poiId) =>
      (select(mediaAssets)..where((m) => m.poiId.equals(poiId))).watch();

  Future<int> insertMediaAsset(MediaAssetsCompanion asset) =>
      into(mediaAssets).insert(asset);

  Future<int> updateMediaAssetLocalUri(String id, String localUri) =>
      (update(mediaAssets)..where((m) => m.id.equals(id))).write(
        MediaAssetsCompanion(localUri: Value(localUri)),
      );

  Future<int> deleteMediaAsset(String id) =>
      (delete(mediaAssets)..where((m) => m.id.equals(id))).go();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'trip_planner.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
