import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_form_cubit.freezed.dart';
part 'login_form_state.dart';

class LoginFormCubit extends Cubit<LoginFormState> {
  static const int _resendCooldownSeconds = 60;

  Timer? _resendTimer;

  LoginFormCubit() : super(const LoginFormState());

  void updateEmail(String value) {
    emit(state.copyWith(email: value));
  }

  void updateOtp(String value) {
    emit(state.copyWith(otp: value));
  }

  Future<void> submitEmail() async {
    if (!state.canSubmitEmail) {
      return;
    }

    final normalizedEmail = state.email.trim().toLowerCase();

    emit(state.copyWith(status: LoginStatus.submitting, error: null));

    return Future.delayed(const Duration(seconds: 2)).then((_) {
      emit(
        state.copyWith(
          status: LoginStatus.idle,
          step: LoginStep.otp,
          otp: '',
          otpEmail: normalizedEmail,
        ),
      );
      _startResendCooldown();
    });
  }

  Future<void> submitOtp() async {
    if (!state.canSubmitOtp) {
      return;
    }

    emit(state.copyWith(status: LoginStatus.submitting));

    return Future.delayed(const Duration(seconds: 2)).then((_) {
      emit(state.copyWith(status: LoginStatus.success));
    });
  }

  Future<void> resendOtp() async {
    if (!state.canResendOtp) {
      return;
    }
  }

  void clearError() {
    emit(state.copyWith(error: null));
  }

  void resetOtp() {
    emit(state.copyWith(otp: ''));
  }

  void _startResendCooldown() {
    _resendTimer?.cancel();
    emit(state.copyWith(resendSecondsLeft: _resendCooldownSeconds));

    _resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final nextSeconds = state.resendSecondsLeft - 1;

      if (nextSeconds <= 0) {
        timer.cancel();
        emit(state.copyWith(resendSecondsLeft: 0));
        return;
      }

      emit(state.copyWith(resendSecondsLeft: nextSeconds));
    });
  }

  @override
  Future<void> close() {
    _resendTimer?.cancel();
    return super.close();
  }
}
