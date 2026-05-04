import 'package:flutter/material.dart';
import 'package:roam/core/extensions/context_extension.dart';
import 'package:roam/gen/colors.gen.dart';

class AppButton extends StatelessWidget {
  static const _transitionDuration = Duration(milliseconds: 300);

  final VoidCallback? onPressed;
  final String text;
  final Widget? leading;
  final bool disabled;
  final bool isLoading;
  final Color backgroundColor;
  final Color textColor;

  const AppButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.disabled = false,
    this.isLoading = false,
    this.leading,
    this.backgroundColor = AppColors.fontPrimary,
    this.textColor = AppColors.white,
  });

  @override
  Widget build(BuildContext context) {
    final isDisabled = disabled || isLoading || onPressed == null;
    final targetBackgroundColor = isDisabled
        ? backgroundColor.withAlpha(20)
        : backgroundColor;
    final targetTextColor = isDisabled ? AppColors.fontSecondary : textColor;

    return SizedBox(
      width: double.infinity,
      child: TweenAnimationBuilder<Color?>(
        tween: ColorTween(end: targetBackgroundColor),
        duration: _transitionDuration,
        curve: Curves.easeOutCubic,
        builder: (context, animatedBackgroundColor, child) {
          return ElevatedButton(
            onPressed: isDisabled ? null : onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: animatedBackgroundColor,
              disabledBackgroundColor: animatedBackgroundColor,
              disabledForegroundColor: targetTextColor,
              elevation: 0,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            ),
            child: child,
          );
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: AnimatedSwitcher(
                duration: _transitionDuration,
                switchInCurve: Curves.easeOutCubic,
                switchOutCurve: Curves.easeOutCubic,
                child: isLoading
                    ? SizedBox(
                        key: const ValueKey('loading'),
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            targetTextColor,
                          ),
                        ),
                      )
                    : AnimatedDefaultTextStyle(
                        key: const ValueKey('label'),
                        duration: _transitionDuration,
                        curve: Curves.easeOutCubic,
                        style: context.textTheme.labelMedium!.copyWith(
                          color: targetTextColor,
                        ),
                        child: Text(text),
                      ),
              ),
            ),
            if (leading != null && !isLoading)
              Positioned(
                left: 0,
                child: AnimatedOpacity(
                  duration: _transitionDuration,
                  opacity: isDisabled ? 0.6 : 1,
                  child: leading!,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
