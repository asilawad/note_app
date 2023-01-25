import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/core/providers/appearance_provider.dart';
import 'package:shop_app/utils/themes/text_theme.dart';
import '../../../utils/constants/colors_constants.dart';

class HeaderTextCusto extends StatelessWidget {
  const HeaderTextCusto(
      {Key? key,
      this.text1 = "",
      this.text2 = "",
      this.textAlign = TextAlign.center})
      : super(key: key);
  final String text1;
  final String text2;
  final TextAlign textAlign;
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign,
      text: TextSpan(
          text: text1,
          style: context.read<AppearanceProvider>().isDarkModeOn
              ? FontStyles.headerTextStyle
              : FontStyles.headerTextStyle
                  .copyWith(foreground: ColorsConst.gredientColor),
          children: [
            TextSpan(
                text: text2,
                style: FontStyles.headerTextStyle
                    .copyWith(foreground: ColorsConst.gredientColor))
          ]),
    );
  }
}
