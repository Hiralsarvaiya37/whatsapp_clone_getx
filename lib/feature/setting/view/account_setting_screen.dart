import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/account_screen/bloc/account_bloc.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/account_screen/bloc/account_event.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/account_screen/bloc/account_state.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/account_screen/view/change_number_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/account_screen/view/delete_account_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/account_screen/view/email_address_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/account_screen/view/pass_keys_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/account_screen/view/request_account_info_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/account_screen/view/security_notifications_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/account_screen/view/two_step_verification_screen.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/enums/account_options_enum.dart';
import 'package:whatsapp_clone_getx/utils/helper/l10n_ext.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class AccountSettingScreen extends StatelessWidget {
  static const id = "/AccountSettingScreen";
  AccountSettingScreen({super.key});
  final validOptions = [
    AccountOptionsEnum.securityNotifications,
    AccountOptionsEnum.passkeys,
    AccountOptionsEnum.emailAddress,
    AccountOptionsEnum.twoStepVerification,
    AccountOptionsEnum.changeNumber,
    AccountOptionsEnum.requestAccountInfo,
    AccountOptionsEnum.addAccount,
    AccountOptionsEnum.deleteAccount,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.blackColor,
      appBar: AppBar(
        backgroundColor: AppTheme.blackColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: AppSize.getSize(25),
            color: AppTheme.whiteColor,
          ),
        ),
        title: Text(
          "Account",
          style: TextStyle(
            color: AppTheme.whiteColor,
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
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSize.getSize(20),
                  vertical: AppSize.getSize(20),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: BlocBuilder<AccountBloc, AccountState>(
                        builder: (context, state) {
                          return ListView.separated(
                            itemCount: validOptions.length,
                            itemBuilder: (context, index) {
                              final option = validOptions[index];
                              return InkWell(
                                onTap: () {
                                  switch (option) {
                                    case AccountOptionsEnum
                                        .securityNotifications:
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) =>
                                              SecurityNotificationsScreen(),
                                        ),
                                      );
                                      break;
                                    case AccountOptionsEnum.passkeys:
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => PassKeysScreen(),
                                        ),
                                      );
                                      break;
                                    case AccountOptionsEnum.emailAddress:
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => EmailAddressScreen(),
                                        ),
                                      );
                                      break;
                                    case AccountOptionsEnum.twoStepVerification:
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) =>
                                              TwoStepVerificationScreen(),
                                        ),
                                      );
                                      break;
                                    case AccountOptionsEnum.changeNumber:
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => ChangeNumberScreen(),
                                        ),
                                      );
                                      break;
                                    case AccountOptionsEnum.requestAccountInfo:
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) =>
                                              RequestAccountInfoScreen(),
                                        ),
                                      );
                                      break;
                                    case AccountOptionsEnum.deleteAccount:
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => DeleteAccountScreen(),
                                        ),
                                      );
                                      break;
                                    case AccountOptionsEnum.addAccount:
                                      showModalBottomSheet(
                                        context: context,
                                        backgroundColor: AppTheme.greyShade900,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(
                                              AppSize.getSize(20),
                                            ),
                                          ),
                                        ),
                                        builder: (context) {
                                          return Padding(
                                            padding: EdgeInsets.all(
                                              AppSize.getSize(12),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Center(
                                                  child: Container(
                                                    height: AppSize.getSize(3),
                                                    width: AppSize.getSize(40),
                                                    decoration: BoxDecoration(
                                                      color:
                                                          AppTheme.greyShade400,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            20,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: AppSize.getSize(20),
                                                ),

                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: AppSize.getSize(
                                                      20,
                                                    ),
                                                    vertical: AppSize.getSize(
                                                      20,
                                                    ),
                                                  ),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color:
                                                          AppTheme.greyShade800,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          AppSize.getSize(15),
                                                        ),
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          ClipOval(
                                                            child: Image.network(
                                                              "https://newsmeter.in/h-upload/2021/01/19/291251-beautiful-sakura.webp",
                                                              height:
                                                                  AppSize.getSize(
                                                                    50,
                                                                  ),
                                                              width:
                                                                  AppSize.getSize(
                                                                    50,
                                                                  ),
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width:
                                                                AppSize.getSize(
                                                                  15,
                                                                ),
                                                          ),
                                                          Expanded(
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  context
                                                                      .l10n
                                                                      .addnewaccount,
                                                                  style: TextStyle(
                                                                    color: AppTheme
                                                                        .whiteColor,
                                                                    fontSize:
                                                                        AppSize.getSize(
                                                                          18,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Text(
                                                                  "+26587848545",
                                                                  style: TextStyle(
                                                                    color: AppTheme
                                                                        .greyShade400,
                                                                    fontSize:
                                                                        AppSize.getSize(
                                                                          16,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Icon(
                                                            Icons.check_circle,
                                                            color: AppTheme
                                                                .greenAccentShade700,
                                                            size:
                                                                AppSize.getSize(
                                                                  25,
                                                                ),
                                                          ),
                                                        ],
                                                      ),

                                                      SizedBox(
                                                        height: AppSize.getSize(
                                                          20,
                                                        ),
                                                      ),

                                                      Row(
                                                        children: [
                                                          Container(
                                                            height:
                                                                AppSize.getSize(
                                                                  50,
                                                                ),
                                                            width:
                                                                AppSize.getSize(
                                                                  50,
                                                                ),
                                                            decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                    AppSize.getSize(
                                                                      50,
                                                                    ),
                                                                  ),
                                                              color: AppTheme
                                                                  .greyShade900,
                                                            ),
                                                            child: Icon(
                                                              Icons.add,
                                                              color: AppTheme
                                                                  .whiteColor,
                                                              size:
                                                                  AppSize.getSize(
                                                                    28,
                                                                  ),
                                                            ),
                                                          ),
                                                          SizedBox(width: 15),
                                                          Text(
                                                            context
                                                                .l10n
                                                                .addWhatsAppaccount,
                                                            style: TextStyle(
                                                              color: AppTheme
                                                                  .whiteColor,
                                                              fontSize:
                                                                  AppSize.getSize(
                                                                    18,
                                                                  ),
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
                                      break;
                                  }

                                  context.read<AccountBloc>().add(
                                    ResetNavigationEvent(),
                                  );
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      validOptions[index].iconData,
                                      color: AppTheme.greyShade400,
                                      size: AppSize.getSize(30),
                                    ),
                                    SizedBox(width: AppSize.getSize(20)),
                                    Text(
                                      validOptions[index].labels(context),
                                      style: TextStyle(
                                        color: AppTheme.whiteColor,
                                        fontSize: AppSize.getSize(18),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                SizedBox(height: AppSize.getSize(30)),
                          );
                        },
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
