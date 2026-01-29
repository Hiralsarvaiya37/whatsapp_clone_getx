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

  void init(TickerProvider vsync, BuildContext context) {
    pageController = PageController();
    loadStatus(0, vsync, context);
  }

  Future<void> loadStatus(
    int index,
    TickerProvider vsync,
    BuildContext context,
  ) async {
    progressController?.stop();
    progressController?.dispose();
    progressController = null;

    if (videoController != null) {
      await videoController!.pause();
      await videoController!.dispose();
      videoController = null;
    }

    currentIndex = index;
    notifyListeners();

    final item = statusList[index];

    if (item.type == StatusType.image) {
      progressController = AnimationController(
        vsync: vsync,
        duration: const Duration(seconds: 2),
      );

      progressController!.addListener(() => notifyListeners());
      progressController!.addStatusListener((status) {
        if (status == AnimationStatus.completed) nextStatus(vsync, context);
      });

      progressController!.forward();
    } else {
      videoController = VideoPlayerController.file(item.file);
      await videoController!.initialize();
      videoController!.play();

      progressController = AnimationController(
        vsync: vsync,
        duration: videoController!.value.duration,
      );

      progressController!.addListener(() => notifyListeners());
      progressController!.addStatusListener((status) {
        if (status == AnimationStatus.completed) nextStatus(vsync, context);
      });

      progressController!.forward();
    }
  }

  double getProgress(int index) {
    if (index < currentIndex) return 1;
    if (index > currentIndex) return 0;
    return progressController?.value ?? 0;
  }

  void nextStatus(TickerProvider vsync, BuildContext context) {
    if (currentIndex < statusList.length - 1) {
      final nextIndex = currentIndex + 1;

      pageController.animateToPage(
        nextIndex,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      );

      Future.delayed(Duration(milliseconds: 50), () {
        loadStatus(nextIndex, vsync, context);
      });
    } else {
      Navigator.pop(context);
    }
  }

  void previousStatus(TickerProvider vsync, BuildContext context) {
    if (currentIndex > 0) {
      final prevIndex = currentIndex - 1;

      pageController.animateToPage(
        prevIndex,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      );

      Future.delayed(Duration(milliseconds: 50), () {
        loadStatus(prevIndex, vsync, context);
      });
    }
  }

  void disposeAll() {
    progressController?.dispose();
    videoController?.dispose();
    pageController.dispose();
  }
}
