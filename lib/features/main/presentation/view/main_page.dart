import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:roam/core/extensions/context_extension.dart';
import 'package:roam/gen/assets.gen.dart';
import 'package:roam/gen/colors.gen.dart';

class MainPage extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainPage({super.key, required this.navigationShell});

  void _onTap(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final tabs = [
      GlassTab(
        icon: const Icon(LucideIcons.house),
        // label: S.of(context).homeTabLabel,
      ),
      GlassTab(
        icon: const Icon(LucideIcons.map),
        // label: S.of(context).mapTabLabel,
      ),
      GlassTab(
        icon: const Icon(LucideIcons.bookOpenCheck),
        // label: S.of(context).peaksTabLabel,
      ),
      GlassTab(
        icon: const Icon(LucideIcons.user),
        // label: S.of(context).profileTabLabel,
      ),
    ];

    return Scaffold(
      extendBody: true,
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.png.roamGradient.path),
            fit: BoxFit.cover,
          ),
        ),
        child: SizedBox.expand(child: navigationShell),
      ),
      bottomNavigationBar: GlassTabBar.bottom(
        tabs: tabs,
        selectedIndex: navigationShell.currentIndex,
        onTabSelected: _onTap,
        textStyle: context.textTheme.labelSmall?.copyWith(
          color: AppColors.fontSecondary,
        ),
        selectedLabelStyle: context.textTheme.labelSmall?.copyWith(
          color: AppColors.fontPrimary,
        ),
        unselectedIconColor: AppColors.fontSecondary,
        selectedIconColor: AppColors.fontPrimary,
        extraButton: GlassBottomBarExtraButton(
          icon: const Icon(LucideIcons.radar),
          onTap: () {},
          iconColor: AppColors.fontPrimary,
          label: '',
        ),
      ),
    );
  }
}
