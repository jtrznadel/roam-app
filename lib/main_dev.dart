import 'package:roam/flavors.dart';

import 'main.dart' as app;

Future<void> main() async {
  F.instance = F(flavor: Flavor.dev, appName: '[DEV] roam');

  await app.main();
}
