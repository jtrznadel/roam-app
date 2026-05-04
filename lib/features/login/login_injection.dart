import 'package:roam/core/dependency_injection/dependency_injection.dart';
import 'package:roam/features/login/presentation/cubit/login_form_cubit.dart';

Future<void> initLoginInjection() async {
  sl.registerFactory(() => LoginFormCubit());
}
