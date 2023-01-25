import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/core/providers/auth_provider.dart';
import 'package:shop_app/core/providers/task_provider.dart';
import 'package:shop_app/ui/shared/widgets/list_tile_custom.dart';
import 'package:shop_app/utils/constants/colors_constants.dart';
import 'package:shop_app/utils/constants/routes_constants.dart';
import 'package:shop_app/utils/routes/router.dart';
import '../../../../core/providers/appearance_provider.dart';
import '../../../../utils/constants/padding_constants.dart';
import '../../../../utils/l10n/locale_keys.g.dart';
import '../../../shared/widgets/header_text_custom.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(
          PaddingConstants.padding25,
        ),
        children: [
          const SizedBox(
            height: PaddingConstants.padding45,
          ),
          HeaderTextCusto(
            text2: LocaleKeys.settingsText.tr(),
          ),
          const SizedBox(
            height: PaddingConstants.padding50,
          ),
          ListTileCustom(
              text: LocaleKeys.darkModeText.tr(),
              icon: Icons.dark_mode_outlined,
              onTap: null,
              trailing: Consumer<AppearanceProvider>(
                builder: (context, provider, child) => Switch(
                  value: provider.isDarkModeOn,
                  onChanged: (value) => provider.updateTheme(value),
                  activeColor: ColorsConst.green,
                ),
              )),
          ListTileCustom(
            text: LocaleKeys.languageText.tr(),
            icon: Icons.language_outlined,
            onTap: () {
              AppRouter.pushNamed(RouteConstants.languageRoute);
            },
          ),
          ListTileCustom(
            text: LocaleKeys.helpCenterText.tr(),
            icon: Icons.help_outline_sharp,
            onTap: () {},
          ),
          ListTileCustom(
            text: LocaleKeys.aboutUsText.tr(),
            icon: Icons.announcement_outlined,
            onTap: () {},
          ),
          ListTileCustom(
              text: LocaleKeys.logText.tr() + LocaleKeys.outText.tr(),
              icon: Icons.logout,
              onTap: () {
                context.read<AuthProvider>().logout();
              }),
              

              
        ],
      ),
    );
  }
}
