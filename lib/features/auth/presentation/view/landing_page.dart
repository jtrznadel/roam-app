import 'package:flutter/material.dart';
import 'package:montaa/core/constants/app_sizes.dart';
import 'package:montaa/core/extensions/context_extension.dart';
import 'package:montaa/gen/assets.gen.dart';
import 'package:montaa/gen/colors.gen.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.defaultPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Assets.svg.montaaLogo.svg(height: 100),
                Text(
                  "Welcome to Montaa",
                  style: context.textTheme.headlineMedium,
                ),
                const Text(
                  "Your personal assistant for managing your schedule and tasks.",
                  textAlign: TextAlign.center,
                ),
                Spacer(),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: context.textTheme.bodySmall?.copyWith(
                      color: AppColors.fontSecondary,
                    ),
                    children: [
                      const TextSpan(text: 'By signing in you agree to the\n'),
                      TextSpan(
                        text: 'Terms & Conditions',
                        style: context.textTheme.bodySmall,
                      ),
                      const TextSpan(text: ' and '),
                      TextSpan(
                        text: 'Privacy Policy',
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
    );
  }
}
