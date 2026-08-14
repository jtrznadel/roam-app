import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:roam/core/error/failure.dart';
import 'package:roam/features/auth/domain/entities/auth_session_entity.dart';
import 'package:roam/features/auth/domain/usecases/request_email_otp_usecase.dart';
import 'package:roam/features/auth/domain/usecases/verify_email_otp_usecase.dart';

part 'login_form_cubit.freezed.dart';
part 'login_form_state.dart';

class LoginFormCubit extends Cubit<LoginFormState> {
  final RequestEmailOtpUseCase _requestEmailOtpUseCase;
  final VerifyEmailOtpUseCase _verifyEmailOtpUseCase;

  LoginFormCubit({
    required this._requestEmailOtpUseCase,
    required this._verifyEmailOtpUseCase,
  }) : super(const LoginFormState());

  static const int _resendCooldownSeconds = 60;
  Timer? _resendTimer;

  void updateEmail(String value) {
    emit(state.copyWith(email: value));
  }

  void updateOtp(String value) {
    emit(state.copyWith(otp: value));
  }

  Future<void> requestEmailOtp() async {
    if (!state.canSubmitEmail) {
      return;
    }

    final normalizedEmail = state.email.trim().toLowerCase();

    emit(state.copyWith(status: LoginStatus.submitting, error: null));

    final result = await _requestEmailOtpUseCase(
      RequestEmailOtpParams(email: normalizedEmail),
    );

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            status: LoginStatus.error,
            error: _mapFailureToMessage(failure),
          ),
        );
        _startResendCooldown();
      },
      (_) {
        emit(
          state.copyWith(
            status: LoginStatus.idle,
            step: LoginStep.otp,
            otpEmail: normalizedEmail,
          ),
        );
      },
    );
  }

  Future<void> submitOtp() async {
    if (!state.canSubmitOtp) {
      return;
    }

    emit(state.copyWith(status: LoginStatus.submitting));

    final result = await _verifyEmailOtpUseCase(
      VerifyEmailOtpParams(
        email: state.otpEmail,
        otpCode: state.otp,
        deviceId: 'temp',
        deviceName: 'temp',
      ),
    );

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            status: LoginStatus.error,
            error: _mapFailureToMessage(failure),
          ),
        );
      },
      (session) {
        emit(
          state.copyWith(status: LoginStatus.success, verifiedSession: session),
        );
      },
    );
  }

  Future<void> resendOtp() async {
    if (!state.canResendOtp) {
      return;
    }

    emit(state.copyWith(status: LoginStatus.submitting, error: null));

    final result = await _requestEmailOtpUseCase(
      RequestEmailOtpParams(email: state.otpEmail),
    );

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            status: LoginStatus.error,
            error: _mapFailureToMessage(failure),
          ),
        );
      },
      (_) {
        emit(state.copyWith(status: LoginStatus.idle, error: null));
        _startResendCooldown();
      },
    );
  }

  void clearError() {
    emit(state.copyWith(error: null));
  }

  void resetOtp() {
    emit(state.copyWith(otp: ''));
  }

  String _mapFailureToMessage(Failure failure) {
    return failure.when(
      serverError: (message, _) => message ?? 'Server error occurred.',
      connectionError: (message) => message ?? 'Connection error occurred.',
      offlineError: () => 'No internet connection.',
      authenticationError: (message, _) => message ?? 'Authentication failed.',
      cancelError: () => 'Request was cancelled.',
      validationError: (message, _) => message ?? 'Invalid data provided.',
      generalError: (message, _) => message ?? 'Something went wrong.',
    );
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

  void clearVerifiedSession() {
    emit(state.copyWith(verifiedSession: null, status: LoginStatus.idle));
  }

  @override
  Future<void> close() {
    _resendTimer?.cancel();
    return super.close();
  }
}
