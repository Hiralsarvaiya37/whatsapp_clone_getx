// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/updates/bloc/update_bloc.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/updates/bloc/update_event.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/updates/bloc/update_state.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/updates/view/status_view_screen.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/helper/l10n_ext.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class UpdateviewScreen extends StatelessWidget {
  static const id = "/UpdateviewScreen";
  const UpdateviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UpdateBloc>(
      create: (context) => UpdateBloc(),
      child: Builder(
        builder: (BuildContext screenContext) {
          return BlocBuilder<UpdateBloc, UpdateState>(
            builder: (context, state) {
              return Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: AppSize.getSize(10)),
                        Row(
                          children: [
                            Text(
                              context.l10n.status,
                              style: TextStyle(
                                color: AppTheme.whiteColor,
                                fontSize: AppSize.getSize(20),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: AppSize.getSize(10)),

                        GestureDetector(
                          onTap: () {
                            if (state.statusList.isNotEmpty) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => StatusViewScreen(
                                    statusList: state.statusList,
                                  ),
                                ),
                              );
                            } else {
                              showImagePickerSheet(context);
                            }
                          },
                          child: Row(
                            children: [
                              Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Container(
                                    height: AppSize.getSize(50),
                                    width: AppSize.getSize(50),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: AppTheme.greenColor,
                                        width: AppSize.getSize(3),
                                      ),
                                    ),
                                    child: ClipOval(
                                      child: Container(
                                        height: 50,
                                        width: 50,
                                        padding: EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: state.statusList.isNotEmpty
                                                ? AppTheme.greenColor
                                                : Colors.transparent,
                                            width: 1,
                                          ),
                                        ),
                                        child: ClipOval(
                                          child: buildLastStatus(state),
                                        ),
                                      ),
                                    ),
                                  ),

                                  Positioned(
                                    left: 1,
                                    top: 1,
                                    child: ClipOval(
                                      child: SizedBox(
                                        height: 48,
                                        width: 48,
                                        child: buildLastStatus(state),
                                      ),
                                    ),
                                  ),

                                  Positioned(
                                    right: AppSize.getSize(-2),
                                    bottom: AppSize.getSize(-2),
                                    child: GestureDetector(
                                      onTap: () =>
                                          showImagePickerSheet(context),
                                      child: Container(
                                        height: AppSize.getSize(22),
                                        width: AppSize.getSize(22),
                                        decoration: BoxDecoration(
                                          color: AppTheme.greenColor,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: AppTheme.blackColor,
                                            width: AppSize.getSize(0.5),
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.add,
                                          size: AppSize.getSize(16),
                                          color: AppTheme.blackColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: AppSize.getSize(15)),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    context.l10n.mystatus,
                                    style: TextStyle(
                                      color: AppTheme.whiteColor,
                                      fontSize: AppSize.getSize(20),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    state.statusList.isEmpty
                                        ? context.l10n.taptoaddstatus
                                        : context.l10n.minutesago,
                                    style: TextStyle(
                                      color: AppTheme.greyShade400,
                                      fontSize: AppSize.getSize(16),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: AppSize.getSize(20)),
                        Row(
                          children: [
                            Text(
                              context.l10n.recentupdates,
                              style: TextStyle(
                                color: AppTheme.greyShade400,
                                fontSize: AppSize.getSize(16),
                              ),
                            ),
                          ],
                        ),
                        ListView.separated(
                          itemCount: 10,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) => Row(
                            children: [
                              ClipOval(
                                child: Image.network(
                                  height: AppSize.getSize(50),
                                  width: AppSize.getSize(50),
                                  fit: BoxFit.cover,
                                  "https://newsmeter.in/h-upload/2021/01/19/291251-beautiful-sakura.webp",
                                ),
                              ),
                              SizedBox(width: AppSize.getSize(25)),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Users",
                                      style: TextStyle(
                                        color: AppTheme.whiteColor,
                                        fontSize: AppSize.getSize(19),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      context.l10n.minutesago,
                                      style: TextStyle(
                                        color: AppTheme.greyShade400,
                                        fontSize: AppSize.getSize(15),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          separatorBuilder: (context, index) =>
                              SizedBox(height: AppSize.getSize(18)),
                        ),
                        SizedBox(height: AppSize.getSize(20)),
                        Row(
                          children: [
                            Text(
                              context.l10n.viewedupdates,
                              style: TextStyle(
                                color: AppTheme.greyShade400,
                                fontSize: AppSize.getSize(16),
                              ),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                context.read<UpdateBloc>().add(
                                  ToggleArrowEvent(),
                                );
                              },
                              child: Container(
                                color: AppTheme.blackColor,

                                child: Icon(
                                  state.isArrowDown
                                      ? Icons.expand_more_sharp
                                      : Icons.expand_less,
                                  size: AppSize.getSize(30),
                                  color: AppTheme.greyShade400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: AppSize.getSize(10)),
                        state.isArrowDown
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    context.l10n.channels,
                                    style: TextStyle(
                                      color: AppTheme.whiteColor,
                                      fontSize: AppSize.getSize(20),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),

                                  SizedBox(height: AppSize.getSize(5)),

                                  Text(
                                    context
                                        .l10n
                                        .stayupdatedontopicsthatmatterstoyouFindchannelstofollowbelow,
                                    style: TextStyle(
                                      color: AppTheme.greyShade400,
                                      fontSize: AppSize.getSize(16),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              )
                            : Column(
                                children: [
                                  ListView.separated(
                                    itemCount: 5,
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) => Row(
                                      children: [
                                        ClipOval(
                                          child: Image.network(
                                            height: AppSize.getSize(45),
                                            width: AppSize.getSize(45),
                                            fit: BoxFit.cover,
                                            "https://newsmeter.in/h-upload/2021/01/19/291251-beautiful-sakura.webp",
                                          ),
                                        ),
                                        SizedBox(width: AppSize.getSize(25)),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Users",
                                                style: TextStyle(
                                                  color: AppTheme.whiteColor,
                                                  fontSize: AppSize.getSize(19),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Text(
                                                context.l10n.minutesago,
                                                style: TextStyle(
                                                  color: AppTheme.greyShade400,
                                                  fontSize: AppSize.getSize(15),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),

                                    separatorBuilder: (context, index) =>
                                        SizedBox(height: AppSize.getSize(20)),
                                  ),
                                  SizedBox(height: AppSize.getSize(20)),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        context.l10n.channels,
                                        style: TextStyle(
                                          color: AppTheme.whiteColor,
                                          fontSize: AppSize.getSize(19),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),

                                      SizedBox(height: AppSize.getSize(5)),

                                      Text(
                                        context
                                            .l10n
                                            .stayupdatedontopicsthatmatterstoyouFindchannelstofollowbelow,
                                        style: TextStyle(
                                          color: AppTheme.greyShade400,
                                          fontSize: AppSize.getSize(16),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                        SizedBox(height: AppSize.getSize(30)),
                        Row(
                          children: [
                            Text(
                              context.l10n.findchannelstofollow,
                              style: TextStyle(
                                color: AppTheme.greyShade400,
                                fontSize: AppSize.getSize(16),
                              ),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                context.read<UpdateBloc>().add(
                                  ToggleDownEvent(),
                                );
                              },
                              child: Container(
                                color: AppTheme.blackColor,

                                child: Icon(
                                  state.isDown
                                      ? Icons.expand_less
                                      : Icons.expand_more_sharp,
                                  size: AppSize.getSize(30),
                                  color: AppTheme.greyShade400,
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: AppSize.getSize(20)),

                        Visibility(
                          visible: state.isDown,
                          child: ListView.separated(
                            itemCount: 6,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) => Row(
                              children: [
                                ClipOval(
                                  child: Image.network(
                                    fit: BoxFit.cover,
                                    height: AppSize.getSize(45),
                                    width: AppSize.getSize(45),
                                    "https://newsmeter.in/h-upload/2021/01/19/291251-beautiful-sakura.webp",
                                  ),
                                ),
                                SizedBox(width: AppSize.getSize(20)),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Demo",
                                        style: TextStyle(
                                          color: AppTheme.whiteColor,
                                          fontSize: AppSize.getSize(18),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        context.l10n.followers,
                                        style: TextStyle(
                                          color: AppTheme.greyShade400,
                                          fontSize: AppSize.getSize(15),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: AppSize.getSize(20),
                                    vertical: AppSize.getSize(10),
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppTheme.greenAccentShade700,
                                    borderRadius: BorderRadius.circular(
                                      AppSize.getSize(25),
                                    ),
                                  ),
                                  child: Text(
                                    context.l10n.follow,
                                    style: TextStyle(
                                      color: AppTheme.blackColor,
                                      fontSize: AppSize.getSize(16),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            separatorBuilder: (context, index) =>
                                SizedBox(height: AppSize.getSize(18)),
                          ),
                        ),

                        SizedBox(height: AppSize.getSize(30)),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSize.getSize(20),
                            vertical: AppSize.getSize(10),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppTheme.greyColor),
                            borderRadius: BorderRadius.circular(
                              AppSize.getSize(25),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.qr_code,
                                size: AppSize.getSize(28),
                                color: AppTheme.greenAccentShade700,
                              ),
                              SizedBox(width: AppSize.getSize(15)),
                              Text(
                                context.l10n.exploremore,
                                style: TextStyle(
                                  fontSize: AppSize.getSize(16),
                                  color: AppTheme.greenAccentShade700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: AppSize.getSize(10)),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSize.getSize(20),
                            vertical: AppSize.getSize(10),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppTheme.greyColor),
                            borderRadius: BorderRadius.circular(
                              AppSize.getSize(25),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                size: AppSize.getSize(28),
                                color: AppTheme.greenAccentShade700,
                              ),
                              SizedBox(width: AppSize.getSize(15)),
                              Text(
                                context.l10n.createchannel,
                                style: TextStyle(
                                  fontSize: AppSize.getSize(16),
                                  color: AppTheme.greenAccentShade700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),

                  Positioned(
                    right: AppSize.getSize(8),
                    bottom: AppSize.getSize(23),

                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              AppSize.getSize(14),
                            ),
                            color: AppTheme.greyShade900,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSize.getSize(10),
                            vertical: AppSize.getSize(8),
                          ),

                          child: Icon(
                            Icons.edit,
                            size: AppSize.getSize(26),
                            color: AppTheme.whiteColor,
                          ),
                        ),
                        SizedBox(height: AppSize.getSize(20)),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              AppSize.getSize(14),
                            ),
                            color: AppTheme.greenAccentShade700,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSize.getSize(17),
                            vertical: AppSize.getSize(13),
                          ),

                          child: Icon(
                            Icons.linked_camera_outlined,
                            size: AppSize.getSize(28),
                            color: AppTheme.blackColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  void showImagePickerSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppTheme.greyShade900,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (bottomContext) {
        return Padding(
          padding: EdgeInsets.all(AppSize.getSize(24)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _pickerOption(
                context: context,
                icon: Icons.camera_alt,
                label: context.l10n.camera,
                onTap: () {
                  Navigator.pop(bottomContext);
                  _pickFromCamera(context);
                },
              ),
              _pickerOption(
                context: context,
                icon: Icons.photo_library,
                label: context.l10n.gallery,
                onTap: () {
                  Navigator.pop(bottomContext);
                  _pickFromGallery(context);
                },
              ),
              _pickerOption(
                context: context,
                icon: Icons.videocam,
                label: context.l10n.video,
                onTap: () {
                  Navigator.pop(bottomContext);
                  _pickVideo(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _pickerOption({
    required BuildContext context,
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(AppSize.getSize(16)),
            decoration: BoxDecoration(
              color: AppTheme.greenColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: AppTheme.blackColor,
              size: AppSize.getSize(28),
            ),
          ),
          SizedBox(height: AppSize.getSize(8)),
          Text(
            label,
            style: TextStyle(
              color: AppTheme.whiteColor,
              fontSize: AppSize.getSize(14),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _pickFromCamera(BuildContext context) async {
    final picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);

    if (photo != null && context.mounted) {
      try {
        context.read<UpdateBloc>().add(AddImageEvent(File(photo.path)));
      } catch (e) {
        CircularProgressIndicator();
      }
    }
  }

  Future<void> _pickFromGallery(BuildContext context) async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null && context.mounted) {
      try {
        context.read<UpdateBloc>().add(AddImageEvent(File(image.path)));
      } catch (e) {
        CircularProgressIndicator();
      }
    }
  }

  Future<void> _pickVideo(BuildContext context) async {
    final picker = ImagePicker();
    final XFile? video = await picker.pickVideo(source: ImageSource.gallery);

    if (video != null && context.mounted) {
      try {
        context.read<UpdateBloc>().add(AddVideoEvent(File(video.path)));
      } catch (e) {
        CircularProgressIndicator();
      }
    }
  }

  Widget buildLastStatus(UpdateState state) {
    if (state.statusList.isEmpty) {
      return Container(
        color: Colors.grey[850],
        child: Image.network(
          "https://newsmeter.in/h-upload/2021/01/19/291251-beautiful-sakura.webp",
          fit: BoxFit.cover,
        ),
      );
    }

    final last = state.statusList.last;

    if (last.type == StatusType.image) {
      return Image.file(
        last.file,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: Colors.redAccent.withOpacity(0.3),
            child: const Icon(Icons.broken_image, color: Colors.white),
          );
        },
      );
    } else {
      return Container(
        color: Colors.black87,
        child: const Center(
          child: Icon(Icons.play_circle_outline, color: Colors.white, size: 50),
        ),
      );
    }
  }
}
