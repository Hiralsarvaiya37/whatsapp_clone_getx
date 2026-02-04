import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'updateview_provider.dart';

class StatusViewProvider extends ChangeNotifier {
  final List<StatusItem> statusList;
  StatusViewProvider(this.statusList);

  late PageController pageController;
  AnimationController? progressController;
  VideoPlayerController? videoController;

  int currentIndex = 0;

  // UI layer will handle navigation
  bool shouldClose = false;
  void requestClose() {
    shouldClose = true;
    notifyListeners();
  }

  void init(TickerProvider vsync) {
    pageController = PageController();
    loadStatus(0, vsync);
  }

  /// Pause the current status
  void pause() {
    if (progressController != null && progressController!.isAnimating) {
      progressController!.stop();
    }

    if (videoController != null &&
        videoController!.value.isInitialized &&
        videoController!.value.isPlaying) {
      videoController!.pause();
    }
  }

  /// Resume the current status
  void resume() {
    if (progressController != null && !progressController!.isAnimating) {
      progressController!.forward();
    }

    if (videoController != null &&
        videoController!.value.isInitialized &&
        !videoController!.value.isPlaying) {
      videoController!.play();
    }
  }

  /// Get progress of a status for UI
  double getProgress(int index) {
    if (index < currentIndex) return 1;
    if (index > currentIndex) return 0;
    return progressController?.value ?? 0;
  }

  /// Load a specific status
  Future<void> loadStatus(int index, TickerProvider vsync) async {
    // Dispose previous controllers
    await _disposeCurrentControllers();

    currentIndex = index;
    notifyListeners();

    final item = statusList[index];

    if (item.type == StatusType.image) {
      _loadImageStatus(item, vsync);
    } else {
      await _loadVideoStatus(item, vsync);
    }
  }

  /// Load an image status
  void _loadImageStatus(StatusItem item, TickerProvider vsync) {
    progressController = AnimationController(
      vsync: vsync,
      duration: const Duration(seconds: 5),
    );

    progressController!.addListener(() => notifyListeners());
    progressController!.addStatusListener((status) {
      if (status == AnimationStatus.completed) nextStatus(vsync);
    });

    progressController!.forward();
  }

  /// Load a video status
  Future<void> _loadVideoStatus(StatusItem item, TickerProvider vsync) async {
    videoController = VideoPlayerController.file(item.file);
    await videoController!.initialize();

    if (!videoController!.value.isInitialized) return;

    final duration = videoController!.value.duration;
    if (duration.inMilliseconds == 0) return;

    videoController!.setLooping(false);
    videoController!.play();

    progressController = AnimationController(vsync: vsync, duration: duration);

    progressController!.addListener(() => notifyListeners());
    progressController!.addStatusListener((status) {
      if (status == AnimationStatus.completed) nextStatus(vsync);
    });

    progressController!.forward();
  }

  /// Go to the next status
  void nextStatus(TickerProvider vsync) {
    if (currentIndex < statusList.length - 1) {
      final nextIndex = currentIndex + 1;
      pageController.animateToPage(
        nextIndex,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      );

      Future.delayed(const Duration(milliseconds: 50), () {
        loadStatus(nextIndex, vsync);
      });
    } else {
      requestClose();
    }
  }

  /// Go to the previous status
  void previousStatus(TickerProvider vsync) {
    if (currentIndex > 0) {
      final prevIndex = currentIndex - 1;
      pageController.animateToPage(
        prevIndex,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      );

      Future.delayed(const Duration(milliseconds: 50), () {
        loadStatus(prevIndex, vsync);
      });
    }
  }

  /// Dispose current controllers safely
  Future<void> _disposeCurrentControllers() async {
    if (progressController != null) {
      progressController!.stop();
      progressController!.dispose();
      progressController = null;
    }

    if (videoController != null) {
      await videoController!.pause();
      await videoController!.dispose();
      videoController = null;
    }
  }

  /// Dispose everything
  void disposeAll() {
    _disposeCurrentControllers();
    pageController.dispose();
  }
}
