import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/config/app_cubit/app_cubit.dart';
import 'package:graduation_project/core/widgets/loading_indicator.dart';
import 'package:graduation_project/features/auth/OTP/presentation/screens/forgetPassword.dart';
import 'package:graduation_project/Screens/home/nav_bar.dart';
import 'package:graduation_project/core/widgets/widgets/customTextFormField.dart';
import 'package:graduation_project/core/widgets/widgets/wide_button.dart';
import 'package:graduation_project/features/auth/data/models/login_data.dart';
import 'package:graduation_project/features/auth/OTP/presentation/cubit/auth_cubit.dart';
import 'package:graduation_project/features/auth/OTP/presentation/screens/signup_screen.dart';
import 'package:graduation_project/core/config/theme.dart';
import 'package:graduation_project/core/utils/validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late final AuthCubit _authCubit = AuthCubit();
  late AppCubit _appCubit;

  @override
  void initState() {
    super.initState();
    _appCubit = context.read<AppCubit>();
    _authCubit.checkLoggedInUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: BlocListener<AppCubit, AppState>(
                  bloc: _appCubit,
                  listener: (context, state) {
                    print(state);
                    if (state.authState is LoginLoading) {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) => const Center(
                          child: LoadingIndicator(),
                        ),
                      );
                    } else if (state.authState is LoginSuccess) {
                      Navigator.of(context, rootNavigator: true).pop();

                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => const NavBar()),
                      );
                    } else if (state.authState is LoginError) {
                      Navigator.of(context, rootNavigator: true).pop();
                      // Show error indicator
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Login failed. Please try again.'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Sign In',
                              style: TextStyle(
                                color: AppTheme.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 32,
                                fontFamily: 'Inter',
                              ),
                            ),
                            Text(
                              'Hi ! Welcome back, you’ve been missed ',
                              style: TextStyle(
                                color: AppTheme.grey,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                fontFamily: 'Inter',
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 33,
                      ),
                      const Text(
                        'Email',
                        style: TextStyle(
                          color: Color(0xFF131313),
                          fontSize: 20,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 0,
                          letterSpacing: -0.33,
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      DefaultTextFormField(
                        hintText: 'example@gmail.com',
                        controller: _emailController,
                        validator: (value) {
                          if (!Validator.isEmail(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      const Text(
                        'Password',
                        style: TextStyle(
                          color: Color(0xFF131313),
                          fontSize: 20,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 0,
                          letterSpacing: -0.33,
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      DefaultTextFormField(
                        hintText: 'Enter your password',
                        controller: _passwordController,
                        isPassword: true,
                        validator: (value) {
                          if (!Validator.isPassword(value)) {
                            return 'Password can’t be less than 6 characters';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(),
                            onPressed: () {},
                            child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const forgetPassword_Screen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                    color: AppTheme.primaryLight,
                                    decorationColor: const Color(0xFFA5D6A7),
                                    decoration: TextDecoration.underline,
                                  ),
                                )),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 26,
                      ),
                      WideButton(
                        text: 'Sign In',
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          if (_formKey.currentState?.validate() ?? false) {
                            _login();
                          }
                        },
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/Line 6.png'),
                          const SizedBox(width: 24),
                          Image.asset('assets/images/Or sign in with.png'),
                          const SizedBox(width: 24),
                          Image.asset('assets/images/Line 7.png'),
                        ],
                      ),
                      const SizedBox(
                        height: 44,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/Google.png'),
                          const SizedBox(width: 24),
                          Image.asset('assets/images/Facebook.png'),
                        ],
                      ),
                      const SizedBox(
                        height: 41,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Center(
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Don’t have an account ? ',
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
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const signupScreen(),
                                  ),
                                );
                              },
                              child: const Text(
                                'Sign up',
                                style: TextStyle(
                                  color: Color(0xFFA5D6A7),
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                  decorationColor: Color(0xFFA5D6A7),
                                  decoration: TextDecoration.underline,
                                  height: 0,
                                ),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _login() {
    _authCubit.login(
      LoginData(
        email: _emailController.text,
        password: _passwordController.text,
      ),
    );
    _appCubit.login(LoginData(
        email: _emailController.text, password: _passwordController.text));
  }
}
