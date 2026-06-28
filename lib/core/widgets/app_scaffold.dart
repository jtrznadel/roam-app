import 'package:flutter/widgets.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final Widget? appBar;
  const AppScaffold({super.key, required this.body, this.appBar});

  @override
  Widget build(BuildContext context) {
    return GlassScaffold(body: body, appBar: appBar);
  }
}
