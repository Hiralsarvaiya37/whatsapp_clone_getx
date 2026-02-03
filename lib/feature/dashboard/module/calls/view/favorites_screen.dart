import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/calls/provider/call_provider.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/helper/l10n_ext.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class FavoritesScreen extends StatelessWidget {
  static const id = "/FavoritesScreen";
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Provider se data access
    final callProvider = context.watch<CallProvider>();

    return Scaffold(
      backgroundColor: context.watch<AppTheme>().blackColor,
      appBar: AppBar(
        backgroundColor: context.watch<AppTheme>().blackColor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: context.watch<AppTheme>().whiteColor,
            size: AppSize.getSize(25),
          ),
        ),
        title: TextField(
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          },
          controller: callProvider.searchController,
          cursorColor: context.watch<AppTheme>().greenAccentShade700,
          cursorWidth: 3,
          onChanged: callProvider.searchContacts,
          style: TextStyle(
            color: context.watch<AppTheme>().whiteColor,
            fontSize: AppSize.getSize(18),
          ),
          decoration: InputDecoration(
            hintText: context.l10n.search,
            hintStyle: TextStyle(color: context.watch<AppTheme>().greyShade400),
            border: InputBorder.none,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.getSize(20),
          vertical: AppSize.getSize(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            favoritesRow(callProvider),
            SizedBox(height: AppSize.getSize(25)),
            sectionWidget(
              context.l10n.frequentlyContacted,
              callProvider.filteredFavoritesFrequently,
              callProvider,context
            ),
            SizedBox(height: AppSize.getSize(30)),
            sectionWidget(
              context.l10n.contactsonWhatsApp,
              callProvider.filteredAllFav,
              callProvider,context
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: AppSize.getSize(60),
        width: AppSize.getSize(60),
        decoration: BoxDecoration(
          color: context.watch<AppTheme>().greenAccentShade700,
          borderRadius: BorderRadius.circular(AppSize.getSize(15)),
        ),
        child: Icon(
          Icons.check,
          color: context.watch<AppTheme>().blackColor,
          size: AppSize.getSize(25),
        ),
      ),
    );
  }

  // Horizontal row of favorites
  Widget favoritesRow(CallProvider provider) {
    if (provider.favorites.isEmpty) return SizedBox();

    return SizedBox(
      height: AppSize.getSize(90),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: provider.favorites.length,
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
              provider.favorites[index],
              style: TextStyle(
                color: context.watch<AppTheme>().whiteColor,
                fontSize: AppSize.getSize(14),
              ),
            ),
          ],
        ),
        separatorBuilder: (context, index) => SizedBox(width: AppSize.getSize(15)),
      ),
    );
  }

  Widget contactTile(String name, BuildContext context) {
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
            color: context.watch<AppTheme>().whiteColor,
            fontSize: AppSize.getSize(18),
          ),
        ),
      ],
    );
  }

  // Section widget for frequently contacted or all contacts
  Widget sectionWidget(String title, List<String> list, CallProvider provider,BuildContext context) {
    if (list.isEmpty) return SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(color: context.watch<AppTheme>().greyShade400, fontSize: 16),
        ),
        SizedBox(height: AppSize.getSize(15)),
        ListView.separated(
          itemCount: list.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => GestureDetector(
            onTap: () => provider.addToFavorites(list[index]),
            child: contactTile(list[index],context),
          ),
          separatorBuilder: (context, index) => SizedBox(height: AppSize.getSize(18)),
        ),
      ],
    );
  }
}
