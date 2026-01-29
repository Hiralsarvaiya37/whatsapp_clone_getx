import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone_getx/feature/auth/login/provider/login_provider.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/helper/l10n_ext.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class LoginScreen extends StatelessWidget {
  static const id = "/LoginScreen";
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<LoginProvider>();
    return Scaffold(
      backgroundColor: AppTheme.whiteColor,
      appBar: AppBar(
        backgroundColor: AppTheme.whiteColor,
        title: Text(context.l10n.phoneAuth),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSize.getSize(25)),
            child: TextField(
              controller: provider.phoneController,
              onChanged: (value) {
                provider.setLoading(false);
              },
              onTapOutside: (event) {
                FocusScope.of(context).unfocus();
              },
              decoration: InputDecoration(
                hintText: context.l10n.enterphonenumber,
                prefixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppSize.getSize(24)),
                ),
              ),
            ),
          ),

          SizedBox(height: AppSize.getSize(30)),

          provider.isLoading
              ? CircularProgressIndicator()
              : ElevatedButton(
                  onPressed: () {
                    provider.onVerifyNum(context);
                  },
                  child: Text(context.l10n.verifyphoneNumber),
                ),
        ],
      ),
    );
  }
}
