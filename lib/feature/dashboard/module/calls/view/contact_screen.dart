import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/calls/bloc/call_bloc.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/calls/bloc/call_event.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/calls/bloc/call_state.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/helper/l10n_ext.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class ContactScreen extends StatelessWidget {
  static const id = "/ContactScreen";
  ContactScreen({super.key});
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.blackColor,
      appBar: AppBar(
        backgroundColor: AppTheme.blackColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppTheme.whiteColor,
            size: AppSize.getSize(25),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: TextField(
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          },
          controller: searchController,
          cursorColor: AppTheme.greenAccentShade700,
          cursorWidth: 3,
          style: TextStyle(color: AppTheme.whiteColor),
          decoration: InputDecoration(
            hintText: context.l10n.search,
            hintStyle: TextStyle(color: AppTheme.greyShade400),
            border: InputBorder.none,
          ),
          onChanged: (value) {
            context.read<CallBloc>().add(SearchContacts(value));
          },
        ),
        actions: [
          Icon(
            Icons.search,
            color: AppTheme.whiteColor,
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
        child: BlocBuilder<CallBloc, CallState>(
          builder: (context, state) {
            return Column(
              children: [
                if (searchController.text.isEmpty)
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: AppSize.getSize(10),
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: AppTheme.greyColor,
                          width: AppSize.getSize(0.7),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          context.l10n.addupto31people,
                          style: TextStyle(
                            color: AppTheme.greyShade400,
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
                        if (searchController.text.isEmpty) ...[
                          menuTiles(),
                          SizedBox(height: AppSize.getSize(25)),
                        ],

                        if (state.filteredFrequently.isNotEmpty)
                          contactListView(
                            title: context.l10n.frequentlyContacted,
                            list: state.filteredFrequently,
                          ),

                        SizedBox(height: AppSize.getSize(25)),

                        if (state.filteredAll.isNotEmpty)
                          contactListView(
                            title: searchController.text.isEmpty
                                ? context.l10n.allContacts
                                : context.l10n.results,
                            list: state.filteredAll,
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
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
                color: AppTheme.whiteColor,
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
            Text(
              "New contact",
              style: TextStyle(
                color: AppTheme.whiteColor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
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
          style: TextStyle(color: AppTheme.greyShade400, fontSize: 16),
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
                    c["image"],
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      c["name"],
                      style: TextStyle(
                        fontSize: 18,
                        color: AppTheme.whiteColor,
                      ),
                    ),
                    Text(
                      c["status"],
                      style: TextStyle(
                        fontSize: 16,
                        color: AppTheme.greyShade400,
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
          separatorBuilder: (_, _) => SizedBox(height: 20),
        ),
      ],
    );
  }

  Widget iconCircle(IconData icon) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: AppTheme.greenAccentShade700,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Icon(icon, size: 25, color: AppTheme.blackColor),
    );
  }
}
