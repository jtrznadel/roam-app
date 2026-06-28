import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:roam/core/extensions/context_extension.dart';
import 'package:roam/gen/colors.gen.dart';

class AppOtpField extends StatefulWidget {
  final String label;
  final int length;
  final ValueChanged<String> onChanged;
  final bool autoFocus;
  final bool enabled;
  final String? errorMessage;

  const AppOtpField({
    super.key,
    required this.label,
    required this.onChanged,
    this.length = 6,
    this.autoFocus = false,
    this.enabled = true,
    this.errorMessage,
  });

  @override
  State<AppOtpField> createState() => _AppOtpFieldState();
}

class _AppOtpFieldState extends State<AppOtpField> {
  static const _transitionDuration = Duration(milliseconds: 280);

  late final TextEditingController _controller;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = FocusNode();
    _controller.addListener(_refresh);
    _focusNode.addListener(_refresh);

    if (widget.autoFocus) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          FocusScope.of(context).requestFocus(_focusNode);
        }
      });
    }
  }

  void _refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void didUpdateWidget(covariant AppOtpField oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.enabled && !widget.enabled) {
      _focusNode.unfocus();
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_refresh);
    _focusNode.removeListener(_refresh);
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _handleChanged(String value) {
    final digitsOnly = value.replaceAll(RegExp(r'\D'), '');
    final trimmedValue = digitsOnly.length > widget.length
        ? digitsOnly.substring(0, widget.length)
        : digitsOnly;

    if (trimmedValue != value) {
      _controller.value = TextEditingValue(
        text: trimmedValue,
        selection: TextSelection.collapsed(offset: trimmedValue.length),
      );
    }

    widget.onChanged(trimmedValue);
  }

  @override
  Widget build(BuildContext context) {
    final code = _controller.text;
    final isEnabled = widget.enabled;

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
        GestureDetector(
          onTap: isEnabled ? () => _focusNode.requestFocus() : null,
          child: SizedBox(
            height: 64,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Positioned.fill(
                  child: Opacity(
                    opacity: 0,
                    child: TextField(
                      controller: _controller,
                      focusNode: _focusNode,
                      autofocus: widget.autoFocus,
                      enabled: isEnabled,
                      readOnly: !isEnabled,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      maxLength: widget.length,
                      cursorColor: AppColors.fontPrimary,
                      style: const TextStyle(color: Colors.transparent),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        counterText: '',
                        contentPadding: EdgeInsets.zero,
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(widget.length),
                      ],
                      onChanged: _handleChanged,
                    ),
                  ),
                ),
                Row(
                  children: [
                    for (var index = 0; index < widget.length; index++) ...[
                      Expanded(
                        child: Builder(
                          builder: (context) {
                            final isFocused =
                                isEnabled &&
                                _focusNode.hasFocus &&
                                code.length == index;
                            final isFilled = index < code.length;

                            return AnimatedContainer(
                              duration: _transitionDuration,
                              curve: Curves.easeOutCubic,
                              decoration: BoxDecoration(
                                color: isEnabled
                                    ? AppColors.surface
                                    : AppColors.fontSecondary.withAlpha(24),
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: !isEnabled
                                      ? AppColors.fontSecondary.withAlpha(90)
                                      : isFocused || isFilled
                                      ? AppColors.fontPrimary
                                      : AppColors.border,
                                  width: isFocused ? 2 : 1.5,
                                ),
                              ),
                              alignment: Alignment.center,
                              child: AnimatedDefaultTextStyle(
                                duration: _transitionDuration,
                                curve: Curves.easeOutCubic,
                                style: context.textTheme.headlineMedium!
                                    .copyWith(
                                      color: isEnabled
                                          ? AppColors.fontPrimary
                                          : AppColors.fontSecondary,
                                    ),
                                child: Text(isFilled ? code[index] : ''),
                              ),
                            );
                          },
                        ),
                      ),
                      if (index < widget.length - 1) const SizedBox(width: 8),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ),
        if (widget.errorMessage != null) ...[
          const SizedBox(height: 8),
          Text(
            widget.errorMessage!,
            style: context.textTheme.labelMedium?.copyWith(
              color: AppColors.error,
            ),
          ),
        ],
      ],
    );
  }
}
