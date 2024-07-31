// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:graduation_project/core/config/theme.dart';
import 'package:graduation_project/core/widgets/widgets/wide_button.dart';
import 'package:graduation_project/features/auth/OTP/presentation/screens/login_screen.dart';
import 'package:graduation_project/features/auth/data/models/forget_password_cubit.dart';
import 'package:graduation_project/features/auth/data/models/forget_password_states.dart';
import 'package:graduation_project/features/auth/OTP/presentation/screens/set_new_password.dart';

// ignore: camel_case_types

// ignore: camel_case_types
class OTP_Screen extends StatelessWidget {
  final String email;
  OTP_Screen({
    super.key,
    required this.email,
  });
  final List<TextEditingController> otpControllers =
      List.generate(4, (index) => TextEditingController());
  final _forgetPasswordCubit = ForgetPasswordCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswordCubit(),
      child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordStates>(
        listener: (context, state) {
          String otp =
              otpControllers.map((controller) => controller.text).join();
          if (state is VerifyCodeSuccessState) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SetNewPassword(
                    email: email,
                    code: otp,
                  ),
                ));
          }
        },
        builder: (context, state) {
          return Scaffold(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              body: SafeArea(
                  child: SingleChildScrollView(
                child: Form(
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
                            Text('Verify Code ',
                                style:
                                    Theme.of(context).textTheme.headlineLarge),
                            Text('Please enter the code we just sent to email ',
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
                      //  Text('Email',
                      //  style:Theme.of(context).textTheme.titleLarge),
                      //   SizedBox(height: 7,),
                      //   TextFormField(
                      //     decoration: InputDecoration(
                      //      fillColor: Color.fromRGBO(230, 230, 230, 0.537),
                      //      filled: true,
                      //      hintText: 'example@gmail.com',
                      //      border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(20.0),
                      //       borderSide: BorderSide(
                      //         width: 4.0,
                      //         color: AppTheme.PrimaryLight
                      //         ),
                      //      )
                      //     //  errorText: 'Please enter your Email correctly  ',
                      //     ),
                      //   ),
                      const SizedBox(
                        height: 7,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              _forgetPasswordCubit.sendCode(email: email);
                            },
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                      text: 'Don’t receive OTP? ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium),
                                  const TextSpan(
                                    text: 'Resend code ',
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
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 38,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                          4,
                          (index) => Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                controller: otpControllers[index],
                                keyboardType: TextInputType.number,
                                maxLength: 1,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  fillColor: const Color(0xffF7F8F9),
                                  filled: true,
                                  counterText: '',
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: AppTheme.primaryLight,
                                      ),
                                      borderRadius: BorderRadius.circular(8)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: AppTheme.primaryLight,
                                      ),
                                      borderRadius: BorderRadius.circular(8)),
                                ),
                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    if (index >= 0) {
                                      FocusScope.of(context).nextFocus();
                                    }
                                  } else if (index <= 3) {
                                    FocusScope.of(context).previousFocus();
                                  }
                                },
                                onSubmitted: (value) {
                                  String otp = otpControllers
                                      .map((controller) => controller.text)
                                      .join();
                                  debugPrint(otp);
                                  if (otp.length == 4) {
                                    _forgetPasswordCubit.verifyCode(
                                        email: email, code: otp);
                                    // Toastt(
                                    //     message: "الكود صحيح", state: ToastStates.DORI);
                                    // ScaffoldMessenger.of(context)
                                    //     .showSnackBar(const SnackBar(
                                    //   content: Text("الكود صحيح"),
                                    // ));
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //       builder: (context) => ForgetPasswordScreen(
                                    //         email: widget.email,
                                    //       ),
                                    //     ));
                                  } else {
                                    // Toastt(
                                    //     message: 'برجاء ادخل رمز OTP صحيح',
                                    //     state: ToastStates.DORI);
                                    // ScaffoldMessenger.of(context).showSnackBar(
                                    //   const SnackBar(
                                    //     content: Text('برجاء ادخل رمز OTP صحيح'),
                                    //   ),
                                    // );
                                  }
                                  print(otpControllers);
                                  print('Entered OTP: $otp');
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 64,
                      ),
                      WideButton(
                          text: 'Verify',
                          onTap: () {
                            String otp = otpControllers
                                .map((controller) => controller.text)
                                .join();
                            // debugPrint(selectedDialogCountry.phoneCode);
                            if (otp.length == 4) {
                              try {
                                _forgetPasswordCubit.verifyCode(
                                    email: email, code: otp);
                                _showImageAlertDialog(context);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SetNewPassword(
                                        email: email,
                                        code: '',
                                      ),
                                    ));
                              } catch (e) {
                                print(e);
                              }
                            } else {
                              // Toastt(
                              //     message: 'برجاء ادخل رمز OTP صحيح',
                              //     state: ToastStates.DORI);
                              // ScaffoldMessenger.of(context).showSnackBar(
                              //   const SnackBar(
                              //     content: Text('برجاء ادخل رمز OTP صحيح'),
                              //   ),
                              // );
                            }
                            //  _showImageAlertDialog(context);
                          }),
                    ],
                  ),
                )),
              )));
        },
      ),
    );
  }

  void _showImageAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            width: 200,
            height: 300,
            decoration: ShapeDecoration(
              color: const Color(0xFFF9F9F9),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.asset(
                  'assets/images/Done.png', // Replace with your image path
                  width: 150, // Adjust image width as needed
                ),
                const SizedBox(height: 20),
                Text(
                  'Verified! ',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16), // Adjust spacing as needed
                Text('Your account has been verified successfully',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: AppTheme.grey)),
              ],
            ),
          ),
          actions: <Widget>[
            Center(
              child: Container(
                width: 141,
                height: 51,
                decoration: ShapeDecoration(
                  color: const Color(0xFFA5D6A7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: const SizedBox(
                      width: 111,
                      height: 39,
                      child: Text(
                        'Done\n',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          height: 0,
                          letterSpacing: -0.33,
                        ),
                      ),
                    )),
              ),
            )
          ],
        );
      },
    );
  }
}
