import 'package:flutter/material.dart';

import '../../../utils/constants/colors_constants.dart';
import '../../../utils/routes/router.dart';
import '../../../utils/themes/text_theme.dart';

DeleteAlertDialog({onPressed}) {
  showDialog(
      context: AppRouter.navigatorKey.currentContext!,
      builder: (BuildContext context) => AlertDialog(
          backgroundColor: ColorsConst.darkGey200,
          title: Center(
            child: Text("Do you want to delete this note?",
                style: FontStyles.textButtonStyle
                    .copyWith(fontWeight: FontWeight.normal)),
          ),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.grey),
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: Text("cancel")),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                  onPressed: onPressed,
                  child: Text("Delete")),
            ],
          )));
}
