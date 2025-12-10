import 'package:flutter/material.dart';

import '../app_constant.dart';
import 'blinking_cursor.dart';

class AmountDisplay extends StatelessWidget {
  final String amountText;
  final bool hasFocus;

  const AmountDisplay({
    super.key,
    required this.amountText,
    required this.hasFocus,
  });

  String _getFormattedAmount(String amount) {
    if (amount.isEmpty) return AppConstants.defaultAmount;

    return amount.replaceAllMapped(
      RegExp(AppConstants.numberFormatRegex),
      (Match m) => '${m[1]},',
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final formattedAmount = _getFormattedAmount(amountText);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const Text(
          AppConstants.labelCurrentAmount,
          style: TextStyle(
            fontSize: AppConstants.fontSizeLabel,
            color: AppConstants.colorTextSecondary,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: AppConstants.spacingMedium),

        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: screenWidth - AppConstants.amountMaxWidthOffset,
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.amountCardPaddingH,
              vertical: AppConstants.amountCardPaddingV,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                AppConstants.amountCardRadius,
              ),
            ),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    AppConstants.currencySymbol,
                    style: TextStyle(
                      fontSize: AppConstants.fontSizeAmount,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  AnimatedSwitcher(
                    duration: AppConstants.durationAmountSlide,
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                          return FadeTransition(
                            opacity: animation,
                            child: SlideTransition(
                              position: Tween<Offset>(
                                begin: const Offset(0.1, 0.0),
                                end: Offset.zero,
                              ).animate(animation),
                              child: child,
                            ),
                          );
                        },
                    child: Text(
                      formattedAmount,
                      key: ValueKey<String>(formattedAmount),
                      overflow: TextOverflow.clip,
                      style: const TextStyle(
                        fontSize: AppConstants.fontSizeAmount,
                        fontWeight: FontWeight.w600,
                        letterSpacing: AppConstants.letterSpacingAmount,
                        color: AppConstants.colorTextTertiary,
                      ),
                    ),
                  ),

                  const SizedBox(width: 2),

                  if (hasFocus) ...[
                    const SizedBox(width: 2),
                    const BlinkingCursor(
                      height: AppConstants.cursorActiveHeight,
                      width: AppConstants.cursorActiveWidth,
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
