import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapp_clone_getx/feature/setting/bloc/setting_bloc.dart';
import 'package:whatsapp_clone_getx/feature/setting/bloc/setting_event.dart';
import 'package:whatsapp_clone_getx/feature/setting/bloc/setting_state.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/account_screen/bloc/account_bloc.dart';
import 'package:whatsapp_clone_getx/feature/setting/view/accessibility_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/view/account_setting_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/view/app_updates_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/view/avatar_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/view/broadcasts_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/view/chats_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/view/help_and_feedback_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/view/invite_friend_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/view/lists_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/view/notifications_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/view/privacy_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/view/qr_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/view/storage_and_data_screen.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/enums/language_enum.dart';
import 'package:whatsapp_clone_getx/utils/enums/setting_option_enum.dart';
import 'package:whatsapp_clone_getx/utils/helper/l10n_ext.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class SettingScreen extends StatelessWidget {
  static const id = "/SettingScreen";
  const SettingScreen({super.key});

  Future pickFromCamera(BuildContext context) async {
    final picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    if (!context.mounted) return;

    if (photo != null) {
      context.read<SettingBloc>().add(UploadProfilePic(File(photo.path)));
    }
  }

  Future pickFromGallery(BuildContext context) async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (!context.mounted) return;

    if (image != null) {
      context.read<SettingBloc>().add(UploadProfilePic(File(image.path)));
    }
  }

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
            color: AppTheme.whiteColor,
            size: AppSize.getSize(25),
          ),
        ),
        title: Text(
          context.l10n.settings,
          style: TextStyle(
            fontSize: AppSize.getSize(25),
            color: AppTheme.whiteColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Icon(
            Icons.search,
            color: AppTheme.whiteColor,
            size: AppSize.getSize(25),
          ),
          SizedBox(width: AppSize.getSize(20)),
        ],
      ),

      body: BlocBuilder<SettingBloc, SettingState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSize.getSize(20),
                vertical: AppSize.getSize(30),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Stack(
                        children: [
                          if (state.profilePicUrl.isEmpty)
                            ClipOval(
                              child: Image.asset(
                                "assets/i2.jpg",
                                height: AppSize.getSize(55),
                                width: AppSize.getSize(55),
                                fit: BoxFit.cover,
                              ),
                            )
                          else if (state.profilePicUrl.startsWith("http"))
                            ClipOval(
                              child: Image.network(
                                state.profilePicUrl,
                                height: AppSize.getSize(55),
                                width: AppSize.getSize(55),
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stack) {
                                  return Icon(Icons.error, size: 55);
                                },
                              ),
                            )
                          else
                            ClipOval(
                              child: Image.file(
                                File(state.profilePicUrl),
                                height: AppSize.getSize(55),
                                width: AppSize.getSize(55),
                                fit: BoxFit.cover,
                              ),
                            ),

                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: InkWell(
                              onTap: () => showImagePickerSheet(context),
                              child: Container(
                                height: AppSize.getSize(22),
                                width: AppSize.getSize(22),
                                decoration: BoxDecoration(
                                  color: AppTheme.greenAccentShade700,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: AppTheme.blackColor,
                                    width: AppSize.getSize(0.5),
                                  ),
                                ),
                                child: Icon(
                                  Icons.edit,
                                  size: AppSize.getSize(16),
                                  color: AppTheme.blackColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: AppSize.getSize(20)),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "User account",
                              style: TextStyle(
                                color: AppTheme.whiteColor,
                                fontSize: AppSize.getSize(18),
                              ),
                            ),
                            SizedBox(height: AppSize.getSize(7)),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: AppSize.getSize(25),
                                vertical: AppSize.getSize(2),
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppTheme.greyShade400,
                                ),
                                borderRadius: BorderRadius.circular(
                                  AppSize.getSize(20),
                                ),
                              ),
                              child: Text(
                                "Busy",
                                style: TextStyle(
                                  color: AppTheme.greyShade400,
                                  fontSize: AppSize.getSize(14),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => QrScreen()),
                          );
                        },
                        child: Icon(
                          Icons.qr_code,
                          color: AppTheme.greenAccentShade700,
                          size: AppSize.getSize(28),
                        ),
                      ),
                      SizedBox(width: 15),
                      GestureDetector(
                        onTap: () {
                          openAddAccountSheet(context);
                        },
                        child: Icon(
                          Icons.add_circle_outline,
                          color: AppTheme.greenAccentShade700,
                          size: AppSize.getSize(28),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: AppSize.getSize(30)),

                  ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: SettingOptionEnum.values.length,
                    itemBuilder: (context, index) {
                      final item = SettingOptionEnum.values[index];
                      return ListTile(
                        leading: Icon(
                          item.iconData,
                          color: AppTheme.whiteColor,
                          size: AppSize.getSize(28),
                        ),

                        title: Text(
                          item.label(context),

                          style: TextStyle(
                            color: AppTheme.whiteColor,
                            fontSize: AppSize.getSize(18),
                          ),
                        ),
                        subtitle: item.subtitles(state).isNotEmpty
                            ? Text(
                                item.subtitles(state),
                                style: TextStyle(
                                  color: AppTheme.greyColor,
                                  fontSize: AppSize.getSize(16),
                                ),
                              )
                            : null,

                        onTap: () {
                          switch (item) {
                            case SettingOptionEnum.account:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => BlocProvider(
                                    create: (_) => AccountBloc(),
                                    child: AccountSettingScreen(),
                                  ),
                                ),
                              );
                              break;

                            case SettingOptionEnum.privacy:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PrivacyScreen(),
                                ),
                              );
                              break;

                            case SettingOptionEnum.avatar:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AvatarScreen(),
                                ),
                              );
                              break;

                            case SettingOptionEnum.lists:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ListsScreen(),
                                ),
                              );
                              break;

                            case SettingOptionEnum.chat:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChatsScreen(),
                                ),
                              );
                              break;

                            case SettingOptionEnum.broadcasts:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BroadcastsScreen(),
                                ),
                              );
                              break;

                            case SettingOptionEnum.notifications:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NotificationsScreen(),
                                ),
                              );
                              break;

                            case SettingOptionEnum.storageanddata:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => StorageAndDataScreen(),
                                ),
                              );
                              break;

                            case SettingOptionEnum.accesibility:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AccessibilityScreen(),
                                ),
                              );
                              break;

                            case SettingOptionEnum.applanguage:
                              openModalSheet(context);
                              break;

                            case SettingOptionEnum.helpandfeedback:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HelpAndFeedbackScreen(),
                                ),
                              );
                              break;

                            case SettingOptionEnum.inviteafriend:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => InviteFriendScreen(),
                                ),
                              );
                              break;

                            case SettingOptionEnum.appupdate:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AppUpdatesScreen(),
                                ),
                              );
                              break;
                          }
                        },
                      );
                    },
                    separatorBuilder: (context, index) =>
                        SizedBox(height: AppSize.getSize(18)),
                  ),

                  SizedBox(height: AppSize.getSize(20)),

                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSize.getSize(10),
                      vertical: AppSize.getSize(20),
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: AppTheme.greyShade800,
                          width: AppSize.getSize(1),
                        ),
                        bottom: BorderSide(
                          color: AppTheme.greyShade800,
                          width: AppSize.getSize(1),
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.all_inclusive,
                              size: AppSize.getSize(25),
                              color: AppTheme.whiteColor,
                            ),
                            SizedBox(width: AppSize.getSize(10)),
                            Text(
                              "Meta",
                              style: TextStyle(
                                color: AppTheme.whiteColor,
                                fontSize: AppSize.getSize(18),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: AppSize.getSize(5)),
                        Text(
                          "Accounts Center",
                          style: TextStyle(
                            color: AppTheme.whiteColor,
                            fontSize: AppSize.getSize(17),
                          ),
                        ),

                        SizedBox(height: AppSize.getSize(5)),
                        Text(
                          "Control your experience across WhatsApp, Facebook, Instagram and more.",
                          style: TextStyle(
                            color: AppTheme.greyShade400,
                            fontSize: AppSize.getSize(14),
                          ),
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: AppSize.getSize(20)),

                  Text(
                    "Also from Meta",
                    style: TextStyle(
                      color: AppTheme.greyShade400,
                      fontSize: AppSize.getSize(17),
                    ),
                  ),

                  SizedBox(height: AppSize.getSize(25)),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      appIcon("Meta AI App", Icons.circle_outlined),
                      appIcon("Instagram", Icons.photo_camera),
                      appIcon("Facebook", Icons.facebook),
                      appIcon("Threads", Icons.alternate_email_outlined),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget appIcon(String label, IconData icon) {
    return Column(
      children: [
        Container(
          height: AppSize.getSize(50),
          width: AppSize.getSize(50),
          decoration: BoxDecoration(
            color: AppTheme.greyShade900,
            borderRadius: BorderRadius.circular(AppSize.getSize(50)),
          ),
          child: Icon(
            icon,
            size: AppSize.getSize(25),
            color: AppTheme.whiteColor,
          ),
        ),
        SizedBox(height: AppSize.getSize(7)),
        Text(
          label,
          style: TextStyle(
            color: AppTheme.whiteColor,
            fontSize: AppSize.getSize(16),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  void openAddAccountSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppTheme.greyShade900,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSize.getSize(20)),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(AppSize.getSize(10)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: AppSize.getSize(4),
                  width: AppSize.getSize(40),
                  decoration: BoxDecoration(
                    color: AppTheme.greyShade400,
                    borderRadius: BorderRadius.circular(AppSize.getSize(20)),
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
                  border: Border.all(color: AppTheme.greyShade800),
                  borderRadius: BorderRadius.circular(AppSize.getSize(15)),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        ClipOval(
                          child: Image.network(
                            "https://newsmeter.in/h-upload/2021/01/19/291251-beautiful-sakura.webp",
                            height: AppSize.getSize(50),
                            width: AppSize.getSize(50),
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: AppSize.getSize(15)),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Add new account",
                                style: TextStyle(
                                  color: AppTheme.whiteColor,
                                  fontSize: AppSize.getSize(18),
                                ),
                              ),
                              Text(
                                "+26587848545",
                                style: TextStyle(
                                  color: AppTheme.greyShade400,
                                  fontSize: AppSize.getSize(16),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.check_circle,
                          color: AppTheme.greenAccentShade700,
                          size: AppSize.getSize(25),
                        ),
                      ],
                    ),

                    SizedBox(height: AppSize.getSize(15)),

                    Row(
                      children: [
                        Container(
                          height: AppSize.getSize(50),
                          width: AppSize.getSize(50),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              AppSize.getSize(50),
                            ),
                            color: AppTheme.greyShade900,
                          ),
                          child: Icon(
                            Icons.add,
                            color: AppTheme.whiteColor,
                            size: AppSize.getSize(28),
                          ),
                        ),
                        SizedBox(width: AppSize.getSize(15)),
                        Text(
                          "Add WhatsApp account",
                          style: TextStyle(
                            color: AppTheme.whiteColor,
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

  void openModalSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppTheme.greyShade900,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSize.getSize(20)),
        ),
      ),
      builder: (modalContext) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              height:
                  MediaQuery.of(context).size.height * AppSize.getSize(0.97),
              padding: EdgeInsets.symmetric(
                horizontal: AppSize.getSize(25),
                vertical: AppSize.getSize(7),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      height: AppSize.getSize(5),
                      width: AppSize.getSize(40),
                      decoration: BoxDecoration(
                        color: AppTheme.greyColor,
                        borderRadius: BorderRadius.circular(
                          AppSize.getSize(20),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: AppSize.getSize(20)),

                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.close,
                          size: AppSize.getSize(25),
                          color: AppTheme.greyShade400,
                        ),
                      ),
                      SizedBox(width: AppSize.getSize(25)),
                      Text(
                        "App language",
                        style: TextStyle(
                          color: AppTheme.whiteColor,
                          fontSize: AppSize.getSize(20),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSize.getSize(30)),
                  Expanded(
                    child: ListView.builder(
                      itemCount: LanguageEnum.values.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: AppSize.getSize(15)),
                          child: radioTile(
                            LanguageEnum.values[index],
                            setModalState,
                            modalContext,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget radioTile(
    LanguageEnum lang,
    void Function(VoidCallback) setModalState,
    BuildContext context,
  ) {
    return BlocBuilder<SettingBloc, SettingState>(
      builder: (context, state) {
        bool isSelected = state.language.code == lang.code;

        String title = lang.title;

        return InkWell(
          onTap: () {
            context.read<SettingBloc>().add(ChangeLanguage(lang));
            Navigator.pop(context);
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: AppSize.getSize(8)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: AppSize.getSize(22),
                  width: AppSize.getSize(22),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: isSelected
                          ? AppTheme.greenAccentShade700
                          : AppTheme.greyColor,
                      width: 2,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: isSelected
                      ? Center(
                          child: Container(
                            height: AppSize.getSize(12),
                            width: AppSize.getSize(12),
                            decoration: BoxDecoration(
                              color: AppTheme.greenAccentShade700,
                              shape: BoxShape.circle,
                            ),
                          ),
                        )
                      : SizedBox(),
                ),

                SizedBox(width: AppSize.getSize(25)),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: AppTheme.whiteColor,
                          fontSize: AppSize.getSize(18),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void showImagePickerSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppTheme.greyShade900,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSize.getSize(20)),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(AppSize.getSize(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  pickFromCamera(context);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.all(AppSize.getSize(14)),
                      decoration: BoxDecoration(
                        color: AppTheme.greenAccentShade700,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.camera_alt,
                        color: AppTheme.blackColor,
                        size: AppSize.getSize(25),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Camera",
                      style: TextStyle(color: AppTheme.whiteColor),
                    ),
                  ],
                ),
              ),

              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  pickFromGallery(context);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.all(AppSize.getSize(14)),
                      decoration: BoxDecoration(
                        color: AppTheme.greenAccentShade700,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.photo,
                        color: AppTheme.blackColor,
                        size: AppSize.getSize(25),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Gallery",
                      style: TextStyle(color: AppTheme.whiteColor),
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
}
