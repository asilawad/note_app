import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/core/providers/appearance_provider.dart';
import 'package:shop_app/utils/constants/colors_constants.dart';
import 'package:shop_app/utils/l10n/locale_keys.g.dart';

import '../../../../utils/constants/padding_constants.dart';
import '../../../shared/widgets/list_tile_custom.dart';

class LanguageView extends StatelessWidget {
  const LanguageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AppearanceProvider>(
        builder: (context, provider, child) => ListView(
          padding: const EdgeInsets.all(
            PaddingConstants.padding25,
          ),
          children: [
            const SizedBox(
              height: PaddingConstants.padding85,
            ),
            ListTileCustom(
              text: LocaleKeys.arabicText.tr(),
              icon: Icons.abc,
              onTap: () {
                context.setLocale(const Locale('ar'));
                provider.updateLanguage(false);
              },
              trailing: Visibility(
                visible: !provider.isEnglish,
                child: const Icon(
                  Icons.check,
                  color: ColorsConst.green,
                ),
              ),
            ),
            ListTileCustom(
              text: LocaleKeys.englishText.tr(),
              icon: Icons.abc,
              onTap: () {
                context.setLocale(const Locale('en'));
                provider.updateLanguage(true);
              },
              trailing: Visibility(
                visible: provider.isEnglish,
                child: const Icon(
                  Icons.check,
                  color: ColorsConst.green,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
