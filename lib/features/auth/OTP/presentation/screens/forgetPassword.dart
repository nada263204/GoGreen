// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/widgets/widgets/wide_button.dart';
import 'package:graduation_project/core/config/theme.dart';
import 'package:graduation_project/features/auth/OTP/presentation/screens/OTP_Screen.dart';
import 'package:graduation_project/features/auth/data/models/forget_password_cubit.dart';
import 'package:graduation_project/features/auth/data/models/forget_password_states.dart';

// ignore: camel_case_types
class forgetPassword_Screen extends StatefulWidget {
  const forgetPassword_Screen({super.key});

  @override
  State<forgetPassword_Screen> createState() => _forgetPassword_ScreenState();
}

// ignore: camel_case_types
class _forgetPassword_ScreenState extends State<forgetPassword_Screen> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _forgetPasswordCubit = ForgetPasswordCubit();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswordCubit(),
      child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordStates>(
        listener: (context, state) {
          if (state is SendCodeSuccessState) {
            // showToast(
            //   context: context,
            //   message: 'Code Sent',
            // );
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      OTP_Screen(email: _emailController.text.trim()),
                ));
          } else if (state is CheckEmailErrorState) {
            print('error');
          }
        },
        builder: (context, state) {
          return Scaffold(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              body: SafeArea(
                  child: SingleChildScrollView(
                child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 65,
                                ),
                                Text('Forget Password',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge),
                                Text('Enter your registered email below',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(color: AppTheme.grey)),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 33,
                          ),
                          Text('Email',
                              style: Theme.of(context).textTheme.titleLarge),
                          const SizedBox(
                            height: 7,
                          ),
                          TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                                fillColor:
                                    const Color.fromRGBO(230, 230, 230, 0.537),
                                filled: true,
                                hintText: 'example@gmail.com',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: BorderSide(
                                      width: 4.0, color: AppTheme.primaryLight),
                                )
                                //  errorText: 'Please enter your Email correctly  ',
                                ),
                          ),
                          const SizedBox(
                            height: 22,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                        text: 'remember your password ? ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium),
                                    const TextSpan(
                                      text: 'Sign in',
                                      style: TextStyle(
                                        color: Color(0xFFA5D6A7),
                                        fontSize: 16,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                    const TextSpan(
                                      text: ' ',
                                      style: TextStyle(
                                        color: Color(0xFF030303),
                                        fontSize: 16,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 64,
                          ),
                          WideButton(
                              text: 'Reset your Password',
                              onTap: () {
                                String email = _emailController.text.trim();

                                debugPrint(email);
                                if (_formKey.currentState!.validate()) {
                                  _forgetPasswordCubit.checkEmail(email: email);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          OTP_Screen(email: email),
                                    ),
                                  );
                                }
                              }),
                        ],
                      ),
                    )),
              )));
        },
      ),
    );
  }
}
