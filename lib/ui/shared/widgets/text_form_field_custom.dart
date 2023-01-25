import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/core/providers/appearance_provider.dart';
import 'package:shop_app/utils/constants/colors_constants.dart';
import 'package:shop_app/utils/themes/text_theme.dart';

import '../../../utils/constants/padding_constants.dart';

class TextFormFieldCustom extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final IconData icon;
  final obsecure;
  final validator;
  const TextFormFieldCustom(
      {Key? key,
      required this.hintText,
      required this.controller,
      required this.icon,
      this.obsecure = false,
      this.validator})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: PaddingConstants.padding15),
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          if (!context.read<AppearanceProvider>().isDarkModeOn)
            const BoxShadow(
                offset: Offset(0, 5),
                blurRadius: 10,
                color: ColorsConst.lightGrey)
        ]),
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          textInputAction: TextInputAction.next,
          controller: controller,
          obscureText: obsecure,
          style:
              FontStyles.textButtonStyle.copyWith(fontWeight: FontWeight.w400),
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10.0),
            ),
            filled: true,
            prefixIcon: Icon(
              icon,
              size: 20,
            ),
          ),
          validator: validator,
        ),
      ),
    );
  }
}
