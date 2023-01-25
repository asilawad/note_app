import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/core/providers/appearance_provider.dart';
import 'package:shop_app/core/providers/auth_provider.dart';
import 'package:shop_app/utils/constants/colors_constants.dart';
import 'package:shop_app/utils/themes/text_theme.dart';

class HebaCustom extends StatelessWidget {
  HebaCustom(
      {Key? key,
      required this.nameButton,
      required this.function,
      this.isLoader = false})
      : super(key: key);
  final String nameButton;
  final Function()? function;
  final bool isLoader;

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: ((context, provider, child) {
      print('in ui the loader is $isLoader');
      return Container(
        decoration: BoxDecoration(
            color: ColorsConst.green, borderRadius: BorderRadius.circular(6)),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
                minimumSize: Size(double.infinity, 44),
                primary: Colors.transparent,
                elevation: 0,
                padding: EdgeInsets.only(left: 25, right: 25)),
            onPressed: function,
            child: FittedBox(
              child: Row(
                children: [
                  Text(
                    nameButton,
                    style: FontStyles.textButtonStyle,
                  ),
                  Visibility(
                      visible: context.read<AppearanceProvider>().isLoading,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ))
                ],
              ),
            )),
      );
    }));
  }
}
