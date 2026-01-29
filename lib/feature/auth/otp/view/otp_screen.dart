import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone_getx/feature/auth/otp/provider/otp_provider.dart';
import 'package:whatsapp_clone_getx/feature/splash/view/splash_screen.dart';
import 'package:whatsapp_clone_getx/utils/helper/l10n_ext.dart';

class OtpScreen extends StatelessWidget {
  static const id = "/OtpScreen";
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final otpProvider = context.read<OtpProvider>();
    final isLoading = context.watch<OtpProvider>().isLoading;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(context.l10n.oTPScreen),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              controller: otpProvider.otpController,
              onChanged: (value) {
                otpProvider.isLoading = false;
                otpProvider.resetLoading();
              },
              onTapOutside: (event) {
                FocusScope.of(context).unfocus();
              },
              decoration: InputDecoration(
                hintText: context.l10n.entertheOtp,
                prefixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
            ),
          ),
          SizedBox(height: 30),

          isLoading
              ? CircularProgressIndicator()
              : ElevatedButton(
                  onPressed: () async {
                    final success = await otpProvider.verifyOtp();
                    if (!context.mounted) return;

                    if (success) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SplashScreen()),
                      );
                    } else {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text("Invalid OTP")));
                    }
                  },
                  child: Text(context.l10n.oTP),
                ),
        ],
      ),
    );
  }
}
