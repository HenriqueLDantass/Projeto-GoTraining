import 'package:flutter/material.dart';
import 'package:gotraining/core/utils/colors/card_colors.dart';

class ScarfoldMessage {
  static void show(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        backgroundColor: CardColors.verde,
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
