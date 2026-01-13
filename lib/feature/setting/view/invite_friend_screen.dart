import 'package:flutter/material.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';

class InviteFriendScreen extends StatelessWidget {
  static const id = "/InviteFriendScreen";
  InviteFriendScreen({super.key});
  final TextEditingController messageController = TextEditingController(
    text:
        "Lets's chat on WhatsApp! it's fast, simple, secure messaging and calling for free. This invite expires soon.",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: AppSize.getSize(25),
            color: AppColors.whiteColor,
          ),
        ),
        title: Text(
          "Invite a friend",
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Icon(
            Icons.search,
            size: AppSize.getSize(25),
            color: AppColors.whiteColor,
          ),
          SizedBox(width: AppSize.getSize(20)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSize.getSize(20),
            vertical: AppSize.getSize(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: AppSize.getSize(45),
                    width: AppSize.getSize(45),
                    decoration: BoxDecoration(
                      color: AppColors.greenAccentShade700,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.share_outlined,
                      size: AppSize.getSize(25),
                    ),
                  ),
                  SizedBox(width: AppSize.getSize(20)),
                  Text(
                    "Share link",
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: AppSize.getSize(18),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSize.getSize(30)),
              Text(
                "From contacts",
                style: TextStyle(
                  color: AppColors.greyShade400,
                  fontSize: AppSize.getSize(16),
                ),
              ),
              SizedBox(height: AppSize.getSize(20)),

              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 20,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: AppColors.greyShade900,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(AppSize.getSize(20)),
                          ),
                        ),
                        builder: (context) => Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSize.getSize(40),
                            vertical: AppSize.getSize(7),
                          ),
                          child: SingleChildScrollView(
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: AppSize.getSize(6),
                                  width: AppSize.getSize(35),
                                  decoration: BoxDecoration(
                                    color: AppColors.greyColor,
                                    borderRadius: BorderRadius.circular(
                                      AppSize.getSize(10),
                                    ),
                                  ),
                                ),
                                SizedBox(height: AppSize.getSize(30)),
                                Text(
                                  "Send SMS invite?",
                                  style: TextStyle(
                                    color: AppColors.whiteColor,
                                    fontSize: AppSize.getSize(20),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: AppSize.getSize(20)),
                                Text(
                                  "User isn't on WhatsApp. Do you want to invite them to join?",
                                  style: TextStyle(
                                    color: AppColors.greyShade400,
                                    fontSize: AppSize.getSize(16),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: AppSize.getSize(20)),
                                Container(
                                  height: AppSize.getSize(45),
                                  width: AppSize.getSize(45),
                                  decoration: BoxDecoration(
                                    color: AppColors.greyShade500,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.person,
                                    size: AppSize.getSize(30),
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                                Text(
                                  "User",
                                  style: TextStyle(
                                    color: AppColors.whiteColor,
                                    fontSize: AppSize.getSize(14),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: AppSize.getSize(20)),

                                TextField(
                                  onTapOutside: (event) {
                                    FocusScope.of(context).unfocus();
                                  },
                                  controller: messageController,
                                  cursorColor: AppColors.greenAccentShade700,
                                  enableInteractiveSelection: false,
                                  cursorWidth: AppSize.getSize(3),
                                  style: TextStyle(
                                    color: AppColors.whiteColor,
                                    fontSize: AppSize.getSize(16),
                                    fontWeight: FontWeight.w600,
                                  ),
                                  minLines: 3,
                                  maxLines: 5,
                                  decoration: InputDecoration(
                                    labelText: "Message",
                                    labelStyle: TextStyle(
                                      color: AppColors.greyShade400,
                                      fontSize: AppSize.getSize(16),
                                    ),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    border: InputBorder.none,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: AppColors.greyColor,
                                        width: AppSize.getSize(1),
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        AppSize.getSize(10),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: AppColors.greenAccentShade700,
                                        width: AppSize.getSize(1),
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        AppSize.getSize(10),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: AppSize.getSize(25)),
                                Container(
                                  height: AppSize.getSize(40),
                                  decoration: BoxDecoration(
                                    color: AppColors.greenAccentShade700,
                                    borderRadius: BorderRadius.circular(
                                      AppSize.getSize(30),
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Invite vis SMS",
                                    style: TextStyle(
                                      fontSize: AppSize.getSize(16),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                SizedBox(height: AppSize.getSize(15)),
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Not now",
                                        style: TextStyle(
                                          color: AppColors.greenAccentShade700,
                                          fontSize: AppSize.getSize(16),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: AppSize.getSize(45),
                          width: AppSize.getSize(45),
                          decoration: BoxDecoration(
                            color: AppColors.greyShade500,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.person,
                            size: AppSize.getSize(30),
                            color: AppColors.whiteColor,
                          ),
                        ),
                        SizedBox(width: AppSize.getSize(20)),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "User",
                                style: TextStyle(
                                  color: AppColors.whiteColor,
                                  fontSize: AppSize.getSize(18),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "+91 2503146985",
                                style: TextStyle(
                                  color: AppColors.greyShade400,
                                  fontSize: AppSize.getSize(16),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "Invite",
                          style: TextStyle(
                            color: AppColors.greenAccentShade700,
                            fontWeight: FontWeight.bold,
                            fontSize: AppSize.getSize(16),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                    SizedBox(height: AppSize.getSize(25)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
