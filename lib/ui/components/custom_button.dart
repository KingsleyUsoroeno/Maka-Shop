import 'package:flutter/material.dart';
import 'package:maka_shop/ui/theme/colors.dart';
import 'package:maka_shop/ui/theme/text_styles.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPress;
  final bool disabled;
  final double height, width, elevation;
  final Color buttonColor;
  final Color textColor;

  const CustomButton({
    Key? key,
    required this.label,
    this.onPress,
    this.disabled = false,
    this.elevation = 2.0,
    this.height = 48.0,
    this.buttonColor = black,
    this.textColor = Colors.white,
    this.width = double.infinity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            disabled ? blueZodiac.withOpacity(0.1) : buttonColor,
          ),
          elevation: MaterialStateProperty.all(disabled ? 0.0 : elevation),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3.0),
            ),
          ),
        ),
        onPressed: onPress,
        child: SizedBox(
          width: width,
          height: height,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  label,
                  style: mediumTextStyle.copyWith(
                    color: disabled ? const Color(0xFFA3A3A3) : textColor,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
