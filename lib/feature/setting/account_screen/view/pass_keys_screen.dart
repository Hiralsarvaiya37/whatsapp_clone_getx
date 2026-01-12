import 'package:flutter/material.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';

class PassKeysScreen extends StatelessWidget {
  static const id="/PassKeysScreen";
  const PassKeysScreen({super.key});

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
          "Passkeys",
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.getSize(20),
          vertical: AppSize.getSize(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Manage your passkey",
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: AppSize.getSize(22),
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: AppSize.getSize(15)),

            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text:
                        "Access WhatsApp the same way you unloack your phone. with your fingerprint, face or screen lock. your passkey gives you a secure and easy way to log back into your account. ",
                    style: TextStyle(
                      color: AppColors.greyShade400,
                      fontSize: AppSize.getSize(16),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: "Learn more",
                    style: TextStyle(
                      color: AppColors.blueshade500,
                      fontSize: AppSize.getSize(16),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSize.getSize(25)),

            Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.greyShade800),
                borderRadius: BorderRadius.circular(AppSize.getSize(10)),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSize.getSize(25),
                  vertical: AppSize.getSize(17),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: AppSize.getSize(50),
                      width: AppSize.getSize(50),
                      decoration: BoxDecoration(
                        color: AppColors.greenshade900,
                        borderRadius: BorderRadius.circular(
                          AppSize.getSize(50),
                        ),
                      ),
                      child: Icon(
                        Icons.person_add_alt_1_sharp,
                        color: AppColors.blackColor,
                        size: AppSize.getSize(27),
                      ),
                    ),
                    SizedBox(width: AppSize.getSize(15)),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Passkey",
                            style: TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: AppSize.getSize(18),
                            ),
                          ),
                          SizedBox(height: AppSize.getSize(5)),
                          Text(
                            "This will be used to verify your account",
                            style: TextStyle(
                              color: AppColors.greyShade400,
                              fontSize: AppSize.getSize(16),
                            ),
                          ),
                          SizedBox(height: AppSize.getSize(15)),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    backgroundColor: AppColors.greyShade900,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        AppSize.getSize(20),
                                      ),
                                    ),
                                    title: Text(
                                      "Delete passkey?",
                                      style: TextStyle(
                                        color: AppColors.whiteColor,
                                        fontSize: AppSize.getSize(22),
                                      ),
                                    ),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "If you delete this passkey, you won't be able to use it to log into your account.",
                                          style: TextStyle(
                                            color: AppColors.greyShade400,
                                            fontSize: AppSize.getSize(16),
                                          ),
                                        ),
                                        SizedBox(height: AppSize.getSize(10)),
                                        Text(
                                          "If you device to delete, be sure to also delete the passkey from your device password manager.",
                                          style: TextStyle(
                                            color: AppColors.greyShade400,
                                            fontSize: AppSize.getSize(16),
                                          ),
                                        ),
                                        SizedBox(height: AppSize.getSize(25)),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                "Cancel",
                                                style: TextStyle(
                                                  color: AppColors
                                                      .greenAccentShade700,
                                                  fontSize: AppSize.getSize(17),
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: AppSize.getSize(25),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                "Delete",
                                                style: TextStyle(
                                                  color: AppColors.redColor,
                                                  fontSize: AppSize.getSize(17),
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: AppSize.getSize(13),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: Text(
                              "Delete",
                              style: TextStyle(
                                color: AppColors.redColor,
                                fontSize: AppSize.getSize(17),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
