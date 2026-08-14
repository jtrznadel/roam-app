import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';
import 'package:roam/core/config/app_config.dart';
import 'package:roam/core/di/dependency_injection.dart';
import 'package:roam/core/theme/app_theme.dart';

import 'core/router/app_router.dart';
import 'features/auth/presentation/cubit/auth_session_cubit.dart';
import 'generated/l10n.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LiquidGlassWidgets.initialize();
  await initDependencyInjections();

  runApp(LiquidGlassWidgets.wrap(child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final AuthSessionCubit _authSessionCubit = sl<AuthSessionCubit>();
  late final GoRouter _router = sl<AppRouter>().router;

  @override
  void initState() {
    super.initState();
    _authSessionCubit.bootstrap();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _authSessionCubit,
      child: MaterialApp.router(
        routerConfig: _router,
        locale: const Locale('en'),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        title: AppConfig.instance.title,
        theme: AppTheme.defaultTheme,
        debugShowCheckedModeBanner: AppConfig.instance.showDevBanner,
      ),
    );
  }
}
