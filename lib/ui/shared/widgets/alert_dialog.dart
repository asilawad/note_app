import 'package:flutter/material.dart';
import 'package:shop_app/utils/constants/padding_constants.dart';
import 'package:shop_app/utils/themes/text_theme.dart';

import '../../../utils/constants/colors_constants.dart';

class AlertDialogCustom extends StatelessWidget {
  const AlertDialogCustom(
      {Key? key, required this.errorMessage, required this.icon})
      : super(key: key);
  final String errorMessage;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: Colors.red,
            size: PaddingConstants.padding65,
          ),
          const SizedBox(
            height: PaddingConstants.padding20,
          ),
          Text(
            errorMessage,
            textAlign: TextAlign.start,
            style: FontStyles.textButtonStyle
                .copyWith(fontWeight: FontWeight.normal),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          child: Text(
            'OK',
            style: FontStyles.footerTextStyle
                .copyWith(color: ColorsConst.lightBlue),
          ),
        ),
      ],
      backgroundColor: ColorsConst.darkGey200,
    );
  }
}

class cicularIndicatorAlertCustom extends StatelessWidget {
  const cicularIndicatorAlertCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: AlertDialog(
        backgroundColor: ColorsConst.darkGey200.withOpacity(0.2),
        content: Center(
          child: CircularProgressIndicator(
            color: ColorsConst.green,
          ),
        ),
      ),
    );
  }
}
