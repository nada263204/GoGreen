import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/Screens/home/nav_bar.dart';
import 'package:graduation_project/core/config/app_cubit/app_cubit.dart';
import 'package:graduation_project/core/widgets/loading_indicator.dart';
import 'package:graduation_project/core/widgets/widgets/customTextFormField.dart';
import 'package:graduation_project/core/widgets/widgets/wide_button.dart';
import 'package:graduation_project/features/auth/data/models/register_data.dart';
import 'package:graduation_project/features/auth/OTP/presentation/cubit/auth_cubit.dart';
import 'package:graduation_project/features/auth/OTP/presentation/screens/login_screen.dart';
import 'package:graduation_project/core/config/theme.dart';
import 'package:graduation_project/core/utils/validator.dart';

// ignore: camel_case_types
class signupScreen extends StatefulWidget {
  const signupScreen({super.key});

  @override
  State<signupScreen> createState() => _signupScreenState();
}

class _signupScreenState extends State<signupScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late final AuthCubit _authCubit = AuthCubit();
  late AppCubit _appCubit;

  @override
  void initState() {
    super.initState();
    _appCubit = context.read<AppCubit>();
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
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: BlocListener<AppCubit, AppState>(
                          bloc: _appCubit,
                          listener: (context, state) {
                            if (state.authState is RegisterLoading) {
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) => const Center(
                                  child: LoadingIndicator(),
                                ),
                              );
                            } else if (state.authState is RegisterSuccess) {
                              Navigator.of(context, rootNavigator: true).pop();

                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const NavBar(),
                                ),
                              );
                            } else if (state.authState is RegisterError) {
                              Navigator.of(context, rootNavigator: true).pop();
                              // Show error indicator
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text('Login failed. Please try again.'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Create Account',
                                style: TextStyle(
                                  color: AppTheme.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 32,
                                  fontFamily: 'Inter',
                                ),
                              ),
                              Text(
                                'Fill your information below or register with your social account ',
                                textAlign: TextAlign.center,
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
                      ),
                      const SizedBox(
                        height: 33,
                      ),
                      const Text(
                        'Name',
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
                        hintText: 'ex:mariam',
                        controller: _nameController,
                        validator: (value) {
                          if (!Validator.hasMinLength(
                            value,
                            minLength: 3,
                          )) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 7,
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
                        'Phone number',
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
                        hintText: '01********',
                        controller: _phoneController,
                        validator: (value) {
                          if (!Validator.isEGPhoneNumber(value)) {
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
                        hintText: '**********',
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
                        height: 7,
                      ),
                      const Text(
                        'Confirm Password',
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
                        hintText: '**********',
                        controller: _confirmpasswordController,
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
                      const SizedBox(
                        height: 26,
                      ),
                      WideButton(
                        text: 'Create an Account',
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          if (_formKey.currentState?.validate() ?? false) {
                            _register();
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
                          const SizedBox(
                            width: 24,
                          ),
                          Image.asset('assets/images/Or sign in with.png'),
                          const SizedBox(
                            width: 24,
                          ),
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
                                    text: 'Already have an account ? ',
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
                                    builder: (context) => const LoginScreen(),
                                  ),
                                );
                              },
                              child: const Text(
                                'Sign in',
                                style: TextStyle(
                                  color: Color(0xFFA5D6A7),
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Color(0xFFA5D6A7),
                                  height: 0,
                                ),
                              ))
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

  void _register() {
    _authCubit.register(
      RegisterData(
        email: _emailController.text,
        password: _passwordController.text,
        name: _nameController.text,
        phoneNumber: _phoneController.text,
        rePassword: _confirmpasswordController.text,
      ),
    );
    _appCubit.register(RegisterData(
      name: _nameController.text,
      email: _emailController.text,
      phoneNumber: _phoneController.text,
      password: _passwordController.text,
      rePassword: _confirmpasswordController.text,
    ));
  }
}
