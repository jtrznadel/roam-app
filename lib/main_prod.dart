import 'package:roam/flavors.dart';

import 'main.dart' as app;

Future<void> main() async {
  F.instance = F(flavor: Flavor.prod, appName: 'roam');

  await app.main();
}
