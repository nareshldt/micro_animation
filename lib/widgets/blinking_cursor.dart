import 'package:flutter/material.dart';

import '../app_constant.dart';

class BlinkingCursor extends StatefulWidget {
  final double height;
  final double width;
  final Color? color;

  const BlinkingCursor({
    super.key,
    this.height = AppConstants.cursorDefaultHeight,
    this.width = AppConstants.cursorDefaultWidth,
    this.color,
  });

  @override
  State<BlinkingCursor> createState() => _BlinkingCursorState();
}

class _BlinkingCursorState extends State<BlinkingCursor>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: AppConstants.durationCursorBlink,
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color: widget.color ?? Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(widget.width),
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
