import 'package:flutter/material.dart';
import 'package:roam/core/widgets/app_appbar.dart';
import 'package:roam/core/widgets/app_back_button.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
    });
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(leading: AppBackButton()),
      body: SafeArea(
        child: Column(
          children: [TextField(focusNode: _focusNode, autofocus: true)],
        ),
      ),
    );
  }
}
