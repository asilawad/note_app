import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/providers/appearance_provider.dart';
import '../../../utils/constants/colors_constants.dart';
import '../../../utils/themes/text_theme.dart';

class GenderListileCustom extends StatelessWidget {
  const GenderListileCustom({Key? key, required this.text, required this.value})
      : super(key: key);
  final String value;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      height: 50,
      child: ListTile(
        contentPadding: EdgeInsets.only(left: 5),
        leading: Radio(
          value: value,
          groupValue: context.read<AppearanceProvider>().selectGender,
          onChanged: (value) =>
              context.read<AppearanceProvider>().changeGender(value.toString()),
          activeColor: ColorsConst.green,
        ),
        title: Text(
          text,
          style: FontStyles.subTitle2Style.copyWith(fontSize: 18),
        ),
        shape: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
