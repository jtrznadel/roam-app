import 'package:flutter/material.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:roam/core/extensions/context_extension.dart';
import 'package:roam/core/widgets/app_icon_button.dart';
import 'package:roam/core/widgets/app_scaffold.dart';
import 'package:roam/gen/assets.gen.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const _avatarScale = 1.8;
  static const _avatarRightBleed = 0.3;
  static const _avatarBottomBleed = 0.02;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final avatarSize = constraints.biggest.shortestSide * _avatarScale;

        return AppScaffold(
          backgroundColor: Colors.transparent,
          extendBody: false,
          appBar: GlassAppBar(
            actions: [
              AppIconButton(icon: LucideIcons.share2, onPressed: () {}),
              AppIconButton(icon: LucideIcons.settings, onPressed: () {}),
            ],
          ),
          body: ClipRect(
            child: SizedBox.expand(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Positioned(
                    right: -avatarSize * _avatarRightBleed,
                    bottom: -avatarSize * _avatarBottomBleed,
                    width: avatarSize,
                    height: avatarSize,
                    child: Image.asset(
                      Assets.png.deafaultAvatar.path,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Profile', style: context.textTheme.headlineLarge),
                        const SizedBox(height: 16),
                        Text(
                          'This is the profile page.',
                          style: context.textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
