import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:maka_shop/ui/theme/colors.dart';
import 'package:maka_shop/ui/theme/text_styles.dart';

class AppUtils {
  AppUtils._();

  static void showAnimationProgressDialog(
    BuildContext context, {
    String title = 'Please Wait..',
    double height = 200,
    double width = double.infinity,
    Widget? actionButton,
    Widget? dialogWidget,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => Dialog(
        backgroundColor: black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: SizedBox(
          height: height,
          width: width,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: dialogWidget ??
                      const SpinKitChasingDots(
                        color: Colors.white,
                        size: 70.0,
                        duration: Duration(milliseconds: 1000),
                      ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 40.0),
                  child: Center(
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: mediumTextStyle.copyWith(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
