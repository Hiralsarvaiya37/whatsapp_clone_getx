import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone_getx/feature/auth/login/bloc/login_state.dart';
import 'package:whatsapp_clone_getx/feature/auth/otp/view/otp_screen.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState());

  final phoneController = TextEditingController();
  String verificationId = "";
   void onPhoneChanged() {
    emit(state.copywith(isLoading: false));
  }

  Future<void> onVerifyNum(BuildContext context) async {
    emit(state.copywith(isLoading: true));

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "+91${phoneController.text.trim()}",
      verificationCompleted: (PhoneAuthCredential credential) async {},
      verificationFailed: (FirebaseAuthException ex) {
        emit(state.copywith(isLoading: false));
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(ex.message ?? "Failed")));
      },
      codeSent: (String verifyId, int? resendToken) {
        emit(state.copywith(isLoading: false));
        verificationId = verifyId;
       Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpScreen(verificationId: verificationId)));
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}
