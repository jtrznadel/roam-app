import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:marmot/generated/l10n.dart';

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
    final destinations = [
      NavigationDestination(
        icon: const Icon(LucideIcons.house),
        label: S.of(context).homeTabLabel,
      ),
      NavigationDestination(
        icon: const Icon(LucideIcons.mapPin),
        label: S.of(context).mapTabLabel,
      ),
      NavigationDestination(
        icon: const Icon(LucideIcons.mountain),
        label: S.of(context).peaksTabLabel,
      ),
      NavigationDestination(
        icon: const Icon(LucideIcons.user),
        label: S.of(context).profileTabLabel,
      ),
    ];

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: _onTap,
        destinations: destinations,
      ),
    );
  }
}
