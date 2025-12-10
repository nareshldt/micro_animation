import 'package:flutter/material.dart';

class HiddenTextField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;

  const HiddenTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0,
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        keyboardType: TextInputType.number,
        onChanged: onChanged,
        showCursor: false,
        cursorWidth: 0,
        enableInteractiveSelection: false,
        decoration: const InputDecoration(border: InputBorder.none),
        style: const TextStyle(
          fontSize: 0,
          height: 0,
          color: Colors.transparent,
        ),
      ),
    );
  }
}
