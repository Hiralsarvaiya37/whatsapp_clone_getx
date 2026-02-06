import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone_getx/feature/auth/otp/bloc/otp_cubit.dart';
import 'package:whatsapp_clone_getx/feature/auth/otp/bloc/otp_state.dart';
import 'package:whatsapp_clone_getx/utils/helper/l10n_ext.dart';

class OtpScreen extends StatelessWidget {
  static const id = "/OtpScreen";
  final String verificationId;
  const OtpScreen({super.key, required this.verificationId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OtpCubit(verificationId: verificationId),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(context.l10n.oTPScreen),
          centerTitle: true,
        ),
        body: BlocBuilder<OtpCubit, OtpState>(builder:( context, state){
          final cubit = context.read<OtpCubit>();
           return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                controller: cubit.otpController,
                onChanged: (_) => cubit.onOtpChanged(),
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
           
                 state.isLoading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () async {
                        cubit.onOtpPress(context);
                      },
                      child: Text(context.l10n.oTP),
                    ),
         
          ],
        );
        
        }),

      ),
    );
  }
}
