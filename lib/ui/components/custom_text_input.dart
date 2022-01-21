import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maka_shop/ui/theme/colors.dart';
import 'package:maka_shop/ui/theme/text_styles.dart';

class CustomTextField extends StatefulWidget {
  final bool autofocus;
  final Function(String text)? onChange;
  final TextInputType keyboardType;
  final bool obscureText;
  final int maxLines;
  final String labelText;
  final TextEditingController controller;
  final String hint;
  final bool readOnly;
  final VoidCallback? onTap;
  final String? errorMessage;
  final TextInputAction textInputAction;
  final VoidCallback? onEditingComplete;
  final Color textColor;
  final bool isPasswordField;
  final bool? alignLabelWithHint;
  final bool isOptionalField;
  final int? maxLength;
  final List<TextInputFormatter>? textInputFormatter;
  final bool enableInteractiveSelection;
  final bool showCursor;
  final bool isEnabled;
  final bool removeUnderline;

  const CustomTextField({
    Key? key,
    this.autofocus = false,
    this.onChange,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    required this.labelText,
    required this.controller,
    this.hint = "",
    this.readOnly = false,
    this.onTap,
    this.errorMessage,
    this.obscureText = false,
    this.textInputAction = TextInputAction.done,
    this.onEditingComplete,
    this.textColor = black,
    this.isPasswordField = false,
    this.alignLabelWithHint,
    this.maxLength,
    this.textInputFormatter,
    this.isOptionalField = false,
    this.enableInteractiveSelection = true,
    this.isEnabled = true,
    this.showCursor = true,
    this.removeUnderline = false,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final FocusNode myFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: widget.textInputAction,
      readOnly: widget.readOnly,
      cursorHeight: 20.0,
      controller: widget.controller,
      obscureText: widget.obscureText,
      onEditingComplete: widget.onEditingComplete,
      onChanged: widget.onChange,
      validator: (String? value) {
        if (value == null || value.isEmpty && !widget.isOptionalField) {
          return widget.errorMessage ?? "${widget.labelText} cannot be empty";
        } else if (widget.labelText.contains("Email") ||
            widget.labelText.contains("email")) {
          bool isValidEmail = RegExp(
                  r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
              .hasMatch(value);
          return isValidEmail ? null : "Please provide a valid email address";
        }
        return null;
      },
      onTap: widget.onTap,
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
      enableInteractiveSelection: widget.enableInteractiveSelection,
      enabled: widget.isEnabled,
      showCursor: widget.showCursor,
      keyboardType:
          widget.maxLines > 1 ? TextInputType.multiline : widget.keyboardType,
      inputFormatters: widget.textInputFormatter,
      style: mediumTextStyle.copyWith(
        color: widget.textColor,
        fontWeight: FontWeight.w600,
        fontSize: 16.0,
      ),
      autofocus: widget.autofocus,
      textCapitalization: TextCapitalization.none,
      decoration: InputDecoration(
        labelText: widget.labelText,
        alignLabelWithHint: widget.alignLabelWithHint,
        labelStyle: const TextStyle(
          fontSize: 14,
          fontFamily: "EpilogueSemibold",
          color: blueZodiac,
        ),
        isDense: false,
        focusedBorder: widget.removeUnderline
            ? InputBorder.none
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: black,
                  width: 1.2,
                ),
              ),
        disabledBorder: widget.removeUnderline
            ? InputBorder.none
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: grayTextColor,
                  width: 1.2,
                ),
              ),
        errorBorder: widget.removeUnderline
            ? InputBorder.none
            : OutlineInputBorder(
                borderSide: const BorderSide(color: red, width: 1.5),
                borderRadius: BorderRadius.circular(10.0),
              ),
        border: widget.removeUnderline
            ? InputBorder.none
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: colorEnabled,
                  width: 1.5,
                ),
              ),
      ),
    );
  }
}
