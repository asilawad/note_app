import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/core/providers/auth_provider.dart';
import 'package:shop_app/ui/shared/widgets/elevated_button_custom.dart';
import 'package:shop_app/ui/shared/widgets/footer_text_custom.dart';
import 'package:shop_app/utils/constants/colors_constants.dart';
import 'package:shop_app/utils/constants/routes_constants.dart';
import 'package:shop_app/utils/themes/text_theme.dart';

import '../../../utils/constants/controllers.dart';
import '../../../utils/constants/padding_constants.dart';
import '../../../utils/l10n/locale_keys.g.dart';
import '../../../utils/routes/router.dart';
import '../../shared/widgets/header_text_custom.dart';
import '../../shared/widgets/text_form_field_custom.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding:
            const EdgeInsets.symmetric(horizontal: PaddingConstants.padding25),
        children: [
          const SizedBox(
            height: PaddingConstants.padding85,
          ),
          HeaderTextCusto(
              text1: "",
              text2: LocaleKeys.logText.tr() + LocaleKeys.inText.tr()),
          const SizedBox(
            height: PaddingConstants.padding85,
          ),
          TextFormFieldCustom(
              hintText: LocaleKeys.emailHintText.tr(),
              controller: Controllers.txtEmail,
              icon: Icons.alternate_email_outlined),
          TextFormFieldCustom(
              hintText: LocaleKeys.passwordText.tr(),
              controller: Controllers.txtPassword,
              icon: Icons.lock_open_outlined),
          const SizedBox(
            height: PaddingConstants.padding85,
          ),
          ElevatedButtonCustom(
              onPressed: () {
                context.read<AuthProvider>().login();
              },
              text: LocaleKeys.logText.tr() + LocaleKeys.inText.tr()),
          Align(
            alignment: Alignment.topLeft,
            child: TextButton(
              onPressed: () {
                AppRouter.pushNamed(RouteConstants.forgetPasswordRoute);
              },
              child: Text(
                LocaleKeys.forgetPasswordText.tr(),
                style: FontStyles.footerTextStyle
                    .copyWith(color: ColorsConst.grey400),
              ),
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
                      horizontal: PaddingConstants.padding25,
                      vertical: PaddingConstants.padding15))),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
                start: PaddingConstants.padding45,
                end: PaddingConstants.padding45,
                top: PaddingConstants.padding85),
            child: FooterTextCustom(
              text1: LocaleKeys.dontHaveAccountText.tr(),
              text2: LocaleKeys.signText.tr() + LocaleKeys.upText.tr(),
              onPressed: () {
                AppRouter.pushNamed(RouteConstants.signupRoute);
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          // ElevatedButtonCustom(
          //     onPressed: () {
          //       context.read<AuthProvider>().login();
          //       Controllers.txtEmail.text = "aseel@hotmail.com";
          //       Controllers.txtPassword.text = "123456";
          //     },
          //     text: "Quick Entry")
        ],
      ),
    );
  }
}
