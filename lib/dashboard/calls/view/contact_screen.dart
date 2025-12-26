import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';
import 'package:whatsapp_clone_getx/dashboard/calls/controller/contact_controller.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';

class ContactScreen extends StatelessWidget {
  ContactScreen({super.key});

  final TextEditingController searchController = TextEditingController();

  final ContactController controller = Get.put(ContactController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.whiteColor, size: 25),
          onPressed: () => Navigator.pop(context),
        ),
        title: TextField(
          controller: searchController,
          style: TextStyle(color: AppColors.whiteColor),
          decoration: InputDecoration(
            hintText: "Search...",
            hintStyle: TextStyle(color: AppColors.greyShade400),
            border: InputBorder.none,
          ),
          onChanged: (value) {
            controller.query.value = value;
          },
        ),
        actions: [
          Icon(Icons.search, color: AppColors.whiteColor, size: 25),
          SizedBox(width: 15),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            if (controller.query.value.isEmpty)
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: AppColors.greyColor, width: 0.7),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Add up to 31 people",
                      style: TextStyle(
                        color: AppColors.greyShade400,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            SizedBox(height: 20),
            Expanded(
              child: Obx(
                () => SingleChildScrollView(
                  child: Column(
                    children: [
                      if (controller.query.value.isEmpty) ...[
                        menuTiles(),
                        SizedBox(height: 25),
                      ],
                      if (controller.filteredFrequently.isNotEmpty)
                        contactListView(
                          title: "Frequently Contacted",
                          list: controller.filteredFrequently,
                        ),
                      SizedBox(height: 25),
                      if (controller.filteredAll.isNotEmpty)
                        contactListView(
                          title: controller.query.value.isEmpty
                              ? "All Contacts"
                              : "Results",
                          list: controller.filteredAll,
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
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
            SizedBox(width: 20),
            Text(
              "New call link",
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(height: 30),
        Row(
          children: [
            iconCircle(Icons.person_add_alt_1),
            SizedBox(width: 20),
            Expanded(
              child: Text(
                "New contact",
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Icon(Icons.qr_code, size: 25, color: AppColors.whiteColor),
            SizedBox(width: 30),
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
        SizedBox(height: 15),
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
                    height: 50,
                    width: 50,
                  ),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      c["name"]!,
                      style: TextStyle(fontSize: 18, color: AppColors.whiteColor),
                    ),
                    Text(
                      c["status"]!,
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.greyShade400,
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
          separatorBuilder: (context, index) => SizedBox(height: 20),
        ),
      ],
    );
  }

  Widget iconCircle(IconData icon) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: AppColors.greenAccentShade700,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Icon(icon, size: 25, color: AppColors.blackColor),
    );
  }
}
