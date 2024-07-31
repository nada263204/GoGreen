abstract class ForgetPasswordStates {}

class InitialForgetPasswordState extends ForgetPasswordStates {}

class ChangePasswordIconState extends ForgetPasswordStates {}

// Check email

class CheckEmailLoadingState extends ForgetPasswordStates {}

class CheckEmailErrorState extends ForgetPasswordStates {
  final String message;

  CheckEmailErrorState({required this.message});
}

// Send Verfication Code

class SendCodeSuccessState extends ForgetPasswordStates {}

class SendCodeErrorState extends ForgetPasswordStates {}

// Verify Code
class VerifyCodeLoadingState extends ForgetPasswordStates {}

class VerifyCodeSuccessState extends ForgetPasswordStates {}

class VerifyCodeErrorState extends ForgetPasswordStates {}

// Reset Password
class ResetPasswordLoadingState extends ForgetPasswordStates {}

class ResetPasswordSuccessState extends ForgetPasswordStates {}

class ResetPasswordErrorState extends ForgetPasswordStates {}

////////////////////////////////////////////////////////////////
