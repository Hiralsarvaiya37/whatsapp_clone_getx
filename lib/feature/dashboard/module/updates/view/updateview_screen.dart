import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/updates/provider/updateview_provider.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/updates/view/status_view_screen.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/helper/l10n_ext.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class UpdateviewScreen extends StatelessWidget {
  static const id = "/UpdateviewScreen";
  const UpdateviewScreen({super.key});

  Future pickFromCamera(BuildContext context) async {
    final provider = context.read<UpdateviewProvider>();
    final picker = ImagePicker();

    final XFile? photo = await picker.pickImage(source: ImageSource.camera);

    if (photo != null) {
      provider.addImage(File(photo.path));
    } else {
      CircularNotchedRectangle();
    }
  }

  Future pickFromGallery(BuildContext context) async {
    final provider = context.read<UpdateviewProvider>();
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      provider.addImage(File(image.path));
    }
  }

  Future pickFromVideo(BuildContext context) async {
    final provider = context.read<UpdateviewProvider>();
    final picker = ImagePicker();
    final XFile? video = await picker.pickVideo(source: ImageSource.gallery);

    if (video != null) {
      provider.addVideo(File(video.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<AppTheme>(context, listen: false);
    final updateviewProvider = context.watch<UpdateviewProvider>();
    final bool hasStatus = updateviewProvider.statusList.isNotEmpty;
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
                      color: theme.whiteColor,
                      fontSize: AppSize.getSize(20),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSize.getSize(10)),

              GestureDetector(
                onTap: () {
                  if (updateviewProvider.statusList.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StatusViewScreen(
                          statuses: updateviewProvider.statusList,
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
                              color: theme.greenColor,
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
                                  color: hasStatus
                                      ? theme.greenColor
                                      : Colors.transparent,
                                  width: 1,
                                ),
                              ),
                              child: ClipOval(
                                child: buildLastStatus(updateviewProvider),
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
                              child: buildLastStatus(updateviewProvider),
                            ),
                          ),
                        ),

                        Positioned(
                          right: AppSize.getSize(-2),
                          bottom: AppSize.getSize(-2),
                          child: GestureDetector(
                            onTap: () => showImagePickerSheet(context),
                            child: Container(
                              height: AppSize.getSize(22),
                              width: AppSize.getSize(22),
                              decoration: BoxDecoration(
                                color: theme.greenColor,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: theme.blackColor,
                                  width: AppSize.getSize(0.5),
                                ),
                              ),
                              child: Icon(
                                Icons.add,
                                size: AppSize.getSize(16),
                                color: theme.blackColor,
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
                            color: theme.whiteColor,
                            fontSize: AppSize.getSize(20),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          updateviewProvider.statusList.isEmpty
                              ? context.l10n.taptoaddstatus
                              : context.l10n.minutesago,
                          style: TextStyle(
                            color: theme.greyShade400,
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
                      color: theme.greyShade400,
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
                              color: theme.whiteColor,
                              fontSize: AppSize.getSize(19),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            context.l10n.minutesago,
                            style: TextStyle(
                              color: theme.greyShade400,
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
                      color: theme.greyShade400,
                      fontSize: AppSize.getSize(16),
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      updateviewProvider.toggleArrow();
                    },
                    child: Container(
                      color: theme.blackColor,

                      child: Icon(
                        updateviewProvider.isArrowDown
                            ? Icons.expand_more_sharp
                            : Icons.expand_less,
                        size: AppSize.getSize(30),
                        color: theme.greyShade400,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSize.getSize(10)),
              updateviewProvider.isArrowDown
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.l10n.channels,
                          style: TextStyle(
                            color: theme.whiteColor,
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
                            color: theme.greyShade400,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Users",
                                      style: TextStyle(
                                        color: theme.whiteColor,
                                        fontSize: AppSize.getSize(19),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      context.l10n.minutesago,
                                      style: TextStyle(
                                        color: theme.greyShade400,
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              context.l10n.channels,
                              style: TextStyle(
                                color: theme.whiteColor,
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
                                color: theme.greyShade400,
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
                      color: theme.greyShade400,
                      fontSize: AppSize.getSize(16),
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      updateviewProvider.toggleDown();
                    },
                    child: Container(
                      color: theme.blackColor,

                      child: Icon(
                        updateviewProvider.isDown
                            ? Icons.expand_less
                            : Icons.expand_more_sharp,
                        size: AppSize.getSize(30),
                        color: theme.greyShade400,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: AppSize.getSize(20)),

              Visibility(
                visible: updateviewProvider.isDown,
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Demo",
                              style: TextStyle(
                                color: theme.whiteColor,
                                fontSize: AppSize.getSize(18),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              context.l10n.followers,
                              style: TextStyle(
                                color: theme.greyShade400,
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
                          color: theme.greenAccentShade700,
                          borderRadius: BorderRadius.circular(
                            AppSize.getSize(25),
                          ),
                        ),
                        child: Text(
                          context.l10n.follow,
                          style: TextStyle(
                            color: theme.blackColor,
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
                  border: Border.all(color: theme.greyColor),
                  borderRadius: BorderRadius.circular(AppSize.getSize(25)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.qr_code,
                      size: AppSize.getSize(28),
                      color: theme.greenAccentShade700,
                    ),
                    SizedBox(width: AppSize.getSize(15)),
                    Text(
                      context.l10n.exploremore,
                      style: TextStyle(
                        fontSize: AppSize.getSize(16),
                        color: theme.greenAccentShade700,
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
                  border: Border.all(color: theme.greyColor),
                  borderRadius: BorderRadius.circular(AppSize.getSize(25)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      size: AppSize.getSize(28),
                      color: theme.greenAccentShade700,
                    ),
                    SizedBox(width: AppSize.getSize(15)),
                    Text(
                      context.l10n.createchannel,
                      style: TextStyle(
                        fontSize: AppSize.getSize(16),
                        color: theme.greenAccentShade700,
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
                  borderRadius: BorderRadius.circular(AppSize.getSize(14)),
                  color: theme.greyShade900,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: AppSize.getSize(10),
                  vertical: AppSize.getSize(8),
                ),

                child: Icon(
                  Icons.edit,
                  size: AppSize.getSize(26),
                  color: theme.whiteColor,
                ),
              ),
              SizedBox(height: AppSize.getSize(20)),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.getSize(14)),
                  color: theme.greenAccentShade700,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: AppSize.getSize(17),
                  vertical: AppSize.getSize(13),
                ),

                child: Icon(
                  Icons.linked_camera_outlined,
                  size: AppSize.getSize(28),
                  color: theme.blackColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void showImagePickerSheet(BuildContext context) {
    final theme = context.read<AppTheme>();
    showModalBottomSheet(
      context: context,
      backgroundColor: theme.greyShade900,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSize.getSize(20)),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(AppSize.getSize(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  pickFromCamera(context);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.all(AppSize.getSize(14)),
                      decoration: BoxDecoration(
                        color: theme.greenAccentShade700,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.camera_alt,
                        color: theme.blackColor,
                        size: AppSize.getSize(25),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      context.l10n.camera,
                      style: TextStyle(color: theme.whiteColor),
                    ),
                  ],
                ),
              ),

              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  pickFromGallery(context);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.all(AppSize.getSize(14)),
                      decoration: BoxDecoration(
                        color: theme.greenAccentShade700,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.photo,
                        color: theme.blackColor,
                        size: AppSize.getSize(25),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      context.l10n.gallery,
                      style: TextStyle(color: theme.whiteColor),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  pickFromVideo(context);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.all(AppSize.getSize(14)),
                      decoration: BoxDecoration(
                        color: theme.greenAccentShade700,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.video_camera_back,
                        color: theme.blackColor,
                        size: AppSize.getSize(25),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      context.l10n.video,
                      style: TextStyle(color: theme.whiteColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildLastStatus(UpdateviewProvider provider) {
    if (provider.statusList.isEmpty) {
      return SizedBox.expand(
        child: Image.network(
          "https://newsmeter.in/h-upload/2021/01/19/291251-beautiful-sakura.webp",
          fit: BoxFit.cover,
        ),
      );
    }

    final lastStatus = provider.statusList.last;

    if (lastStatus.type == StatusType.image) {
      return SizedBox.expand(
        child: Image.file(
          lastStatus.file,
          fit: BoxFit.cover,
          errorBuilder: (_, _, _) => Container(color: Colors.black),
        ),
      );
    } else {
      return Container(
        color: Colors.black,
        child: Center(
          child: Icon(Icons.play_circle_fill, color: Colors.white, size: 35),
        ),
      );
    }
  }
}
