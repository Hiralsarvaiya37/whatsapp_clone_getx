import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapp_clone_getx/dashboard/updates/controller/updateview_controller.dart';

class UpdateviewScreen extends StatelessWidget {
  UpdateviewScreen({super.key});

  final UpdateviewController controller = Get.put(UpdateviewController());

  Future pickFromCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);

    if (photo != null) {
      controller.imageFile.value = File(photo.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    "Status",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),

              GestureDetector(
                onTap: pickFromCamera,
                child: Row(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.green, width: 3),
                          ),
                          child: ClipOval(
                            child: Obx(
                              () => controller.imageFile.value != null
                                  ? Image.file(
                                      controller.imageFile.value!,
                                      fit: BoxFit.cover,
                                      height: 48,
                                      width: 48,
                                    )
                                  : Image.network(
                                      "https://st2.depositphotos.com/1664950/9143/i/450/depositphotos_91434094-stock-photo-beautiful-flowers-and-butterflies.jpg",
                                      fit: BoxFit.cover,
                                      height: 50,
                                      width: 50,
                                    ),
                            ),
                          ),
                        ),

                        Positioned(
                          left: 1,
                          top: 1,
                          child: Obx(
                            () => ClipOval(
                              child: controller.imageFile.value != null
                                  ? Image.file(
                                      controller.imageFile.value!,
                                      height: 48,
                                      width: 48,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.network(
                                      "https://st2.depositphotos.com/1664950/9143/i/450/depositphotos_91434094-stock-photo-beautiful-flowers-and-butterflies.jpg",
                                      height: 50,
                                      width: 50,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                        ),

                        Positioned(
                          right: -2,
                          bottom: -2,
                          child: GestureDetector(
                            onTap: pickFromCamera,
                            child: Container(
                              height: 22,
                              width: 22,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2,
                                ),
                              ),
                              child: Icon(
                                Icons.add,
                                size: 14,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(width: 15),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "My status",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Obx(
                          () => Text(
                            controller.imageFile.value == null
                                ? "Tap to add status"
                                : "3 minutes ago",
                            style: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Recent updates",
                    style: TextStyle(color: Colors.grey.shade400, fontSize: 16),
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
                        height: 42,
                        width: 42,
                        fit: BoxFit.cover,
                        "https://st2.depositphotos.com/1664950/9143/i/450/depositphotos_91434094-stock-photo-beautiful-flowers-and-butterflies.jpg",
                      ),
                    ),
                    SizedBox(width: 25),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Users",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "25 minutes ago",
                            style: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                separatorBuilder: (context, index) => SizedBox(height: 20),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Viewed updates",
                    style: TextStyle(color: Colors.grey.shade400, fontSize: 16),
                  ),
                  Spacer(),
                  Obx(
                    () => GestureDetector(
                      onTap: () {
                        controller.isArrowDown.value =
                            !controller.isArrowDown.value;
                      },
                      child: Container(
                        color: Colors.transparent,

                        child: Icon(
                          controller.isArrowDown.value
                              ? Icons.expand_more_sharp
                              : Icons.expand_less,
                          size: 30,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Obx(
                () => controller.isArrowDown.value
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Channels",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          SizedBox(height: 5),

                          Text(
                            "Stay updated on topics that matters to you. Find channels to follow below.",
                            style: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      )
                    : 
                    Column(
                      children: [
                        ListView.separated(
                        itemCount: 5,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Row(
                          children: [
                            ClipOval(
                              child: Image.network(
                                height: 42,
                                width: 42,
                                fit: BoxFit.cover,
                                "https://st2.depositphotos.com/1664950/9143/i/450/depositphotos_91434094-stock-photo-beautiful-flowers-and-butterflies.jpg",
                              ),
                            ),
                            SizedBox(width: 25),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Users",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "25 minutes ago",
                                    style: TextStyle(
                                      color: Colors.grey.shade400,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                              
                            ),
                            
                          ],
                        ),
                        
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 20),
                      ),
                      SizedBox(height: 20),
                       Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Channels",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          SizedBox(height: 5),

                          Text(
                            "Stay updated on topics that matters to you. Find channels to follow below.",
                            style: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      )
                      ],
                    )
                      
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Text(
                    "Find channels to follow",
                    style: TextStyle(color: Colors.grey.shade400, fontSize: 16),
                  ),
                  Spacer(),
                  Obx(
                    () => GestureDetector(
                      onTap: () {
                        controller.isDown.value = !controller.isDown.value;
                      },
                      child: Container(
                        color: Colors.transparent,

                        child: Icon(
                          controller.isDown.value
                              ? Icons.expand_less
                              : Icons.expand_more_sharp,
                          size: 30,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),

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
                            height: 42,
                            width: 42,
                            "https://www.travelstart.com.ng/blog/wp-content/uploads/2014/06/london-Eye.jpg",
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Demo",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "574K followers",
                                style: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.greenAccent.shade700,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Text(
                            "Follow",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),

                    separatorBuilder: (context, index) => SizedBox(height: 20),
                  ),
                ),
              ),

              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.qr_code,
                      size: 30,
                      color: Colors.greenAccent.shade400,
                    ),
                    SizedBox(width: 15),
                    Text(
                      "Explore more",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.greenAccent.shade400,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      size: 30,
                      color: Colors.greenAccent.shade400,
                    ),
                    SizedBox(width: 15),
                    Text(
                      "Create channel",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.greenAccent.shade400,
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
          right: 10,
          bottom: 25,

          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Colors.grey.shade900,
                ),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),

                child: Icon(Icons.edit, size: 28, color: Colors.white),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Colors.greenAccent.shade400,
                ),
                padding: EdgeInsets.symmetric(horizontal: 19, vertical: 15),

                child: Icon(
                  Icons.linked_camera_outlined,
                  size: 30,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}