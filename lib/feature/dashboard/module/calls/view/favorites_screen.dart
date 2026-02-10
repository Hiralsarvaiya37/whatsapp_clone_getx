import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/calls/bloc/call_bloc.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/calls/bloc/call_event.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/calls/bloc/call_state.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/helper/l10n_ext.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class FavoritesScreen extends StatelessWidget {
  static const id = "/FavoritesScreen";
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.blackColor,

      appBar: AppBar(
        backgroundColor: AppTheme.blackColor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: AppTheme.whiteColor,
            size: AppSize.getSize(25),
          ),
        ),
        title: TextField(
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          },
          cursorColor: AppTheme.greenAccentShade700,
          cursorWidth: 3,
          onChanged: (value) {
            context.read<CallBloc>().add(SearchContacts(value));
          },
          style: TextStyle(
            color: AppTheme.whiteColor,
            fontSize: AppSize.getSize(18),
          ),
          decoration: InputDecoration(
            hintText: context.l10n.search,
            hintStyle: TextStyle(color: AppTheme.greyShade400),
            border: InputBorder.none,
          ),
        ),
      ),

      body: BlocBuilder<CallBloc, CallState>(
        builder: (context, state) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: AppSize.getSize(20),
              vertical: AppSize.getSize(20),
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                favoritesRow(state),

                SizedBox(height: AppSize.getSize(25)),

                sectionWidget(
                  context.l10n.frequentlyContacted,
                  state.filteredFrequently.map((e) => e["name"]!).toList(),
                  context,
                ),

                SizedBox(height: AppSize.getSize(30)),

                sectionWidget(
                  context.l10n.contactsonWhatsApp,
                  state.filteredAll.map((e) => e["name"]!).toList(),
                  context,
                ),
              ],
            ),
          );
        },
      ),

      floatingActionButton: Container(
        height: AppSize.getSize(60),
        width: AppSize.getSize(60),
        decoration: BoxDecoration(
          color: AppTheme.greenAccentShade700,
          borderRadius: BorderRadius.circular(AppSize.getSize(15)),
        ),
        child: Icon(
          Icons.check,
          color: AppTheme.blackColor,
          size: AppSize.getSize(25),
        ),
      ),
    );
  }

  Widget favoritesRow(CallState state) {
    if (state.favorites.isEmpty) return SizedBox();

    return SizedBox(
      height: AppSize.getSize(90),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: state.favorites.length,
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
              state.favorites[index],
              style: TextStyle(
                color: AppTheme.whiteColor,
                fontSize: AppSize.getSize(14),
              ),
            ),
          ],
        ),
        separatorBuilder: (context, index) =>
            SizedBox(width: AppSize.getSize(15)),
      ),
    );
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
            color: AppTheme.whiteColor,
            fontSize: AppSize.getSize(18),
          ),
        ),
      ],
    );
  }

  Widget sectionWidget(String title, List<String> list, BuildContext context) {
    if (list.isEmpty) return SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(color: AppTheme.greyShade400, fontSize: 16),
        ),
        SizedBox(height: AppSize.getSize(15)),

        ListView.separated(
          itemCount: list.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              context.read<CallBloc>().add(AddToFavorites(list[index]));
            },
            child: contactTile(list[index]),
          ),
          separatorBuilder: (context, index) =>
              SizedBox(height: AppSize.getSize(18)),
        ),
      ],
    );
  }
}
