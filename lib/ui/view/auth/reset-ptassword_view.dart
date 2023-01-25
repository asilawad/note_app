import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/ui/shared/widgets/elevated_button_custom.dart';
import 'package:shop_app/utils/l10n/locale_keys.g.dart';

import '../../../core/providers/auth_provider.dart';
import '../../../utils/constants/controllers.dart';
import '../../../utils/constants/padding_constants.dart';
import '../../shared/widgets/code_text_field_custom.dart';
import '../../shared/widgets/header_text_custom.dart';
import '../../shared/widgets/text_form_field_custom.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Controllers.txtCode1.text =
        (context.read<AuthProvider>().code % 10).toString();
    Controllers.txtCode2.text =
        (context.read<AuthProvider>().code % 10).toString();
    Controllers.txtCode3.text =
        (context.read<AuthProvider>().code % 10).toString();
    Controllers.txtCode4.text =
        (context.read<AuthProvider>().code % 10).toString();

    return Scaffold(
      body: ListView(
          padding: const EdgeInsets.symmetric(
              horizontal: PaddingConstants.padding25),
          children: [
            const SizedBox(
              height: PaddingConstants.padding85,
            ),
            HeaderTextCusto(
                text1: LocaleKeys.resetText.tr(),
                text2: LocaleKeys.passwordText.tr()),
            const SizedBox(
              height: PaddingConstants.padding85,
            ),
            TextFormFieldCustom(
                hintText: LocaleKeys.emailHintText.tr(),
                controller: Controllers.txtEmail,
                icon: Icons.alternate_email_outlined),
            Row(
              children: [
                CodeTextFieldCustom(
                  rightPadding: PaddingConstants.padding20,
                  controller: Controllers.txtCode1,
                ),
                CodeTextFieldCustom(
                    rightPadding: PaddingConstants.padding20,
                    controller: Controllers.txtCode2),
                CodeTextFieldCustom(
                    rightPadding: PaddingConstants.padding20,
                    controller: Controllers.txtCode3),
                CodeTextFieldCustom(
                    rightPadding: 0, controller: Controllers.txtCode4),
              ],
            ),
            TextFormFieldCustom(
                hintText: LocaleKeys.passwordText.tr(),
                controller: Controllers.txtPassword,
                icon: Icons.lock_open_outlined),
            TextFormFieldCustom(
                hintText: LocaleKeys.confirmPasswordText.tr(),
                controller: Controllers.txtConfirmPassword,
                icon: Icons.lock_open_outlined),
            const SizedBox(
              height: PaddingConstants.padding50,
            ),
            ElevatedButtonCustom(
                onPressed: () {
                  context.read<AuthProvider>().resendPassword();
                },
                text: LocaleKeys.resetText.tr() + LocaleKeys.passwordText.tr()),
          ]),
    );
  }
}
