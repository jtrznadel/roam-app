import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';
import 'package:roam/core/extensions/context_extension.dart';
import 'package:roam/core/widgets/app_button.dart';
import 'package:roam/core/widgets/app_otp_field.dart';
import 'package:roam/core/widgets/app_scaffold.dart';
import 'package:roam/features/auth/presentation/cubit/auth_session_cubit.dart';
import 'package:roam/gen/colors.gen.dart';
import 'package:roam/generated/l10n.dart';

import '../../../../core/widgets/app_back_button.dart';
import '../cubit/login_form_cubit.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final (
      canSubmitOtp,
      canResendOtp,
      resendSecondsLeft,
      isSubmitting,
      errorMessage,
    ) = context.select<LoginFormCubit, (bool, bool, int, bool, String?)>(
      (cubit) => (
        cubit.state.canSubmitOtp,
        cubit.state.canResendOtp,
        cubit.state.resendSecondsLeft,
        cubit.state.isSubmitting,
        cubit.state.error,
      ),
    );

    return BlocListener<LoginFormCubit, LoginFormState>(
      listenWhen: (previous, current) =>
          previous.verifiedSession != current.verifiedSession &&
          current.verifiedSession != null,
      listener: (context, state) {
        final session = state.verifiedSession;
        if (session == null) {
          return;
        }

        context.read<AuthSessionCubit>().establishSession(session);
        context.read<LoginFormCubit>().clearVerifiedSession();
      },
      child: AppScaffold(
        backgroundColor: AppColors.background,
        appBar: GlassAppBar(leading: AppBackButton()),
        body: SafeArea(
          child: Padding(
            padding: .fromLTRB(16, 50, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).otpHeadline,
                  style: context.textTheme.displayMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  S
                      .of(context)
                      .otpSubheadline(
                        context.read<LoginFormCubit>().state.otpEmail,
                      ),
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: AppColors.fontSecondary,
                  ),
                ),
                const SizedBox(height: 16),
                AppOtpField(
                  label: 'Code',
                  onChanged: (value) {
                    final cubit = context.read<LoginFormCubit>();
                    cubit.updateOtp(value);

                    if (value.length == 6) {
                      cubit.submitOtp();
                    }
                  },
                  autoFocus: true,
                  enabled: !isSubmitting,
                  errorMessage: errorMessage,
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: canResendOtp
                      ? () {
                          context.read<LoginFormCubit>().resendOtp();
                        }
                      : null,
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    minimumSize: const Size(0, 32),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    foregroundColor: AppColors.fontSecondary,
                  ),
                  child: Text(
                    canResendOtp
                        ? S.of(context).otpResend
                        : S.of(context).otpResendTimer(resendSecondsLeft),
                    style: context.textTheme.labelMedium?.copyWith(
                      color: canResendOtp
                          ? AppColors.fontSecondary
                          : isSubmitting
                          ? AppColors.fontSecondary.withAlpha(120)
                          : AppColors.fontSecondary.withAlpha(160),
                    ),
                  ),
                ),
                const Spacer(),
                AppButton(
                  onPressed: canSubmitOtp
                      ? () {
                          context.read<LoginFormCubit>().submitOtp();
                        }
                      : null,
                  text: S.of(context).continueLabel,
                  disabled: !canSubmitOtp,
                  isLoading: isSubmitting,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
