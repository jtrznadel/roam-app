import 'package:roam/core/config/app_config.dart';

import 'main.dart' as app;

Future<void> main() async {
  AppConfig.instance = const AppConfig(
    flavor: Flavor.prod,
    title: 'roam',
    apiUrl: 'https://roam-api-7zgz.onrender.com/',
    enableLogs: false,
    showDevBanner: false,
  );

  await app.main();
}
