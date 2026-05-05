import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roam/core/extensions/context_extension.dart';
import 'package:roam/core/router/app_router.dart';
import 'package:roam/core/widgets/app_appbar.dart';
import 'package:roam/core/widgets/app_back_button.dart';
import 'package:roam/core/widgets/app_button.dart';
import 'package:roam/core/widgets/app_textfield.dart';
import 'package:roam/gen/colors.gen.dart';
import 'package:roam/generated/l10n.dart';

import '../cubit/login_form_cubit.dart';

class ContinueWithEmailPage extends StatelessWidget {
  const ContinueWithEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final (canSubmitEmail, isSubmitting, errorMessage) = context
        .select<LoginFormCubit, (bool, bool, String?)>(
          (cubit) => (
            cubit.state.canSubmitEmail,
            cubit.state.isSubmitting,
            cubit.state.error,
          ),
        );

    return BlocListener<LoginFormCubit, LoginFormState>(
      listenWhen: (previous, current) => previous.step != current.step,
      listener: (context, state) {
        if (state.step == LoginStep.otp) {
          const OtpRoute().push(context);
        }
      },
      child: Scaffold(
        appBar: CustomAppBar(leading: AppBackButton()),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).continueWithEmailHeadline,
                  style: context.textTheme.displayMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  S.of(context).continueWithEmailSubheadline,
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: AppColors.fontSecondary,
                  ),
                ),
                const SizedBox(height: 16),
                AppTextField(
                  label: 'Email',
                  onChanged: (value) {
                    context.read<LoginFormCubit>().updateEmail(value);
                  },
                  autoFocus: true,
                  keyboardType: TextInputType.emailAddress,
                  errorMessage: errorMessage,
                ),
                Spacer(),
                AppButton(
                  onPressed: canSubmitEmail
                      ? () {
                          context.read<LoginFormCubit>().requestEmailOtp();
                        }
                      : null,
                  text: S.of(context).continueLabel,
                  disabled: !canSubmitEmail,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
