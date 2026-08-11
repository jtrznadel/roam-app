import 'package:flutter/material.dart';
import 'package:liquid_glass_widgets/widgets/containers/glass_card.dart';
import 'package:roam/core/extensions/context_extension.dart';
import 'package:roam/gen/assets.gen.dart';

class DashboardCollectionProgress extends StatelessWidget {
  const DashboardCollectionProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      width: double.infinity,
      height: 500,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.png.roamBg.path),
            fit: .cover,
          ),
        ),
        child: Column(
          children: [
            Text('Tatry Polskie', style: context.textTheme.displayMedium),
          ],
        ),
      ),
    );
  }
}
