import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:montaa/features/main/presentation/view/main_page.dart';
import 'package:montaa/generated/l10n.dart';

part 'app_router.g.dart';

final GoRouter appRouter = GoRouter(
  routes: $appRoutes,
  initialLocation: const HomeRoute().location,
);

@TypedStatefulShellRoute<RootBranch>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    TypedStatefulShellBranch<HomeTabBranchData>(
      routes: <TypedRoute<RouteData>>[TypedGoRoute<HomeRoute>(path: '/home')],
    ),
    TypedStatefulShellBranch<MapTabBranchData>(
      routes: <TypedRoute<RouteData>>[TypedGoRoute<MapRoute>(path: '/map')],
    ),
    TypedStatefulShellBranch<PeaksTabBranchData>(
      routes: <TypedRoute<RouteData>>[TypedGoRoute<PeaksRoute>(path: '/peaks')],
    ),
    TypedStatefulShellBranch<ProfileTabBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<ProfileRoute>(path: '/profile'),
      ],
    ),
  ],
)
class RootBranch extends StatefulShellRouteData {
  const RootBranch();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) => MainPage(navigationShell: navigationShell);
}

class HomeTabBranchData extends StatefulShellBranchData {
  const HomeTabBranchData();
}

class MapTabBranchData extends StatefulShellBranchData {
  const MapTabBranchData();
}

class PeaksTabBranchData extends StatefulShellBranchData {
  const PeaksTabBranchData();
}

class ProfileTabBranchData extends StatefulShellBranchData {
  const ProfileTabBranchData();
}

class HomeRoute extends GoRouteData with $HomeRoute {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Center(child: Text(S.of(context).homeTabLabel));
  }
}

class MapRoute extends GoRouteData with $MapRoute {
  const MapRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Center(child: Text(S.of(context).mapTabLabel));
  }
}

class PeaksRoute extends GoRouteData with $PeaksRoute {
  const PeaksRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Center(child: Text(S.of(context).peaksTabLabel));
  }
}

class ProfileRoute extends GoRouteData with $ProfileRoute {
  const ProfileRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Center(child: Text(S.of(context).profileTabLabel));
  }
}
