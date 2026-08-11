import 'package:flutter/material.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final Widget? appBar;
  final Widget? header;
  final ScrollController? headerScrollController;
  final double headerFadeDistance;
  final Color? backgroundColor;
  final bool extendBody;

  const AppScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.header,
    this.headerScrollController,
    this.headerFadeDistance = 60,
    this.backgroundColor = Colors.transparent,
    this.extendBody = true,
  });

  @override
  Widget build(BuildContext context) {
    return GlassScaffold(
      body: body,
      appBar: appBar,
      header: header,
      headerScrollController: headerScrollController,
      headerFadeDistance: headerFadeDistance,
      backgroundColor: backgroundColor,
      extendBody: extendBody,
    );
  }
}
