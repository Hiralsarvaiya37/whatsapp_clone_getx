import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone_getx/feature/auth/login/bloc/login_cubit.dart';
import 'package:whatsapp_clone_getx/feature/auth/login/bloc/login_state.dart';
import 'package:whatsapp_clone_getx/utils/helper/l10n_ext.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class LoginScreen extends StatelessWidget {
  static const id = "/LoginScreen";
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(),
      child: Scaffold(
        backgroundColor: AppTheme.whiteColor,
        appBar: AppBar(
          backgroundColor: AppTheme.whiteColor,
          title: Text(context.l10n.phoneAuth),
          centerTitle: true,
        ),
        body: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            final cubit = context.read<LoginCubit>();

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    controller: cubit.phoneController,
                    onChanged: (_) {
                      cubit.onPhoneChanged();
                    },
                    decoration: InputDecoration(
                      hintText: context.l10n.enterphonenumber,
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
                        onPressed: () {
                          cubit.onVerifyNum(context);
                        },
                        child: Text(context.l10n.verifyphoneNumber),
                      ),
              ],
            );
          },
        ),
      ),
    );
  }
}
