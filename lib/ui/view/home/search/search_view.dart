import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/utils/constants/controllers.dart';
import '../../../../core/providers/task_provider.dart';
import '../../../../utils/constants/colors_constants.dart';
import '../../../../utils/constants/padding_constants.dart';
import '../../../../utils/l10n/locale_keys.g.dart';
import '../../../../utils/themes/text_theme.dart';
import '../../../shared/widgets/bottom_sheet_custom.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            width: 60,
            child: TextFormField(
              autofocus: true,
              onChanged: (value) {
                context.read<TaskProvider>().search(value.toLowerCase());
              },
              controller: Controllers.txtSearch,
              style:
                  FontStyles.hitTextStyle.copyWith(fontWeight: FontWeight.w400),
              decoration: InputDecoration(
                hintText: "Search by the keyword..",
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(6.0),
                ),
                filled: true,
              ),
            ),
          ),
          Consumer<TaskProvider>(
              builder: (context, provider, child) => (provider
                          .searchResult.isEmpty &&
                      provider.didSearch)
                  ? const SizedBox()
                  : (provider.searchResult.isEmpty && !provider.didSearch)
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 130,
                            ),
                            Image.asset(
                              "assets/images/search.png",
                              alignment: Alignment.center,
                            ),
                            const SizedBox(
                              height: PaddingConstants.padding15,
                            ),
                            Text(
                              "File not found. Try searching again",
                              style: FontStyles.subTitle2Style,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemCount: provider.searchResult.length,
                          itemBuilder: (context, index) => ListTile(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 15),
                            title: Text(
                              provider.searchResult[index].title,
                              style: FontStyles.footerTextStyle
                                  .copyWith(fontSize: 18),
                            ),
                            shape: Border(
                                bottom: BorderSide(color: ColorsConst.black)),
                            onTap: () {
                              Controllers.taskTitle.text =
                                  provider.searchResult[index].title;

                              BottomSheetCustom(
                                LocaleKeys.editNote.tr(),
                                LocaleKeys.editText.tr(),
                                () {
                                  context
                                      .read<TaskProvider>()
                                      .updateTask(provider.searchResult[index]);
                                  Navigator.pop(context);
                                  context
                                      .read<TaskProvider>()
                                      .searchResult
                                      .clear();
                                  Controllers.txtSearch.clear();
                                },
                              );
                            },
                          ),
                        )),
        ],
      ),
    );
  }
}
