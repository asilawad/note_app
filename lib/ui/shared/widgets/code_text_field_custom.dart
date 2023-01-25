import 'package:flutter/material.dart';
import 'package:shop_app/utils/constants/padding_constants.dart';

import '../../../utils/themes/text_theme.dart';

class CodeTextFieldCustom extends StatelessWidget {
  const CodeTextFieldCustom(
      {Key? key, required this.rightPadding, required this.controller})
      : super(key: key);
  final double rightPadding;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: PaddingConstants.padding15,
        right: rightPadding,
      ),
      child: SizedBox(
        width: 70,
        child: TextField(
          textAlign: TextAlign.center,
          controller: controller,
          style: FontStyles.textButtonStyle,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10.0),
            ),
            filled: true,
          ),
        ),
      ),
    );
  }
}
