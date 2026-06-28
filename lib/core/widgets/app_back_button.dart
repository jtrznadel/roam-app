import 'package:flutter/material.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:roam/gen/colors.gen.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: 45,
      child: GlassButton(
        onTap: () {
          Navigator.of(context).maybePop();
        },
        icon: const Icon(LucideIcons.chevronLeft, color: AppColors.fontPrimary),
      ),
    );

    //   IconButton(
    //   onPressed: () {
    //     Navigator.of(context).maybePop();
    //   },
    //   icon: Container(
    //     width: 45,
    //     height: 45,
    //     decoration: BoxDecoration(
    //       color: AppColors.surface,
    //       borderRadius: BorderRadius.circular(999),
    //     ),
    //     child: Center(
    //       child: Icon(
    //         LucideIcons.chevronLeft,
    //         size: 24,
    //         color: AppColors.fontPrimary,
    //       ),
    //     ),
    //   ),
    // );
  }
}
