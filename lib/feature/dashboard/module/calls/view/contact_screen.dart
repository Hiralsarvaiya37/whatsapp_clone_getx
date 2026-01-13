import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/calls/controller/call_controller.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';

class ContactScreen extends GetView<CallController> {
  static const id = "/ContactScreen";
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.whiteColor,
            size: AppSize.getSize(25),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: TextField(
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          },
          controller: controller.searchController,
          cursorColor: AppColors.greenAccentShade700,
          cursorWidth: 3,
          style: TextStyle(color: AppColors.whiteColor),
          decoration: InputDecoration(
            hintText: "Search...",
            hintStyle: TextStyle(color: AppColors.greyShade400),
            border: InputBorder.none,
          ),
          onChanged: (value) {
            controller.changeValue(value);
          },
        ),
        actions: [
          Icon(
            Icons.search,
            color: AppColors.whiteColor,
            size: AppSize.getSize(25),
          ),
          SizedBox(width: AppSize.getSize(15)),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.getSize(20),
          vertical: AppSize.getSize(20),
        ),
        child: Obx(
          () => Column(
            children: [
              if (controller.query.value.isEmpty)
                Container(
                  padding: EdgeInsets.symmetric(vertical: AppSize.getSize(10)),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: AppColors.greyColor,
                        width: AppSize.getSize(0.7),
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Add up to 31 people",
                        style: TextStyle(
                          color: AppColors.greyShade400,
                          fontSize: AppSize.getSize(16),
                        ),
                      ),
                    ],
                  ),
                ),
              SizedBox(height: AppSize.getSize(20)),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      if (controller.query.value.isEmpty) ...[
                        menuTiles(),
                        SizedBox(height: AppSize.getSize(25)),
                      ],

                      if (controller.filteredFrequently.isNotEmpty)
                        Obx(
                          () => contactListView(
                            title: "Frequently Contacted",
                            list: controller.filteredFrequently,
                          ),
                        ),

                      SizedBox(height: AppSize.getSize(25)),

                      if (controller.filteredAll.isNotEmpty)
                        Obx(
                          () => contactListView(
                            title: controller.query.value.isEmpty
                                ? "All Contacts"
                                : "Results",
                            list: controller.filteredAll,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget menuTiles() {
    return Column(
      children: [
        Row(
          children: [
            iconCircle(Icons.link),
            SizedBox(width: AppSize.getSize(20)),
            Text(
              "New call link",
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: AppSize.getSize(18),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(height: AppSize.getSize(30)),
        Row(
          children: [
            iconCircle(Icons.person_add_alt_1),
            SizedBox(width: AppSize.getSize(20)),
            Expanded(
              child: Text(
                "New contact",
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: AppSize.getSize(18),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Icon(
              Icons.qr_code,
              size: AppSize.getSize(30),
              color: AppColors.whiteColor,
            ),
            SizedBox(width: AppSize.getSize(25)),
          ],
        ),
      ],
    );
  }

  Widget contactListView({required String title, required List list}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(color: AppColors.greyShade400, fontSize: 16),
        ),
        SizedBox(height: AppSize.getSize(15)),
        ListView.separated(
          itemCount: list.length,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            var c = list[index];
            return Row(
              children: [
                ClipOval(
                  child: Image.network(
                    c["image"]!,
                    fit: BoxFit.cover,
                    height: AppSize.getSize(50),
                    width: AppSize.getSize(50),
                  ),
                ),
                SizedBox(width: AppSize.getSize(20)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      c["name"]!,
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    Text(
                      c["status"]!,
                      style: TextStyle(
                        fontSize: AppSize.getSize(16),
                        color: AppColors.greyShade400,
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
          separatorBuilder: (context, index) =>
              SizedBox(height: AppSize.getSize(20)),
        ),
      ],
    );
  }

  Widget iconCircle(IconData icon) {
    return Container(
      height: AppSize.getSize(50),
      width: AppSize.getSize(50),
      decoration: BoxDecoration(
        color: AppColors.greenAccentShade700,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Icon(icon, size: AppSize.getSize(25), color: AppColors.blackColor),
    );
  }
}
