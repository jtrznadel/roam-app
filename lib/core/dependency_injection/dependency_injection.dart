import 'package:get_it/get_it.dart';
import 'package:roam/features/login/login_injection.dart';

final sl = GetIt.instance;

Future<void> initDependencyInjections() async {
  await initLoginInjection();
}
