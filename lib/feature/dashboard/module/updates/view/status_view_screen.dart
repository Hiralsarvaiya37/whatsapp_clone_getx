// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/updates/bloc/status_bloc.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/updates/bloc/status_event.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/updates/bloc/status_state.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/updates/bloc/update_state.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class StatusViewScreen extends StatefulWidget {
  static const id = "/StatusViewScreen";
  final List<StatusItem> statusList;

  const StatusViewScreen({super.key, required this.statusList});

  @override
  State<StatusViewScreen> createState() => _StatusViewScreenState();
}

class _StatusViewScreenState extends State<StatusViewScreen>
    with TickerProviderStateMixin {
  late PageController pageController;
  AnimationController? progressController;
  VideoPlayerController? videoController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    if (widget.statusList.isNotEmpty) {
      context.read<StatusBloc>().add(InitStatus(widget.statusList));
      loadStatus(0);
    }
  }

  void loadStatus(int index) async {
    if (widget.statusList.isEmpty || index >= widget.statusList.length) return;

    progressController?.stop();
    progressController?.dispose();
    videoController?.dispose();
    videoController = null;

    final item = widget.statusList[index];

    if (item.type == StatusType.image) {
      progressController =
          AnimationController(vsync: this, duration: const Duration(seconds: 5))
            ..addListener(() {
              setState(() {});
            })
            ..addStatusListener((status) {
              if (status == AnimationStatus.completed) {
                nextStatusOrExit(index);
              }
            });
      progressController!.forward();
    } else {
      final vc = VideoPlayerController.file(item.file);
      await vc.initialize();
      vc.play();
      videoController = vc;

      progressController =
          AnimationController(vsync: this, duration: vc.value.duration)
            ..addListener(() {
              setState(() {});
            })
            ..addStatusListener((status) {
              if (status == AnimationStatus.completed) {
                nextStatusOrExit(index);
              }
            });
      progressController!.forward();
    }
  }

  void nextStatusOrExit(int index) {
    if (index + 1 < widget.statusList.length) {
      context.read<StatusBloc>().add(NextStatus());
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.statusList.isEmpty) {
      return Scaffold(
        backgroundColor: AppTheme.blackColor,
        body: const Center(
          child: Text(
            "No Status Available",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      );
    }

    return BlocConsumer<StatusBloc, StatusState>(
      listener: (context, state) {
        loadStatus(state.currentIndex);
        if (pageController.hasClients) {
          pageController.jumpToPage(state.currentIndex);
        }
      },
      builder: (context, state) {
        if (state.list.isEmpty) return const SizedBox();

        final currentIndex = state.currentIndex;

        return Scaffold(
          backgroundColor: AppTheme.blackColor,
          body: Stack(
            children: [
              PageView.builder(
                controller: pageController,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.list.length,
                itemBuilder: (context, index) {
                  final item = state.list[index];
                  if (item.type == StatusType.image) {
                    return Center(
                      child: Image.file(item.file, fit: BoxFit.contain),
                    );
                  } else {
                    if (videoController == null ||
                        !videoController!.value.isInitialized) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return Center(
                      child: AspectRatio(
                        aspectRatio: videoController!.value.aspectRatio,
                        child: VideoPlayer(videoController!),
                      ),
                    );
                  }
                },
              ),

              Positioned.fill(
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          if (currentIndex == 0) return;
                          context.read<StatusBloc>().add(PreviousStatus());
                        },
                        onLongPressStart: (_) => progressController?.stop(),
                        onLongPressEnd: (_) => progressController?.forward(
                          from: progressController!.value,
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => nextStatusOrExit(currentIndex),
                        onLongPressStart: (_) => progressController?.stop(),
                        onLongPressEnd: (_) => progressController?.forward(
                          from: progressController!.value,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Positioned(
                top: 40,
                left: 8,
                right: 8,
                child: Row(
                  children: List.generate(state.list.length, (index) {
                    double fraction = 0.0;
                    if (index < currentIndex) fraction = 1.0;
                    if (index == currentIndex && progressController != null) {
                      fraction = progressController!.value;
                    }

                    return Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        height: 3,
                        color: Colors.white.withOpacity(0.3),
                        child: FractionallySizedBox(
                          widthFactor: fraction,
                          alignment: Alignment.centerLeft,
                          child: Container(color: Colors.white),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        );
      },
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
