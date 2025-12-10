import 'package:flutter/material.dart';

import '../app_constant.dart';

import '../widgets/amount_display.dart';
import '../widgets/hidden_text_field.dart';
import '../widgets/suggestion_chips.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final TextEditingController _amountController;
  late final FocusNode _amountFocusNode;

  final List<String> suggestions = AppConstants.defaultSuggestions;

  @override
  void initState() {
    super.initState();
    _amountController = TextEditingController();
    _amountFocusNode = FocusNode();

    _amountFocusNode.addListener(() => setState(() {}));
  }

  void _focusAmountField() {
    FocusScope.of(context).requestFocus(_amountFocusNode);
  }

  void _applyChipValue(String value) {
    if (_amountController.text.isEmpty ||
        _amountController.text == AppConstants.defaultAmount) {
      _amountController.text = value;
    } else {
      final currentAmount = int.tryParse(_amountController.text) ?? 0;
      final chipAmount = int.tryParse(value) ?? 0;
      final newAmount = currentAmount + chipAmount;
      _amountController.text = newAmount.toString();
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom;
    final isKeyboardOpen = bottomPadding > 0;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        title: const Text(AppConstants.appTitle),
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        behavior: HitTestBehavior.translucent,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: AppConstants.spacingXLarge),

              GestureDetector(
                onTap: _focusAmountField,
                child: AmountDisplay(
                  amountText: _amountController.text,
                  hasFocus: _amountFocusNode.hasFocus,
                ),
              ),

              const Spacer(),

              SizedBox(
                height: AppConstants.chipListHeight,
                child: Align(
                  child: AnimatedSlide(
                    offset: isKeyboardOpen ? Offset.zero : const Offset(0, 1),
                    duration: AppConstants.durationEntrySlide,
                    curve: Curves.easeInOut,
                    child: AnimatedOpacity(
                      curve: Curves.easeInOut,
                      opacity: isKeyboardOpen ? 1.0 : 0.0,
                      duration: AppConstants.durationEntryFade,
                      child: SuggestionChips(
                        values: suggestions,
                        onChipTap: _applyChipValue,
                      ),
                    ),
                  ),
                ),
              ),
              HiddenTextField(
                controller: _amountController,
                focusNode: _amountFocusNode,
                onChanged: (_) => setState(() {}),
              ),

              AnimatedContainer(
                duration: AppConstants.durationKeyboardSlide,
                height: bottomPadding,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _amountController.dispose();
    _amountFocusNode.dispose();
    super.dispose();
  }
}
