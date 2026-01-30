import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/updates/provider/status_view_provider.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/updates/provider/updateview_provider.dart';

class StatusViewScreen extends StatefulWidget {
  final List<StatusItem> statuses;
  const StatusViewScreen({super.key, required this.statuses});

  @override
  State<StatusViewScreen> createState() => _StatusViewScreenState();
}

class _StatusViewScreenState extends State<StatusViewScreen>
    with TickerProviderStateMixin {
  late StatusViewProvider provider;

  @override
  void initState() {
    super.initState();
    provider = StatusViewProvider(widget.statuses);
    provider.init(this);
  }

  @override
  void dispose() {
    provider.disposeAll();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: provider,
      child: Consumer<StatusViewProvider>(
        builder: (_, p, _) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: GestureDetector(
              onTapDown: (d) {
                final w = MediaQuery.of(context).size.width;
                if (d.localPosition.dx < w / 2) {
                  p.previousStatus(this);
                } else {
                  p.nextStatus(this);
                }
              },
              child: Stack(
                children: [
                  PageView.builder(
                    controller: p.pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: p.statusList.length,
                    itemBuilder: (_, index) {
                      final item = p.statusList[index];

                      if (item.type == StatusType.image) {
                        return Center(
                          child: Image.file(item.file, fit: BoxFit.contain),
                        );
                      } else {
                        if (p.videoController == null ||
                            !p.videoController!.value.isInitialized) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          );
                        }
                        return Center(
                          child: AspectRatio(
                            aspectRatio: p.videoController!.value.aspectRatio,
                            child: VideoPlayer(p.videoController!),
                          ),
                        );
                      }
                    },
                  ),

                  Positioned(
                    top: 40,
                    left: 10,
                    right: 10,
                    child: Row(
                      children: List.generate(
                        p.statusList.length,
                        (i) => Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            child: LinearProgressIndicator(
                              value: p.getProgress(i),
                              backgroundColor: Colors.white30,
                              valueColor: const AlwaysStoppedAnimation(
                                Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
