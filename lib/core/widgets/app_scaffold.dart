import 'package:flutter/material.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final Widget? appBar;
  final Color? backgroundColor;
  final bool extendBody;

  const AppScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.backgroundColor = Colors.transparent,
    this.extendBody = true,
  });

  @override
  Widget build(BuildContext context) {
    return GlassScaffold(
      body: body,
      appBar: appBar,
      backgroundColor: backgroundColor,
      extendBody: extendBody,
    );
  }
}
