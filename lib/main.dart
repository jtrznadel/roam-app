import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:roam/core/dependency_injection/dependency_injection.dart';
import 'package:roam/core/theme/app_theme.dart';
import 'package:roam/flavors.dart';

import 'core/router/app_router.dart';
import 'generated/l10n.dart';

Future<void> main() async {
  await initDependencyInjections();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      locale: const Locale('en'),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: F.instance.appName,
      theme: AppTheme.defaultTheme,
    );
  }
}
