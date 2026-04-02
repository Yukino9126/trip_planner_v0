import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/database/database.dart';
import '../../../core/providers/database_provider.dart';
import '../../poi/providers/poi_provider.dart';
import '../providers/camera_provider.dart';

class CameraScreen extends ConsumerStatefulWidget {
  final String? poiId;

  const CameraScreen({super.key, this.poiId});

  @override
  ConsumerState<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends ConsumerState<CameraScreen>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    Future.microtask(() {
      ref.read(cameraProvider.notifier).initialize(widget.poiId);
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final notifier = ref.read(cameraProvider.notifier);
    if (state == AppLifecycleState.inactive ||
        state == AppLifecycleState.paused) {
      notifier.disposeCamera();
    } else if (state == AppLifecycleState.resumed) {
      notifier.initialize(widget.poiId);
    }
  }

  @override
  Widget build(BuildContext context) {
    final camState = ref.watch(cameraProvider);
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text('Anime Camera'),
        actions: [
          if (camState.referenceImage != null)
            IconButton(
              icon: Icon(
                camState.showOverlay
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: Colors.white,
              ),
              onPressed: () =>
                  ref.read(cameraProvider.notifier).toggleOverlay(),
              tooltip: 'Toggle overlay',
            ),
        ],
      ),
      body: camState.error != null
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  camState.error!,
                  style: const TextStyle(color: Colors.red, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          : !camState.isInitialized
              ? const Center(
                  child: CircularProgressIndicator(color: Colors.white))
              : Column(
                  children: [
                    // Main viewfinder
                    Expanded(
                      child: camState.capturedPhoto != null
                          ? _buildComparisonView(camState, theme)
                          : _buildViewfinder(camState),
                    ),

                    // Opacity slider
                    if (camState.referenceImage != null &&
                        camState.showOverlay &&
                        camState.capturedPhoto == null)
                      Container(
                        color: Colors.black54,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 4),
                        child: Row(
                          children: [
                            const Icon(Icons.opacity,
                                size: 18, color: Colors.white54),
                            Expanded(
                              child: Slider(
                                value: camState.opacity,
                                onChanged: (v) => ref
                                    .read(cameraProvider.notifier)
                                    .setOpacity(v),
                                activeColor: Colors.white,
                                inactiveColor: Colors.white24,
                              ),
                            ),
                            Text(
                              '${(camState.opacity * 100).round()}%',
                              style: const TextStyle(
                                  color: Colors.white54, fontSize: 12),
                            ),
                          ],
                        ),
                      ),

                    // Bottom controls
                    SafeArea(
                      child: Container(
                        color: Colors.black,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        child: camState.capturedPhoto != null
                            ? _buildCaptureActions(camState)
                            : _buildShootingActions(camState),
                      ),
                    ),
                  ],
                ),
    );
  }

  Widget _buildViewfinder(CameraState camState) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Camera preview or fallback
        if (camState.isMobile && camState.controller != null)
          Center(
            child: CameraPreview(camState.controller!),
          )
        else
          Container(
            color: Colors.grey[900],
            child: const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.desktop_windows,
                      size: 48, color: Colors.white24),
                  SizedBox(height: 8),
                  Text(
                    'Desktop Mode',
                    style: TextStyle(color: Colors.white54, fontSize: 14),
                  ),
                  Text(
                    'Live preview available on mobile only',
                    style: TextStyle(color: Colors.white24, fontSize: 12),
                  ),
                ],
              ),
            ),
          ),

        // Reference image overlay
        if (camState.referenceImage != null && camState.showOverlay)
          Positioned.fill(
            child: Opacity(
              opacity: camState.opacity,
              child: Image.file(
                camState.referenceImage!,
                fit: BoxFit.contain,
              ),
            ),
          ),

        // Crosshair
        Center(
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white24, width: 1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(Icons.add, color: Colors.white24, size: 20),
          ),
        ),
      ],
    );
  }

  Widget _buildComparisonView(CameraState camState, ThemeData theme) {
    // Side-by-side: reference (left) vs captured (right)
    return Row(
      children: [
        if (camState.referenceImage != null)
          Expanded(
            child: Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                  color: Colors.black54,
                  width: double.infinity,
                  child: const Text('Reference',
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                      textAlign: TextAlign.center),
                ),
                Expanded(
                  child: Image.file(camState.referenceImage!,
                      fit: BoxFit.contain),
                ),
              ],
            ),
          ),
        if (camState.referenceImage != null)
          const VerticalDivider(width: 2, color: Colors.white24),
        Expanded(
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                color: Colors.black54,
                width: double.infinity,
                child: const Text('Your Shot',
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                    textAlign: TextAlign.center),
              ),
              Expanded(
                child: Image.file(camState.capturedPhoto!,
                    fit: BoxFit.contain),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildShootingActions(CameraState camState) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Load reference
        _CircleButton(
          icon: Icons.image,
          label: camState.referenceImage == null ? 'Reference' : 'Change',
          onTap: _pickReferenceImage,
        ),
        // Capture
        GestureDetector(
          onTap: () => ref.read(cameraProvider.notifier).capturePhoto(),
          child: Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 4),
            ),
            child: Container(
              margin: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
          ),
        ),
        // Flip camera (mobile only)
        _CircleButton(
          icon: camState.isMobile ? Icons.flip_camera_ios : Icons.info_outline,
          label: camState.isMobile ? 'Flip' : 'Info',
          onTap: camState.isMobile ? _flipCamera : _showInfo,
        ),
      ],
    );
  }

  Widget _buildCaptureActions(CameraState camState) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Retake
        _CircleButton(
          icon: Icons.refresh,
          label: 'Retake',
          onTap: () => ref.read(cameraProvider.notifier).clearCapture(),
        ),
        // Save
        FilledButton.icon(
          onPressed: () => _savePhoto(camState),
          icon: const Icon(Icons.save),
          label: const Text('Save'),
          style: FilledButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
          ),
        ),
        // Discard
        _CircleButton(
          icon: Icons.close,
          label: 'Discard',
          onTap: () => ref.read(cameraProvider.notifier).clearCapture(),
        ),
      ],
    );
  }

  Future<void> _pickReferenceImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      ref.read(cameraProvider.notifier).setReferenceImage(File(picked.path));
    }
  }

  Future<void> _flipCamera() async {
    await ref.read(cameraProvider.notifier).flipCamera();
  }

  void _showInfo() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Desktop Mode'),
        content: const Text(
            'Live camera preview is only available on Android/iOS. '
            'On desktop, use the capture button to pick a photo from your camera app or gallery.'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx), child: const Text('OK')),
        ],
      ),
    );
  }

  Future<void> _savePhoto(CameraState camState) async {
    if (camState.poiId == null) {
      // No POI linked — show picker
      await _showPoiPicker();
      return;
    }

    final db = ref.read(databaseProvider);
    final success = await ref.read(cameraProvider.notifier).savePhoto(db);
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(success ? 'Photo saved!' : 'Save failed'),
        ),
      );
      if (success) {
        ref.read(cameraProvider.notifier).clearCapture();
      }
    }
  }

  Future<void> _showPoiPicker() async {
    final poisMap = await ref.read(allPoisProvider.future);
    final pois = poisMap.values.toList();

    if (!mounted) return;
    if (pois.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No POIs yet. Create one first.')),
      );
      return;
    }

    final picked = await showModalBottomSheet<Poi>(
      context: context,
      builder: (ctx) => ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: pois.length,
        itemBuilder: (ctx, i) => ListTile(
          leading: const Icon(Icons.location_on),
          title: Text(pois[i].name),
          subtitle: pois[i].animeSeriesRef != null
              ? Text(pois[i].animeSeriesRef!)
              : null,
          onTap: () => Navigator.pop(ctx, pois[i]),
        ),
      ),
    );

    if (picked != null) {
      ref.read(cameraProvider.notifier).setPoiId(picked.id);
      // Now save with the POI linked
      final db = ref.read(databaseProvider);
      final success = await ref.read(cameraProvider.notifier).savePhoto(db);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:
                Text(success ? 'Photo saved to ${picked.name}!' : 'Save failed'),
          ),
        );
        if (success) {
          ref.read(cameraProvider.notifier).clearCapture();
        }
      }
    }
  }
}

class _CircleButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _CircleButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withValues(alpha: 0.15),
            ),
            child: Icon(icon, color: Colors.white, size: 22),
          ),
          const SizedBox(height: 4),
          Text(label,
              style: const TextStyle(color: Colors.white54, fontSize: 10)),
        ],
      ),
    );
  }
}
