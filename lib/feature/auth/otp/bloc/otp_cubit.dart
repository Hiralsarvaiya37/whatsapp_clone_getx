import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone_getx/feature/auth/otp/bloc/otp_state.dart';
import 'package:whatsapp_clone_getx/feature/splash/view/splash_screen.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit({required this.verificationId}) : super(OtpState());

  final String verificationId;
  final otpController = TextEditingController();

  void onOtpChanged() {
    emit(state.copyWith(isLoading: false));
  }

  Future<void> onOtpPress(BuildContext context) async {
    try {
      emit(state.copyWith(isLoading: true));

      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otpController.text.trim(),
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      if (!context.mounted) return;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SplashScreen()),
      );
    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(isLoading: false));
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.message ?? "Invalid OTP")));
    }
  }
}
