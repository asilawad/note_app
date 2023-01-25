import 'package:flutter/material.dart';
import 'package:shop_app/utils/constants/colors_constants.dart';
import 'package:shop_app/utils/themes/text_theme.dart';

class FooterTextCustom extends StatelessWidget {
  FooterTextCustom(
      {Key? key, required this.text1, required this.text2, this.onPressed})
      : super(key: key);
  final String text1;
  final String text2;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text1,
          style: FontStyles.footerTextStyle,
        ),
        GestureDetector(
          onTap: onPressed,
          child: Text(
            text2,
            style: FontStyles.footerTextStyle.copyWith(
              color: ColorsConst.green,
              decoration: TextDecoration.underline,
            ),
          ),
        )
      ],
    );
  }
}
