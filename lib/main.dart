import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:roam/core/config/app_config.dart';
import 'package:roam/core/dependency_injection/dependency_injection.dart';
import 'package:roam/core/theme/app_theme.dart';

import 'core/router/app_router.dart';
import 'features/auth/presentation/cubit/auth_session_cubit.dart';
import 'generated/l10n.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencyInjections();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<AuthSessionCubit>()..bootstrap(),
      child: MaterialApp.router(
        routerConfig: sl<AppRouter>().router,
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
