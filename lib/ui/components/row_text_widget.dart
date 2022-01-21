import 'package:flutter/material.dart';

class RowTextWidget extends StatelessWidget {
  final String title;
  final String desc;

  const RowTextWidget({
    Key? key,
    required this.title,
    required this.desc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Text(desc),
      ],
    );
  }
}
