import 'package:flutter/material.dart';
import 'package:maka_shop/ui/theme/colors.dart';
import 'package:maka_shop/ui/theme/text_styles.dart';

class CustomSnackBar {
  final BuildContext context;

  CustomSnackBar({required this.context});

  CustomSnackBar.show(
    this.context,
    String message, {
    VoidCallback? action,
    String actionMessage = "OK",
    Color backgroundColor = Colors.black87,
  }) {
    final snackBar = SnackBar(
      action: action == null
          ? null
          : SnackBarAction(
              label: actionMessage,
              onPressed: action,
              textColor: Colors.white54,
            ),
      backgroundColor: backgroundColor,
      duration: const Duration(milliseconds: 5000),
      content:
          Text(message, style: mediumTextStyle.copyWith(color: Colors.white)),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  CustomSnackBar.error(this.context, String errorMessage) {
    final snackBar = SnackBar(
      content: Row(
        children: [
          Text(
            errorMessage,
            style: smallTextStyle.copyWith(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
            ),
          )
        ],
      ),
      backgroundColor: snackBarRed,
      duration: const Duration(milliseconds: 5000),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
