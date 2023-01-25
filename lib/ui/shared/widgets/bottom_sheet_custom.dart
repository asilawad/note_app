import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/utils/l10n/locale_keys.g.dart';
import 'package:shop_app/utils/routes/router.dart';
import '../../../utils/constants/colors_constants.dart';
import '../../../utils/constants/controllers.dart';
import '../../../utils/constants/padding_constants.dart';
import '../../../utils/themes/text_theme.dart';
import 'elevated_button_custom.dart';

BottomSheetCustom(String text, String buttonText, Function()? onPressed) {
  showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(PaddingConstants.padding15)),
      backgroundColor: ColorsConst.darkGey200,
      context: AppRouter.navigatorKey.currentContext!,
      builder: (context) => Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              left: PaddingConstants.padding15,
              top: PaddingConstants.padding15,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: FontStyles.subTitle2Style,
                ),
                const SizedBox(
                  height: PaddingConstants.padding15,
                ),
                TextFormField(
                  autofocus: true,
                  maxLength: 15,
                  style: FontStyles.textButtonStyle
                      .copyWith(fontWeight: FontWeight.w400),
                  textInputAction: TextInputAction.done,
                  controller: Controllers.taskTitle,
                  decoration: InputDecoration(
                    hintText: LocaleKeys.typeSomethingText.tr(),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius:
                          BorderRadius.circular(PaddingConstants.padding10),
                    ),
                    filled: true,
                  ),
                  maxLines: 10,
                  minLines: 10,
                ),
                const SizedBox(
                  height: PaddingConstants.padding10,
                ),
                ElevatedButtonCustom(onPressed: onPressed, text: buttonText),
                const SizedBox(
                  height: PaddingConstants.padding20,
                ),
              ],
            ),
          ));
}
