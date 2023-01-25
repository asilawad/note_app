import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/padding_constants.dart';
import '../../../utils/l10n/locale_keys.g.dart';
import '../../../utils/themes/text_theme.dart';

class NoNotesImage extends StatelessWidget {
  const NoNotesImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "assets/images/home.png",
          alignment: Alignment.center,
        ),
        const SizedBox(
          height: PaddingConstants.padding15,
        ),
        Text(
          LocaleKeys.createFirstNoteText.tr(),
          style: FontStyles.subTitle1Style,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
