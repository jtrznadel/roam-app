import 'package:roam/core/config/app_config.dart';

import 'main.dart' as app;

Future<void> main() async {
  AppConfig.instance = const AppConfig(
    flavor: Flavor.dev,
    title: '[DEV] roam',
    apiUrl: 'https://roam-api-7zgz.onrender.com/',
    enableLogs: true,
    showDevBanner: true,
  );

  await app.main();
}
