// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:graduation_project/core/config/theme.dart';
import 'package:graduation_project/core/widgets/widgets/customTextFormField.dart';
import 'package:graduation_project/core/widgets/widgets/wide_button.dart';
import 'package:graduation_project/features/auth/OTP/presentation/screens/login_screen.dart';
import 'package:graduation_project/features/auth/data/models/forget_password_cubit.dart';
import 'package:graduation_project/features/auth/data/models/forget_password_states.dart';

// ignore: must_be_immutable
class SetNewPassword extends StatelessWidget {
  SetNewPassword({
    super.key,
    required this.email,
    required this.code,
  });
  final String email;
  final String code;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswordCubit(),
      child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordStates>(
        listener: (context, state) {
          if (state is ResetPasswordSuccessState) {
            showCustomBottomSheet(context);
          }
        },
        builder: (context, state) {
          var cubit = ForgetPasswordCubit.get(context);
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_outlined,
                    size: 20,
                  )),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0).copyWith(top: 0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 45,
                    ),
                    DefaultTextFormField(
                        isPassword: true,
                        controller: _passwordController,
                        hintText: 'New Password',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password must not be empty';
                          }
                          if (value.length < 8) {
                            return 'Password must be at least 8 characters long';
                          }
                          return null;
                        }),
                    const SizedBox(
                      height: 25,
                    ),
                    DefaultTextFormField(
                      isPassword: true,
                      controller: _passwordConfirmController,
                      hintText: 'New Password',
                      validator: (value) {
                        if (value != _passwordController.text) {
                          return '';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    WideButton(
                      onTap: () {
                        // debugPrint(selectedDialogCountry.phoneCode);
                        if (formKey.currentState!.validate()) {
                          cubit.resetPassword(
                            email: email,
                            code: code,
                            newPassword: _passwordController.text.trim(),
                          );
                        }
                      },
                      text: 'Reset Password',
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  showCustomBottomSheet(context) {
    return showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      elevation: 10,
      // clipBehavior: Clip.hardEdge,
      builder: (context) => Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppTheme.primaryLight)),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            // SvgPicture.asset(ImagesAssets.like),
            const SizedBox(
              height: 25,
            ),
            const Text(
              'Password has been Changed Successfully.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Return to the login screen to enter the application',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                      (route) => false);
                },
                child: const Text('return to login screen')),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
