import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:roam/features/auth/presentation/view/continue_with_email_page.dart';
import 'package:roam/features/auth/presentation/view/landing_page.dart';
import 'package:roam/features/auth/presentation/view/otp_page.dart';
import 'package:roam/generated/l10n.dart';

import '../../features/main/presentation/view/main_page.dart';

part 'app_router.g.dart';

final GoRouter appRouter = GoRouter(
  routes: $appRoutes,
  initialLocation: const AuthLandingRoute().location,
);

@TypedShellRoute<AuthShellRoute>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<AuthLandingRoute>(path: '/auth/landing'),
    TypedGoRoute<ContinueWithEmailRoute>(path: '/auth/email'),
    TypedGoRoute<OtpRoute>(path: '/auth/otp'),
  ],
)
class AuthShellRoute extends ShellRouteData {
  const AuthShellRoute();

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return navigator;
  }
}

@TypedStatefulShellRoute<AppShellRoute>(
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
class AppShellRoute extends StatefulShellRouteData {
  const AppShellRoute();

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

class AuthLandingRoute extends GoRouteData with $AuthLandingRoute {
  const AuthLandingRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LandingPage();
  }
}

class ContinueWithEmailRoute extends GoRouteData with $ContinueWithEmailRoute {
  const ContinueWithEmailRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ContinueWithEmailPage();
  }
}

class OtpRoute extends GoRouteData with $OtpRoute {
  const OtpRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const OtpPage();
  }
}
