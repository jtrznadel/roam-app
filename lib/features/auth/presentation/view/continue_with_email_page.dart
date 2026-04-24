import 'package:flutter/material.dart';
import 'package:roam/core/extensions/context_extension.dart';
import 'package:roam/core/router/app_router.dart';
import 'package:roam/core/widgets/app_appbar.dart';
import 'package:roam/core/widgets/app_back_button.dart';
import 'package:roam/core/widgets/app_button.dart';
import 'package:roam/core/widgets/app_textfield.dart';
import 'package:roam/gen/colors.gen.dart';
import 'package:roam/generated/l10n.dart';

class ContinueWithEmailPage extends StatelessWidget {
  const ContinueWithEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                style: context.textTheme.labelLarge?.copyWith(
                  color: AppColors.fontSecondary,
                ),
              ),
              const SizedBox(height: 16),
              AppTextField(label: 'Email', onChanged: () {}, autoFocus: true),
              Spacer(),
              AppButton(
                onPressed: () => const OtpRoute().push(context),
                text: S.of(context).send,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
