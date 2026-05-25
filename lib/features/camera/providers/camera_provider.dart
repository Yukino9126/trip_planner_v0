import 'dart:io';
import 'dart:ui';

import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:uuid/uuid.dart';

import '../../../core/database/database.dart';

class CameraState {
  final bool isInitialized;
  final File? referenceImage;
  final File? capturedPhoto;
  final String? poiId;
  final String? error;
  final Offset overlayOffset;
  final double overlayScale;
  final double overlayOpacity;

  const CameraState({
    this.isInitialized = false,
    this.referenceImage,
    this.capturedPhoto,
    this.poiId,
    this.error,
    this.overlayOffset = Offset.zero,
    this.overlayScale = 1,
    this.overlayOpacity = 0.55,
  });

  CameraState copyWith({
    bool? isInitialized,
    File? referenceImage,
    File? capturedPhoto,
    String? poiId,
    String? error,
    Offset? overlayOffset,
    double? overlayScale,
    double? overlayOpacity,
    bool clearReferenceImage = false,
    bool clearCapturedPhoto = false,
    bool clearError = false,
  }) {
    return CameraState(
      isInitialized: isInitialized ?? this.isInitialized,
      referenceImage:
          clearReferenceImage ? null : (referenceImage ?? this.referenceImage),
      capturedPhoto:
          clearCapturedPhoto ? null : (capturedPhoto ?? this.capturedPhoto),
      poiId: poiId ?? this.poiId,
      error: clearError ? null : (error ?? this.error),
      overlayOffset: overlayOffset ?? this.overlayOffset,
      overlayScale: overlayScale ?? this.overlayScale,
      overlayOpacity: overlayOpacity ?? this.overlayOpacity,
    );
  }
}

class CameraNotifier extends StateNotifier<CameraState> {
  CameraNotifier() : super(const CameraState());

  void initialize(String? poiId) {
    state = state.copyWith(poiId: poiId, isInitialized: true, clearError: true);
  }

  void setCameraError(String message) {
    state = state.copyWith(error: message);
  }

  void setReferenceImage(File file) {
    state = state.copyWith(
      referenceImage: file,
      overlayOffset: Offset.zero,
      overlayScale: 1,
      overlayOpacity: 0.55,
    );
  }

  void clearReferenceImage() {
    state = state.copyWith(clearReferenceImage: true);
  }

  void updateOverlayTransform({
    required Offset offset,
    required double scale,
  }) {
    state = state.copyWith(
      overlayOffset: offset,
      overlayScale: scale.clamp(0.35, 4).toDouble(),
    );
  }

  void setOverlayOpacity(double opacity) {
    state = state.copyWith(overlayOpacity: opacity.clamp(0.1, 1).toDouble());
  }

  void resetOverlay() {
    state = state.copyWith(
      overlayOffset: Offset.zero,
      overlayScale: 1,
      overlayOpacity: 0.55,
    );
  }

  void clearCapture() {
    state = state.copyWith(clearCapturedPhoto: true);
  }

  void setCapturedPhoto(File file) {
    state = state.copyWith(capturedPhoto: file);
  }

  Future<bool> savePhoto(AppDatabase db) async {
    if (state.capturedPhoto == null) return false;
    if (state.poiId == null) return false;

    try {
      final savedPath = await _copyImageToAppStorage(state.capturedPhoto!);

      await db.insertMediaAsset(MediaAssetsCompanion.insert(
        id: const Uuid().v4(),
        poiId: state.poiId!,
        type: 'user_photo',
        localUri: savedPath,
        remoteUrl: const Value(null),
        metadata: const Value(null),
      ));

      return true;
    } catch (e) {
      state = state.copyWith(error: 'Save failed: $e');
      return false;
    }
  }

  Future<bool> saveUploadedImage(AppDatabase db, File imageFile) async {
    if (state.poiId == null) return false;

    try {
      final savedPath = await _copyImageToAppStorage(imageFile);

      await db.insertMediaAsset(MediaAssetsCompanion.insert(
        id: const Uuid().v4(),
        poiId: state.poiId!,
        type: 'uploaded_image',
        localUri: savedPath,
        remoteUrl: const Value(null),
        metadata: const Value(null),
      ));

      return true;
    } catch (e) {
      state = state.copyWith(error: 'Upload failed: $e');
      return false;
    }
  }

  void setPoiId(String id) {
    state = state.copyWith(poiId: id);
  }

  Future<String> _copyImageToAppStorage(File sourceFile) async {
    final appDir = await getApplicationDocumentsDirectory();
    final photosDir = Directory(p.join(appDir.path, 'camera_photos'));
    if (!await photosDir.exists()) {
      await photosDir.create(recursive: true);
    }

    final timestamp = DateFormat('MMdd-HH-mm-ss').format(DateTime.now());
    final extension = p.extension(sourceFile.path).isEmpty
        ? '.jpg'
        : p.extension(sourceFile.path);
    final savedPath = await _nextAvailablePath(
      photosDir.path,
      timestamp,
      extension,
    );
    await sourceFile.copy(savedPath);

    return savedPath;
  }

  Future<String> _nextAvailablePath(
    String directory,
    String baseName,
    String extension,
  ) async {
    var candidate = p.join(directory, '$baseName$extension');
    var suffix = 1;

    while (await File(candidate).exists()) {
      candidate = p.join(directory, '$baseName-$suffix$extension');
      suffix += 1;
    }

    return candidate;
  }
}

final cameraProvider =
    StateNotifierProvider.autoDispose<CameraNotifier, CameraState>(
  (ref) => CameraNotifier(),
);
