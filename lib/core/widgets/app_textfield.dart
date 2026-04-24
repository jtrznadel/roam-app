import 'package:flutter/material.dart';
import 'package:roam/core/extensions/context_extension.dart';
import 'package:roam/gen/colors.gen.dart';

class AppTextField extends StatefulWidget {
  final String label;
  final String? hint;
  final String? initialValue;
  final VoidCallback onChanged;
  final bool? autoFocus;

  const AppTextField({
    super.key,
    required this.label,
    this.hint,
    this.initialValue,
    required this.onChanged,
    this.autoFocus = false,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  final FocusNode _focusNode = FocusNode();

  static final OutlineInputBorder _defaultBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: const BorderSide(color: Colors.transparent),
  );

  static final OutlineInputBorder _focusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: const BorderSide(color: AppColors.primary),
  );

  @override
  void initState() {
    if (widget.autoFocus == true) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        FocusScope.of(context).requestFocus(_focusNode);
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: context.textTheme.labelMedium?.copyWith(
            color: AppColors.fontSecondary,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          autofocus: widget.autoFocus ?? false,
          focusNode: _focusNode,
          style: context.textTheme.labelLarge,
          decoration: InputDecoration(
            hintText: widget.hint,
            filled: true,
            fillColor: AppColors.surface,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            border: _defaultBorder,
            enabledBorder: _defaultBorder,
            focusedBorder: _focusedBorder,
          ),
          onChanged: (value) {
            widget.onChanged();
          },
        ),
      ],
    );
  }
}
