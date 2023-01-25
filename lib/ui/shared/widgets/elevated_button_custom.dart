import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/core/providers/appearance_provider.dart';
import 'package:shop_app/core/providers/auth_provider.dart';
import 'package:shop_app/utils/constants/colors_constants.dart';
import 'package:shop_app/utils/constants/padding_constants.dart';
import 'package:shop_app/utils/themes/text_theme.dart';

class ElevatedButtonCustom extends StatelessWidget {
  const ElevatedButtonCustom(
      {Key? key, required this.onPressed, required this.text})
      : super(key: key);
  final Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 325,
      height: 44,
      margin:
          const EdgeInsets.symmetric(horizontal: PaddingConstants.padding25),
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [ColorsConst.blue, ColorsConst.lightGreen],
      )),
      child: Consumer<AppearanceProvider>(
        builder: (context, provider, child) => ElevatedButton(
          onPressed: (provider.isLoading) ? () {} : onPressed,
          child: (provider.isLoading)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 25,
                      width: 25,
                      child: CircularProgressIndicator(
                        color: ColorsConst.grey400,
                      ),
                    ),
                    SizedBox(
                      width: PaddingConstants.padding15,
                    ),
                    Text(
                      "Loading",
                      style: FontStyles.footerTextStyle
                          .copyWith(color: ColorsConst.grey400, fontSize: 16),
                    )
                  ],
                )
              : Text(
                  text,
                  style: FontStyles.textButtonStyle,
                ),
          style: ElevatedButton.styleFrom(
              primary:
                  (provider.isLoading) ? ColorsConst.grey : Colors.transparent),
        ),
      ),
    );
  }
}
