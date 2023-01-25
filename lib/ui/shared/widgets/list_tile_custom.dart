import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/utils/themes/text_theme.dart';

import '../../../core/providers/appearance_provider.dart';
import '../../../utils/constants/colors_constants.dart';
import '../../../utils/constants/padding_constants.dart';

class ListTileCustom extends StatelessWidget {
  const ListTileCustom(
      {Key? key,
      required this.text,
      required this.icon,
      required this.onTap,
      this.trailing = const SizedBox()})
      : super(key: key);
  final String text;
  final IconData icon;
  final Widget trailing;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: PaddingConstants.padding20),
      child: Material(
        elevation: 10,
        shadowColor: (!context.read<AppearanceProvider>().isDarkModeOn)
            ? ColorsConst.lightGrey
            : ColorsConst.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: ListTile(
          onTap: onTap,
          leading: Icon(
            icon,
            size: PaddingConstants.padding30,
            color: ColorsConst.green,
          ),
          title: Text(
            text,
            style: FontStyles.footerTextStyle.copyWith(fontSize: 20),
          ),
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(PaddingConstants.padding10),
              borderSide: BorderSide.none),
          trailing: trailing,
        ),
      ),
    );
  }
}

