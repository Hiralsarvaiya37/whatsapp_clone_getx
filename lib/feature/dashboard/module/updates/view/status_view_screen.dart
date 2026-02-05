// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart'; 
import '../provider/status_view_provider.dart';
import '../provider/updateview_provider.dart'; 

class StatusViewScreen extends StatelessWidget {
  static const id = "/StatusViewScreen";
  final List<StatusItem> statusList;

  const StatusViewScreen({super.key, required this.statusList});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => StatusViewProvider(statusList),
      child: const _StatusViewBody(),
    );
  }
}

class _StatusViewBody extends StatefulWidget {
  const _StatusViewBody();

  @override
  State<_StatusViewBody> createState() => _StatusViewBodyState();
}

class _StatusViewBodyState extends State<_StatusViewBody>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<StatusViewProvider>();
      provider.initialize(this);
      provider.setOnCompletedCallback(() {
        if (mounted) {
          Navigator.pop(context);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<StatusViewProvider>(
      builder: (context, provider, child) {
        if (!provider.isReady) {
          return const Scaffold(
            backgroundColor: Colors.black,
            body: Center(child: CircularProgressIndicator(color: Colors.white)),
          );
        }

        return Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            fit: StackFit.expand,
            children: [
              PageView.builder(
                controller: provider.pageController,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: provider.statusList.length,
                onPageChanged: provider.onPageChanged,
                itemBuilder: (context, index) {
                  final item = provider.statusList[index];

                  if (item.type == StatusType.image) {
                    return Image.file(
                      item.file,
                      fit: BoxFit.contain,
                      errorBuilder: (_, _, _) => const Icon(
                        Icons.broken_image,
                        color: Colors.white70,
                        size: 80,
                      ),
                    );
                  }
                  final ctrl = provider.videoController;
                  if (ctrl == null || !ctrl.value.isInitialized) {
                    return const Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    );
                  }

                  return Center(
                    child: AspectRatio(
                      aspectRatio: ctrl.value.aspectRatio,
                      child: VideoPlayer(ctrl),
                    ),
                  );
                },
              ),
              Positioned.fill(
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: provider.previousStatus,
                        onLongPressStart: (_) => provider.pause(),
                        onLongPressEnd: (_) => provider.resume(),
                        behavior: HitTestBehavior.translucent,
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: provider.nextStatus,
                        onLongPressStart: (_) => provider.pause(),
                        onLongPressEnd: (_) => provider.resume(),
                        behavior: HitTestBehavior.translucent,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: AppSize.getSize(40),
                left: AppSize.getSize(12),
                right: AppSize.getSize(12),
                child: Row(
                  children: List.generate(
                    provider.statusList.length,
                    (i) => Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppSize.getSize(2),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: LinearProgressIndicator(
                            value: provider.getProgressValue(i),
                            minHeight: AppSize.getSize(3),
                            backgroundColor: Colors.white.withOpacity(0.4),
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
