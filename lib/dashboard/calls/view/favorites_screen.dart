import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/dashboard/calls/controller/call_controller.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  TextEditingController searchController = TextEditingController();
 final CallController callCntr = Get.find();

  @override
  void initState() {
    super.initState();
    callCntr.frequently.value = List.generate(5, (i) => "User ${i + 1}");
    callCntr.allFavoritesContacts.value = List.generate(
      15,
      (i) => "User ${i + 6}",
    );
    callCntr.filteredFavoritesFrequently.value = List.from(callCntr.frequently);
    callCntr.filteredAllFav.value = List.from(callCntr.allFavoritesContacts);
  }

  void searchContacts(String query) {
    if (query.isEmpty) {
      callCntr.filteredFavoritesFrequently.value = List.from(
        callCntr.frequently,
      );
      callCntr.filteredAllFav.value = List.from(callCntr.allFavoritesContacts);
    } else {
      callCntr.filteredFavoritesFrequently.value = callCntr.frequently
          .where((c) => c.toLowerCase().contains(query.toLowerCase()))
          .toList();

      callCntr.filteredAllFav.value = callCntr.allFavoritesContacts
          .where((c) => c.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }

  void addToFavorites(String user) {
    if (!callCntr.favorites.contains(user)) {
      callCntr.favorites.add(user);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,

      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.whiteColor,
            size: AppSize.getSize(25),
          ),
        ),
        title: TextField(
          controller: searchController,
          cursorColor: AppColors.greenAccentShade700,
          cursorWidth: 3,
          onChanged: searchContacts,
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: AppSize.getSize(18),
          ),
          decoration: InputDecoration(
            hintText: "Search",
            hintStyle: TextStyle(color: AppColors.greyShade400),
            border: InputBorder.none,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.getSize(20),
          vertical: AppSize.getSize(20),
        ),

        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              favoritesRow(),

              SizedBox(height: AppSize.getSize(25)),

              sectionWidget(
                "Frequently contacted",
                callCntr.filteredFavoritesFrequently,
              ),

              SizedBox(height: AppSize.getSize(30)),

              sectionWidget("Contacts on WhatsApp", callCntr.filteredAllFav),
            ],
          ),
        ),
      ),

      floatingActionButton: Container(
        height: AppSize.getSize(60),
        width: AppSize.getSize(60),
        decoration: BoxDecoration(
          color: AppColors.greenAccentShade700,
          borderRadius: BorderRadius.circular(AppSize.getSize(15)),
        ),
        child: Icon(
          Icons.check,
          color: AppColors.blackColor,
          size: AppSize.getSize(25),
        ),
      ),
    );
  }

  Widget favoritesRow() {
    return Obx(() {
      if (callCntr.favorites.isEmpty) return SizedBox();
      return SizedBox(
        height: AppSize.getSize(90),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: callCntr.favorites.length,
          itemBuilder: (context, index) => Column(
            children: [
              ClipOval(
                child: Image.network(
                  "https://m.media-amazon.com/images/I/61fJjBmd34L._AC_UF350,350_QL80_.jpg",
                  height: AppSize.getSize(60),
                  width: AppSize.getSize(60),
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: AppSize.getSize(5)),
              Text(
                callCntr.favorites[index],
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: AppSize.getSize(14),
                ),
              ),
            ],
          ),
          separatorBuilder: (context, index) =>
              SizedBox(width: AppSize.getSize(15)),
        ),
      );
    });
  }

  Widget contactTile(String name) {
    return Row(
      children: [
        ClipOval(
          child: Image.network(
            "https://m.media-amazon.com/images/I/61fJjBmd34L._AC_UF350,350_QL80_.jpg",
            height: AppSize.getSize(50),
            width: AppSize.getSize(50),
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: AppSize.getSize(20)),
        Text(
          name,
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: AppSize.getSize(18),
          ),
        ),
      ],
    );
  }

  Widget sectionWidget(String title, List<String> list) {
    if (list.isEmpty) return SizedBox();

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
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => GestureDetector(
            onTap: () => addToFavorites(list[index]),
            child: contactTile(list[index]),
          ),
          separatorBuilder: (context, index) =>
              SizedBox(height: AppSize.getSize(18)),
        ),
      ],
    );
  }
}
