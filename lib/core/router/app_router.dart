import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:roam/core/dependency_injection/dependency_injection.dart';
import 'package:roam/core/router/app_router_refresh_listenable.dart';
import 'package:roam/features/auth/presentation/cubit/auth_session_cubit.dart';
import 'package:roam/features/auth/presentation/cubit/login_form_cubit.dart';
import 'package:roam/features/auth/presentation/view/bootstrap_page.dart';
import 'package:roam/features/auth/presentation/view/continue_with_email_page.dart';
import 'package:roam/features/auth/presentation/view/landing_page.dart';
import 'package:roam/features/auth/presentation/view/otp_page.dart';
import 'package:roam/features/main/presentation/view/main_page.dart';
import 'package:roam/generated/l10n.dart';

part 'app_router.g.dart';

class AppRouter {
  final AuthSessionCubit _authSessionCubit;

  AppRouter({required AuthSessionCubit authSessionCubit})
    : _authSessionCubit = authSessionCubit;

  late final GoRouter router = GoRouter(
    routes: $appRoutes,
    initialLocation: const BootstrapRoute().location,
    refreshListenable: AppRouterRefreshListenable(_authSessionCubit.stream),
    redirect: _redirect,
  );

  String? _redirect(BuildContext context, GoRouterState state) {
    final sessionState = _authSessionCubit.state;

    final isBootstrapping = sessionState.isBootstrapping;
    final isAuthenticated = sessionState.isAuthenticated;
    final isBootstrapRoute =
        state.matchedLocation == const BootstrapRoute().location;
    final isLoginRoute = state.matchedLocation.startsWith('/login');

    if (isBootstrapping) {
      if (isBootstrapRoute) {
        return null;
      }

      return const BootstrapRoute().location;
    }

    if (!isAuthenticated) {
      if (isLoginRoute) {
        return null;
      }

      return const LoginLandingRoute().location;
    }

    if (isBootstrapRoute || isLoginRoute) {
      return const HomeRoute().location;
    }

    return null;
  }
}

@TypedGoRoute<BootstrapRoute>(path: '/bootstrap')
class BootstrapRoute extends GoRouteData with $BootstrapRoute {
  const BootstrapRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const BootstrapPage();
  }
}

@TypedShellRoute<LoginShellRoute>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<LoginLandingRoute>(path: '/login/landing'),
    TypedGoRoute<ContinueWithEmailRoute>(path: '/login/email'),
    TypedGoRoute<OtpRoute>(path: '/login/otp'),
  ],
)
class LoginShellRoute extends ShellRouteData {
  const LoginShellRoute();

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return BlocProvider(create: (_) => sl<LoginFormCubit>(), child: navigator);
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

class LoginLandingRoute extends GoRouteData with $LoginLandingRoute {
  const LoginLandingRoute();

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
