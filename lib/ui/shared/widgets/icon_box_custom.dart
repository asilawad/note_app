import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/core/providers/appearance_provider.dart';

import '../../../utils/constants/colors_constants.dart';
import '../../../utils/constants/padding_constants.dart';

class IconBoxCustom extends StatelessWidget {
  const IconBoxCustom({Key? key, required this.icon, required this.onPressed})
      : super(key: key);
  final IconData icon;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: PaddingConstants.padding50,
      height: PaddingConstants.padding50,
      decoration: BoxDecoration(
          color: context.read<AppearanceProvider>().isDarkModeOn
              ? ColorsConst.darkGrey
              : Color.fromARGB(0, 189, 189, 189),
          borderRadius: BorderRadius.circular(PaddingConstants.padding15),
          border: (!context.read<AppearanceProvider>().isDarkModeOn)
              ? Border.all(color: ColorsConst.green, width: 1.5)
              : Border.all(color: ColorsConst.darkGrey)),
      child: IconButton(
          onPressed: onPressed, icon: Icon(icon, color: ColorsConst.green)),
    );
  }
}
