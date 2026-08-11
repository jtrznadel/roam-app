import 'package:flutter/material.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:roam/core/extensions/context_extension.dart';
import 'package:roam/core/widgets/app_icon_button.dart';
import 'package:roam/gen/assets.gen.dart';
import 'package:roam/gen/colors.gen.dart';

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  static const preferredHeight = 56.0;

  final String nickname;
  final String userTitle;

  const DashboardAppBar({
    super.key,
    this.nickname = 'Alex',
    this.userTitle = 'The Explorer',
  });

  @override
  Widget build(BuildContext context) {
    return GlassAppBar(
      centerTitle: false,
      preferredSize: preferredSize,
      padding: const .symmetric(horizontal: 12),
      title: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundImage: AssetImage(Assets.png.deafaultAvatar.path),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisSize: .min,
              crossAxisAlignment: .start,
              children: [
                Text(
                  'Hi, $nickname',
                  maxLines: 1,
                  overflow: .ellipsis,
                  style: context.textTheme.titleMedium?.copyWith(
                    color: AppColors.fontPrimary,
                    fontWeight: .w700,
                  ),
                ),
                Text(
                  userTitle,
                  maxLines: 1,
                  overflow: .ellipsis,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: AppColors.fontSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        AppIconButton(icon: LucideIcons.search, onPressed: () {}),
        AppIconButton(icon: LucideIcons.bell, onPressed: () {}),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(preferredHeight);
}
