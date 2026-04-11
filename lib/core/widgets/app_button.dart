import 'package:flutter/material.dart';
import 'package:roam/core/extensions/context_extension.dart';
import 'package:roam/gen/colors.gen.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Widget? leading;

  const AppButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Center(child: Text(text, style: context.textTheme.labelMedium)),
            if (leading != null) Positioned(left: 0, child: leading!),
          ],
        ),
      ),
    );
  }
}
