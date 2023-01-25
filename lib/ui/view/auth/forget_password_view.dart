import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/core/providers/auth_provider.dart';
import 'package:shop_app/ui/shared/widgets/elevated_button_custom.dart';
import 'package:shop_app/utils/themes/text_theme.dart';
import '../../../utils/constants/controllers.dart';
import '../../../utils/constants/padding_constants.dart';
import '../../../utils/l10n/locale_keys.g.dart';
import '../../shared/widgets/header_text_custom.dart';
import '../../shared/widgets/text_form_field_custom.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding:
            const EdgeInsets.symmetric(horizontal: PaddingConstants.padding25),
        children: [
          const SizedBox(
            height: PaddingConstants.padding130,
          ),
          HeaderTextCusto(
              text1: LocaleKeys.resetText.tr(),
              text2: LocaleKeys.passwordText.tr()),
          const SizedBox(
            height: PaddingConstants.padding25,
          ),
          Text(
            LocaleKeys.enterEmailText.tr(),
            textAlign: TextAlign.center,
            style: FontStyles.subTitle1Style.copyWith(fontSize: 20),
          ),
          const SizedBox(
            height: PaddingConstants.padding65,
          ),
          TextFormFieldCustom(
              hintText: LocaleKeys.emailHintText.tr(),
              controller: Controllers.txtEmail,
              icon: Icons.alternate_email_outlined),
          const SizedBox(
            height: PaddingConstants.padding45,
          ),
          ElevatedButtonCustom(
              onPressed: () {
                context.read<AuthProvider>().forgetPassword();
              },
              text: LocaleKeys.nextText.tr()),
        ],
      ),
    );
  }
}
