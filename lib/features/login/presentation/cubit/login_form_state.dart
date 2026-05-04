part of 'login_form_cubit.dart';

enum LoginStep { email, otp }

enum LoginStatus { idle, submitting, success, error }

@freezed
abstract class LoginFormState with _$LoginFormState {
  const factory LoginFormState({
    @Default('') String email,
    @Default('') String otp,
    @Default('') String otpEmail,
    @Default(0) int resendSecondsLeft,
    @Default(LoginStep.email) LoginStep step,
    @Default(LoginStatus.idle) LoginStatus status,
    String? error,
  }) = _LoginFormState;

  const LoginFormState._();

  bool get isSubmitting => status == LoginStatus.submitting;

  bool get isEmailValid => email.trim().isNotEmpty && email.contains('@');
  bool get isOtpValid => otp.length == 6;
  bool get isResendBlocked => resendSecondsLeft > 0;
  bool get canResendOtp =>
      otpEmail.isNotEmpty && !isSubmitting && !isResendBlocked;

  bool get canSubmitEmail => isEmailValid && !isSubmitting;
  bool get canSubmitOtp => isOtpValid && !isSubmitting;
}
