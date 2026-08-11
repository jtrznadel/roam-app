import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roam/core/widgets/app_button.dart';
import 'package:roam/core/widgets/app_scaffold.dart';
import 'package:roam/features/auth/presentation/cubit/auth_session_cubit.dart';
import 'package:roam/features/dashboard/presentation/widgets/dashboard_app_bar.dart';
import 'package:roam/features/dashboard/presentation/widgets/dashboard_collection_progress.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      header: const DashboardAppBar(),
      headerScrollController: _scrollController,
      headerFadeDistance: 96,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverPadding(
            padding: EdgeInsets.fromLTRB(
              16,
              MediaQuery.paddingOf(context).top +
                  DashboardAppBar.preferredHeight +
                  24,
              16,
              0,
            ),
            sliver: const SliverToBoxAdapter(
              child: DashboardCollectionProgress(),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                16,
                24,
                16,
                MediaQuery.paddingOf(context).bottom + 96,
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: AppButton(
                  onPressed: () {
                    context.read<AuthSessionCubit>().logout();
                  },
                  text: 'Logout',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
