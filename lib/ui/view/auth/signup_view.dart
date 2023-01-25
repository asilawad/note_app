import 'package:flutter/material.dart';
import 'package:shop_app/core/providers/appearance_provider.dart';
import 'package:shop_app/core/providers/auth_provider.dart';
import 'package:shop_app/ui/shared/widgets/elevated_button_custom.dart';
import 'package:shop_app/ui/shared/widgets/footer_text_custom.dart';
import 'package:shop_app/ui/shared/widgets/gender_custom.dart';
import 'package:shop_app/ui/shared/widgets/header_text_custom.dart';
import 'package:shop_app/utils/constants/colors_constants.dart';
import 'package:shop_app/utils/constants/controllers.dart';
import 'package:shop_app/ui/shared/widgets/text_form_field_custom.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shop_app/utils/constants/routes_constants.dart';
import 'package:shop_app/utils/routes/router.dart';
import 'package:shop_app/utils/themes/text_theme.dart';
import '../../../utils/constants/padding_constants.dart';
import '../../../utils/l10n/locale_keys.g.dart';
import '../../shared/widgets/alert_dialog.dart';
import 'package:shop_app/core/providers/validation_provider.dart';

class SignupView extends StatelessWidget {
  SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          padding: EdgeInsets.symmetric(horizontal: PaddingConstants.padding25),
          children: [
            const SizedBox(
              height: PaddingConstants.padding65,
            ),
            HeaderTextCusto(
                text1: LocaleKeys.signText.tr(), text2: LocaleKeys.upText.tr()),
            Center(
              child: const Text(
                LocaleKeys.createAnAccountText,
                style: FontStyles.subTitle1Style,
              ).tr(),
            ),
            const SizedBox(
              height: PaddingConstants.padding45,
            ),
            Form(
              key: Controllers.formkey,
              child: Column(children: [
                TextFormFieldCustom(
                  hintText: LocaleKeys.nameHintText.tr(),
                  controller: Controllers.txtName,
                  icon: Icons.person_outline_sharp,
                  validator: ValidationProvider.validateName,
                ),
                TextFormFieldCustom(
                  hintText: LocaleKeys.emailHintText.tr(),
                  controller: Controllers.txtEmail,
                  icon: Icons.alternate_email_outlined,
                  validator: ValidationProvider.validateEmail,
                ),
                TextFormFieldCustom(
                  hintText: LocaleKeys.passwordText.tr(),
                  controller: Controllers.txtPassword,
                  icon: Icons.lock_open_outlined,
                  validator: ValidationProvider.validatePassword,
                ),
              ]),
            ),
            Row(
              children: [
                GenderListileCustom(text: "Male", value: "M"),
                SizedBox(
                  width: 20,
                ),
                GenderListileCustom(text: "Female", value: "F"),
              ],
            ),
            SizedBox(
              height: PaddingConstants.padding15,
            ),
            Row(
              children: [
                Consumer<AppearanceProvider>(
                    builder: (context, provider, child) => Checkbox(
                          value: provider.checkBoxValue,
                          onChanged: (value) =>
                              provider.changeCheckBoxValue(value!),
                          activeColor: ColorsConst.green,
                        )),
                FooterTextCustom(
                    text1: "${LocaleKeys.agreeText.tr()} ",
                    text2: LocaleKeys.termsText.tr())
              ],
            ),
            const SizedBox(
              height: PaddingConstants.padding45,
            ),
            ElevatedButtonCustom(
              text: "${LocaleKeys.signText.tr()} ${LocaleKeys.upText.tr()}",
              onPressed: () {
                (!Controllers.formkey.currentState!.validate())
                    ? null
                    : (context.read<AppearanceProvider>().checkBoxValue)
                        ? context.read<AuthProvider>().register()
                        : showDialog(
                            context: AppRouter.navigatorKey.currentContext!,
                            builder: (BuildContext context) => AlertDialogCustom(
                                icon: Icons.error,
                                errorMessage:
                                    "${LocaleKeys.agreeText.tr()} ${LocaleKeys.termsText.tr()}"),
                          );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: PaddingConstants.padding85,
                  vertical: PaddingConstants.padding65),
              child: FooterTextCustom(
                text1: LocaleKeys.accountText.tr(),
                text2: LocaleKeys.logText.tr() + LocaleKeys.inText.tr(),
                onPressed: () {
                  AppRouter.pushNamed(RouteConstants.loginRoute);
                },
              ),
            )
          ]),
    );
  }
}
