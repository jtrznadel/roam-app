import 'package:flutter/material.dart';
import 'package:roam/core/constants/app_sizes.dart';
import 'package:roam/core/extensions/context_extension.dart';
import 'package:roam/core/widgets/app_button.dart';
import 'package:roam/gen/assets.gen.dart';
import 'package:roam/gen/colors.gen.dart';
import 'package:roam/generated/l10n.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.png.roamLandingBg.path),
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.defaultPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Assets.svg.roamLogo.svg(
                    height: 60,
                    colorFilter: ColorFilter.mode(
                      AppColors.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                  Text(
                    S.of(context).landingPageTitle,
                    style: context.textTheme.labelLarge,
                  ),
                  Spacer(),
                  AppButton(
                    onPressed: () {},
                    text: S.of(context).continueWithApple,
                    leading: Assets.svg.appleLogo.svg(height: 20),
                  ),
                  const SizedBox(height: 4),
                  AppButton(
                    onPressed: () {},
                    text: S.of(context).continueWithGoogle,
                    leading: Assets.svg.googleLogo.svg(height: 20),
                  ),
                  const SizedBox(height: 4),
                  AppButton(
                    onPressed: () {},
                    text: S.of(context).continueWithEmail,
                  ),
                  const SizedBox(height: 12),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: context.textTheme.bodySmall?.copyWith(
                        color: AppColors.fontSecondary,
                      ),
                      children: [
                        TextSpan(text: S.of(context).landingTermsText),
                        TextSpan(
                          text: S.of(context).terms,
                          style: context.textTheme.bodySmall,
                        ),
                        TextSpan(text: S.of(context).and),
                        TextSpan(
                          text: S.of(context).privacyPolicy,
                          style: context.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
