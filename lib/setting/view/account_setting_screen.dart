import 'package:flutter/material.dart';
import 'package:whatsapp_clone_getx/setting/account_screen/view/pass_keys_screen.dart';
import 'package:whatsapp_clone_getx/setting/account_screen/view/security_notifications_screen.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/enums/account_options_enum.dart';

class AccountSettingScreen extends StatelessWidget {
  const AccountSettingScreen({super.key});

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
          icon: Icon(Icons.arrow_back, size: AppSize.getSize(25), color: AppColors.whiteColor),
        ),
        title: Text(
          "Account",
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSize.getSize(20), vertical: AppSize.getSize(20)),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: AccountOptionsEnum.values.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      if (AccountOptionsEnum.values[index] ==
                          AccountOptionsEnum.securityNotifications) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SecurityNotificationsScreen(),
                          ),
                        );
                      }
                      if (AccountOptionsEnum.values[index] ==
                          AccountOptionsEnum.passkeys) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PassKeysScreen(),
                          ),
                        );
                      }

                      if (AccountOptionsEnum.values[index] ==
                          AccountOptionsEnum.emailAddress) {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => EmailAddressScreen(),
                        //   ),
                        // );
                      }
                      if (AccountOptionsEnum.values[index] ==
                          AccountOptionsEnum.twoStepVerification) {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => TwoStepVerificationScreen(),
                        //   ),
                        // );
                      }

                      if (AccountOptionsEnum.values[index] ==
                          AccountOptionsEnum.changeNumber) {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => ChangeNumberScreen(),
                        //   ),
                        // );
                      }

                      if (AccountOptionsEnum.values[index] ==
                          AccountOptionsEnum.requestAccountInfo) {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => RequestAccountInfoScreen(),
                        //   ),
                        // );
                      }

                      if (AccountOptionsEnum.values[index] ==
                          AccountOptionsEnum.addAccount) {
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
                              padding: EdgeInsets.all(AppSize.getSize(12)),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Container(
                                      height: AppSize.getSize(3),
                                      width: AppSize.getSize(40),
                                      decoration: BoxDecoration(
                                        color: AppColors.greyShade400,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: AppSize.getSize(20)),

                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: AppSize.getSize(20),
                                      vertical: AppSize.getSize(20),
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: AppColors.greyShade800,
                                      ),
                                      borderRadius: BorderRadius.circular(AppSize.getSize(15)),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            ClipOval(
                                              child: Image.network(
                                                "https://madaboutdecor.co.in/cdn/shop/files/IMG_0713.heic?v=1728289287",
                                                height: AppSize.getSize(50),
                                                width: AppSize.getSize(50),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            SizedBox(width: AppSize.getSize(15)),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Add new account",
                                                    style: TextStyle(
                                                      color: AppColors.whiteColor,
                                                      fontSize: AppSize.getSize(18),
                                                    ),
                                                  ),
                                                  Text(
                                                    "+26587848545",
                                                    style: TextStyle(
                                                      color:
                                                          AppColors.greyShade400,
                                                      fontSize: AppSize.getSize(16),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Icon(
                                              Icons.check_circle,
                                              color:
                                                  AppColors.greenAccentShade700,
                                              size: AppSize.getSize(25),
                                            ),
                                          ],
                                        ),

                                        SizedBox(height: AppSize.getSize(20)),

                                        Row(
                                          children: [
                                            Container(
                                              height: AppSize.getSize(50),
                                              width: AppSize.getSize(50),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(AppSize.getSize(50)),
                                                color: AppColors.greyShade900,
                                              ),
                                              child: Icon(
                                                Icons.add,
                                                color: AppColors.whiteColor,
                                                size: AppSize.getSize(28),
                                              ),
                                            ),
                                            SizedBox(width: 15),
                                            Text(
                                              "Add WhatsApp account",
                                              style: TextStyle(
                                                color: AppColors.whiteColor,
                                                fontSize: AppSize.getSize(18),
                                              ),
                                            ),
                                          ],
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

                      if (AccountOptionsEnum.values[index] ==
                          AccountOptionsEnum.deleteAccount) {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => DeleteAccountScreen(),
                        //   ),
                        // );
                      }
                    },

                    child: Row(
                      children: [
                        Icon(
                          AccountOptionsEnum.values[index].iconData,
                          color: AppColors.greyShade400,
                          size: AppSize.getSize(30),
                        ),
                        SizedBox(width: AppSize.getSize(20)),
                        Text(
                          AccountOptionsEnum.values[index].titles,
                          style: TextStyle(color: AppColors.whiteColor, fontSize: AppSize.getSize(18)),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: AppSize.getSize(30)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
