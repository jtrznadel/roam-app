import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';
import 'package:roam/core/widgets/app_button.dart';
import 'package:roam/core/widgets/app_scaffold.dart';
import 'package:roam/features/auth/presentation/cubit/auth_session_cubit.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: GlassAppBar(title: GlassSearchBar()),
      body: Column(
        children: [
          Spacer(),
          AppButton(
            onPressed: () {
              context.read<AuthSessionCubit>().logout();
            },
            text: 'Logout',
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
