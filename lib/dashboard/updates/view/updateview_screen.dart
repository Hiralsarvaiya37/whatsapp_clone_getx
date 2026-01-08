import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapp_clone_getx/dashboard/updates/controller/updateview_controller.dart';
import 'package:whatsapp_clone_getx/dashboard/updates/view/status_view_screen.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';

class UpdateviewScreen extends StatelessWidget {
  UpdateviewScreen({super.key});

  final UpdateviewController controller = Get.put(UpdateviewController());

  Future pickFromCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);

    if (photo != null) {
      controller.statusList.add(
        StatusItem(file: File(photo.path), type: StatusType.image),
      );
    }
  }

  Future pickFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      controller.statusList.add(
        StatusItem(file: File(image.path), type: StatusType.image),
      );
    }
  }

  Future pickFromVideo() async {
    final ImagePicker picker = ImagePicker();
    final XFile? video = await picker.pickVideo(source: ImageSource.gallery);

    if (video != null) {
      controller.addVideo(File(video.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: AppSize.getSize(10)),
              Row(
                children: [
                  Text(
                    "Status",
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: AppSize.getSize(20),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSize.getSize(10)),

              GestureDetector(
                onTap: () {
                  if (controller.statusList.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StatusViewScreen(
                          statusList: controller.statusList.toList(),
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
                              color: AppColors.greenColor,
                              width: AppSize.getSize(3),
                            ),
                          ),
                          child: ClipOval(
                            child: Obx(() {
                              bool hasStatus = controller.statusList.isNotEmpty;

                              return Container(
                                height: 50,
                                width: 50,
                                padding: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: hasStatus
                                        ? AppColors.greenColor
                                        : Colors.transparent,
                                    width: 1,
                                  ),
                                ),
                                child: ClipOval(child: buildLastStatus()),
                              );
                            }),
                          ),
                        ),

                        Positioned(
                          left: 1,
                          top: 1,
                          child: ClipOval(
                            child: Obx(
                              () => SizedBox(
                                height: 48,
                                width: 48,
                                child: buildLastStatus(),
                              ),
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
                                color: AppColors.greenColor,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.blackColor,
                                  width: AppSize.getSize(0.5),
                                ),
                              ),
                              child: Icon(
                                Icons.add,
                                size: AppSize.getSize(16),
                                color: AppColors.blackColor,
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
                          "My status",
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: AppSize.getSize(20),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Obx(
                          () => Text(
                            controller.statusList.isEmpty
                                ? "Tap to add status"
                                : "3 minutes ago",
                            style: TextStyle(
                              color: AppColors.greyShade400,
                              fontSize: AppSize.getSize(16),
                            ),
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
                    "Recent updates",
                    style: TextStyle(
                      color: AppColors.greyShade400,
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
                        "https://st2.depositphotos.com/1664950/9143/i/450/depositphotos_91434094-stock-photo-beautiful-flowers-and-butterflies.jpg",
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
                              color: AppColors.whiteColor,
                              fontSize: AppSize.getSize(19),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "25 minutes ago",
                            style: TextStyle(
                              color: AppColors.greyShade400,
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
                    "Viewed updates",
                    style: TextStyle(
                      color: AppColors.greyShade400,
                      fontSize: AppSize.getSize(16),
                    ),
                  ),
                  Spacer(),
                  Obx(
                    () => GestureDetector(
                      onTap: () {
                        controller.isArrowDown.value =
                            !controller.isArrowDown.value;
                      },
                      child: Container(
                        color: AppColors.blackColor,

                        child: Icon(
                          controller.isArrowDown.value
                              ? Icons.expand_more_sharp
                              : Icons.expand_less,
                          size: AppSize.getSize(30),
                          color: AppColors.greyShade400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSize.getSize(10)),
              Obx(
                () => controller.isArrowDown.value
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Channels",
                            style: TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: AppSize.getSize(20),
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          SizedBox(height: AppSize.getSize(5)),

                          Text(
                            "Stay updated on topics that matters to you. Find channels to follow below.",
                            style: TextStyle(
                              color: AppColors.greyShade400,
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
                                    "https://st2.depositphotos.com/1664950/9143/i/450/depositphotos_91434094-stock-photo-beautiful-flowers-and-butterflies.jpg",
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
                                          color: AppColors.whiteColor,
                                          fontSize: AppSize.getSize(19),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        "25 minutes ago",
                                        style: TextStyle(
                                          color: AppColors.greyShade400,
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
                                "Channels",
                                style: TextStyle(
                                  color: AppColors.whiteColor,
                                  fontSize: AppSize.getSize(19),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),

                              SizedBox(height: AppSize.getSize(5)),

                              Text(
                                "Stay updated on topics that matters to you. Find channels to follow below.",
                                style: TextStyle(
                                  color: AppColors.greyShade400,
                                  fontSize: AppSize.getSize(16),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
              ),
              SizedBox(height: AppSize.getSize(30)),
              Row(
                children: [
                  Text(
                    "Find channels to follow",
                    style: TextStyle(
                      color: AppColors.greyShade400,
                      fontSize: AppSize.getSize(16),
                    ),
                  ),
                  Spacer(),
                  Obx(
                    () => GestureDetector(
                      onTap: () {
                        controller.isDown.value = !controller.isDown.value;
                      },
                      child: Container(
                        color: AppColors.blackColor,

                        child: Icon(
                          controller.isDown.value
                              ? Icons.expand_less
                              : Icons.expand_more_sharp,
                          size: AppSize.getSize(30),
                          color: AppColors.greyShade400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: AppSize.getSize(20)),

              Obx(
                () => Visibility(
                  visible: controller.isDown.value,
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
                            "https://www.travelstart.com.ng/blog/wp-content/uploads/2014/06/london-Eye.jpg",
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
                                  color: AppColors.whiteColor,
                                  fontSize: AppSize.getSize(18),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "574K followers",
                                style: TextStyle(
                                  color: AppColors.greyShade400,
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
                            color: AppColors.greenAccentShade700,
                            borderRadius: BorderRadius.circular(
                              AppSize.getSize(25),
                            ),
                          ),
                          child: Text(
                            "Follow",
                            style: TextStyle(
                              color: AppColors.blackColor,
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
              ),

              SizedBox(height: AppSize.getSize(30)),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSize.getSize(20),
                  vertical: AppSize.getSize(10),
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.greyColor),
                  borderRadius: BorderRadius.circular(AppSize.getSize(25)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.qr_code,
                      size: AppSize.getSize(28),
                      color: AppColors.greenAccentShade700,
                    ),
                    SizedBox(width: AppSize.getSize(15)),
                    Text(
                      "Explore more",
                      style: TextStyle(
                        fontSize: AppSize.getSize(16),
                        color: AppColors.greenAccentShade700,
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
                  border: Border.all(color: AppColors.greyColor),
                  borderRadius: BorderRadius.circular(AppSize.getSize(25)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      size: AppSize.getSize(28),
                      color: AppColors.greenAccentShade700,
                    ),
                    SizedBox(width: AppSize.getSize(15)),
                    Text(
                      "Create channel",
                      style: TextStyle(
                        fontSize: AppSize.getSize(16),
                        color: AppColors.greenAccentShade700,
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
                  color: AppColors.greyShade900,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: AppSize.getSize(10),
                  vertical: AppSize.getSize(8),
                ),

                child: Icon(
                  Icons.edit,
                  size: AppSize.getSize(26),
                  color: AppColors.whiteColor,
                ),
              ),
              SizedBox(height: AppSize.getSize(20)),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.getSize(14)),
                  color: AppColors.greenAccentShade700,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: AppSize.getSize(17),
                  vertical: AppSize.getSize(13),
                ),

                child: Icon(
                  Icons.linked_camera_outlined,
                  size: AppSize.getSize(28),
                  color: AppColors.blackColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void showImagePickerSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.greyShade900,
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
                  pickFromCamera();
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.all(AppSize.getSize(14)),
                      decoration: BoxDecoration(
                        color: AppColors.greenAccentShade700,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.camera_alt,
                        color: AppColors.blackColor,
                        size: AppSize.getSize(25),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Camera",
                      style: TextStyle(color: AppColors.whiteColor),
                    ),
                  ],
                ),
              ),

              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  pickFromGallery();
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.all(AppSize.getSize(14)),
                      decoration: BoxDecoration(
                        color: AppColors.greenAccentShade700,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.photo,
                        color: AppColors.blackColor,
                        size: AppSize.getSize(25),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Gallery",
                      style: TextStyle(color: AppColors.whiteColor),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  pickFromVideo();
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.all(AppSize.getSize(14)),
                      decoration: BoxDecoration(
                        color: AppColors.greenAccentShade700,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.video_camera_back,
                        color: AppColors.blackColor,
                        size: AppSize.getSize(25),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Video",
                      style: TextStyle(color: AppColors.whiteColor),
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

  Widget buildLastStatus() {
    if (controller.statusList.isEmpty) {
      return SizedBox.expand(
        child: Image.network(
          "https://st2.depositphotos.com/1664950/9143/i/450/depositphotos_91434094-stock-photo-beautiful-flowers-and-butterflies.jpg",
          fit: BoxFit.cover,
        ),
      );
    }

    final lastStatus = controller.statusList.last;

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
