import 'package:flutter/material.dart';

class AppConstants {
  AppConstants._();

  static const String appTitle = 'Amount';
  static const String labelCurrentAmount = 'How much would you like to gift?';
  static const String currencySymbol = '\$ ';
  static const String defaultAmount = '0';

  static const String numberFormatRegex = r'(\d{1,3})(?=(\d{3})+(?!\d))';

  static const List<String> defaultSuggestions = [
    '10',
    '50',
    '100',
    '250',
    '500',
    '1000',
    '1500',
    '2000',
  ];

  static const Duration durationCursorBlink = Duration(milliseconds: 800);
  static const Duration durationAmountSlide = Duration(milliseconds: 100);
  static const Duration durationChipPop = Duration(milliseconds: 150);
  static const Duration durationKeyboardSlide = Duration(milliseconds: 100);
  static const Duration durationEntrySlide = Duration(milliseconds: 300);
  static const Duration durationEntryFade = Duration(milliseconds: 300);

  static const double spacingSmall = 13.0;
  static const double spacingMedium = 16.0;
  static const double spacingLarge = 24.0;
  static const double spacingXLarge = 40.0;

  static const double chipListHeight = 60.0;

  static const double chipFontSize = 18.0;
  static const double chipHeight = 50.0;
  static const double chipPaddingHorizontal = 28.0;
  static const double chipScaleExpanded = 1.15;

  static const double chipBorderRadius = 100.0;
  static const double chipBorderWidth = 1.5;

  static const double amountCardRadius = 20.0;
  static const double amountCardPaddingV = 16.0;
  static const double amountCardPaddingH = 24.0;
  static const double amountMaxWidthOffset = 48.0;

  static const double cursorDefaultHeight = 72.0;
  static const double cursorDefaultWidth = 2.0;
  static const double cursorActiveHeight = 72.0;
  static const double cursorActiveWidth = 3.0;

  static const double fontSizeLabel = 24.0;
  static const double fontSizeAmount = 72.0;

  static const double letterSpacingAmount = -1.0;

  static const Color colorChipBackground = Color(0xFF65C3E8);
  static const Color colorChipBorder = Colors.black;
  static const Color colorTextPrimary = Colors.black;

  static const Color colorTextSecondary = Colors.black54;
  static const Color colorTextTertiary = Colors.black38;

  static const Color colorShadow = Colors.black;
}
