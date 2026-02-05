import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:video_player/video_player.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/updates/provider/updateview_provider.dart'; // StatusItem, StatusType

class StatusViewProvider extends ChangeNotifier {
  final List<StatusItem> statusList;
  late final PageController pageController;

  VideoPlayerController? videoController;
  AnimationController? progressController;
  VoidCallback? onAllStoriesCompleted;

  int currentIndex = 0;
  bool isPaused = false;
  bool isReady = false;

  StatusViewProvider(this.statusList) {
    pageController = PageController(initialPage: 0);
  }

  Future<void> initialize(TickerProvider vsync) async {
    if (isReady) return;
    await _loadStatus(0, vsync);
    isReady = true;
    notifyListeners();
  }
  void setOnCompletedCallback(VoidCallback callback) {
    onAllStoriesCompleted = callback;
  }

  double getProgressValue(int index) {
    if (index < currentIndex) return 1.0;
    if (index > currentIndex) return 0.0;
    return progressController?.value ?? 0.0;
  }

  void pause() {
    if (isPaused) return;
    isPaused = true;
    progressController?.stop();
    videoController?.pause();
    notifyListeners();
  }

  void resume() {
    if (!isPaused) return;
    isPaused = false;
    progressController?.forward();
    videoController?.play();
    notifyListeners();
  }

  Future<void> _loadStatus(int index, TickerProvider vsync) async {
    progressController?.removeListener(notifyListeners);
    progressController?.dispose();
    await videoController?.dispose();
    videoController = null;

    currentIndex = index;
    isPaused = false;
    notifyListeners();

    final item = statusList[index];

    if (item.type == StatusType.image) {
      progressController =
          AnimationController(
              vsync: vsync,
              duration: const Duration(seconds: 5),
            )
            ..addListener(notifyListeners)
            ..addStatusListener((status) {
              if (status == AnimationStatus.completed) {
                nextStatus();
              }
            })
            ..forward();
    } else {
      final vc = VideoPlayerController.file(item.file);
      await vc.initialize();
      final duration = vc.value.duration;

      videoController = vc;

      progressController = AnimationController(vsync: vsync, duration: duration)
        ..addListener(notifyListeners)
        ..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            nextStatus();
          }
        });

      if (!isPaused) {
        vc.play();
        progressController!.forward();
      }
    }
  }

  void onPageChanged(int index) {
    _loadStatus(index, TickerProviderImpl(this)); 
  }

  void nextStatus() {
    if (currentIndex < statusList.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    } else {
      onAllStoriesCompleted?.call();
    }
  }

  void previousStatus() {
    if (currentIndex <= 0) return;
    pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    progressController?.dispose();
    videoController?.dispose();
    pageController.dispose();
    super.dispose();
  }
}

class TickerProviderImpl implements TickerProvider {
  final StatusViewProvider provider;
  TickerProviderImpl(this.provider);

  @override
  Ticker createTicker(TickerCallback onTick) => Ticker(onTick);
}
