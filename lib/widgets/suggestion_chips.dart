import 'package:flutter/material.dart';

import '../app_constant.dart';

class SuggestionChips extends StatelessWidget {
  final List<String> values;
  final ValueChanged<String> onChipTap;

  const SuggestionChips({
    super.key,
    required this.values,
    required this.onChipTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: values.length,
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.spacingSmall,
      ),
      separatorBuilder: (_, _) =>
          const SizedBox(width: AppConstants.spacingSmall),
      itemBuilder: (_, index) {
        return SizedBox(
          height: AppConstants.chipHeight,
          child: _AnimatedChip(label: values[index], onTap: onChipTap),
        );
      },
    );
  }
}

class _AnimatedChip extends StatefulWidget {
  final String label;
  final ValueChanged<String> onTap;

  const _AnimatedChip({required this.label, required this.onTap});

  @override
  State<_AnimatedChip> createState() => _AnimatedChipState();
}

class _AnimatedChipState extends State<_AnimatedChip>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: AppConstants.durationChipPop,
    );

    _scaleAnimation =
        Tween<double>(begin: 1.0, end: AppConstants.chipScaleExpanded).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.easeOut,
            reverseCurve: Curves.easeIn,
          ),
        );
  }

  void _handleTap() async {
    widget.onTap(widget.label);

    await _controller.forward(from: 0.0);
    if (mounted) {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: _handleTap,
        onTapDown: (_) => _controller.forward(),
        onTapCancel: () => _controller.reverse(),
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Container(
            height: AppConstants.chipHeight,
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.chipPaddingHorizontal,
            ),
            decoration: BoxDecoration(
              color: AppConstants.colorChipBackground,
              borderRadius: BorderRadius.circular(
                AppConstants.chipBorderRadius,
              ),
              border: Border.all(
                color: AppConstants.colorChipBorder,
                width: AppConstants.chipBorderWidth,
              ),
              boxShadow: const [
                BoxShadow(
                  color: AppConstants.colorShadow,
                  blurRadius: 0,
                  offset: Offset(0, 3.5),
                ),
              ],
            ),
            child: Center(
              child: Text(
                '${AppConstants.currencySymbol}${widget.label}',
                style: const TextStyle(
                  fontSize: AppConstants.chipFontSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
