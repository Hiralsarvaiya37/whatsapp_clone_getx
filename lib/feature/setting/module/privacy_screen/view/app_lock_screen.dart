import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/bloc/privacy_bloc.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/bloc/privacy_event.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/bloc/privacy_state.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class AppLockScreen extends StatelessWidget {
  static const id = "/AppLockScreen";
  const AppLockScreen({super.key});

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
          "App lock",
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Unlock with biometric",
                    style: TextStyle(
                      color: AppTheme.whiteColor,
                      fontSize: AppSize.getSize(18),
                    ),
                  ),
                  Text(
                    "When enabled, you'll need to use fingerprint, face or other unique identifiers to open WhatsApp. You can still answer calls if WhatsApp is locked.",
                    style: TextStyle(
                      color: AppTheme.greyShade400,
                      fontSize: AppSize.getSize(16),
                    ),
                  ),
                ],
              ),
            ),
            BlocBuilder<PrivacyBloc, PrivacyState>(
              builder: (context, state) {
                return Switch(
                  value: state.isOn,
                  activeThumbColor: AppTheme.blackColor,
                  activeTrackColor: AppTheme.greenAccentShade700,
                  inactiveTrackColor: AppTheme.blackColor,
                  onChanged: (val) {
                    context.read<PrivacyBloc>().add(ToggleIsOn(val));
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
