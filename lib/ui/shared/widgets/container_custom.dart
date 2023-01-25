import 'package:flutter/material.dart';
import '../../../utils/constants/colors_constants.dart';
import '../../../utils/constants/padding_constants.dart';
import '../../../utils/themes/text_theme.dart';

class ContainerCustom extends StatelessWidget {
  const ContainerCustom(
      {Key? key,
       this.onPressed,
       this.text="",
       this.onLongPress,
      this.gradient = const LinearGradient(
        colors: [ColorsConst.blue, ColorsConst.lightGreen],
      )})
      : super(key: key);
  final Function()? onPressed;
  final Function()? onLongPress;
  final String text;
  final Gradient? gradient;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      onLongPress: onLongPress,
      child: Container(
          width: 365,
          height: 110,
         
          decoration: BoxDecoration(
              // color: ColorsConst.grey,
              gradient: gradient,
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsetsDirectional.only(start: 30.0, top: 22),
            child: Text(
              text,
              style: FontStyles.subTitle1Style.copyWith(
                  color: ColorsConst.white, fontWeight: FontWeight.bold),
            ),
          )),
    );
  }
}
