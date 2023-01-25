import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/core/providers/appearance_provider.dart';
import 'package:shop_app/core/providers/task_provider.dart';
import 'package:shop_app/ui/shared/widgets/container_custom.dart';
import 'package:shop_app/ui/shared/widgets/delete_alert_dialog.dart';
import 'package:shop_app/ui/shared/widgets/header_text_custom.dart';
import 'package:shop_app/ui/shared/widgets/icon_box_custom.dart';
import 'package:shop_app/utils/constants/colors_constants.dart';
import 'package:shop_app/utils/constants/controllers.dart';
import 'package:shop_app/utils/constants/routes_constants.dart';
import 'package:shop_app/utils/l10n/locale_keys.g.dart';
import 'package:shop_app/utils/routes/router.dart';
import 'package:shop_app/utils/themes/text_theme.dart';
import '../../../utils/constants/padding_constants.dart';
import '../../shared/widgets/bottom_sheet_custom.dart';
import '../../shared/widgets/loading_containers.dart';
import '../../shared/widgets/no_notes_custom.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    context.read<TaskProvider>().fetchTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: SizedBox(
        height: PaddingConstants.padding70,
        width: PaddingConstants.padding70,
        child: FloatingActionButton(
            elevation: PaddingConstants.padding10,
            child: const Icon(
              Icons.add,
              size: PaddingConstants.padding50,
            ),
            onPressed: () {
              Controllers.taskTitle.clear();
              BottomSheetCustom(
                  LocaleKeys.addNoteText.tr(), LocaleKeys.saveText.tr(), () {
                context.read<TaskProvider>().createTask();
                Navigator.pop(context);
              });
            }),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          const SizedBox(
            height: PaddingConstants.padding25,
          ),
          ListTile(
            leading: HeaderTextCusto(
              text1: LocaleKeys.notesText.tr(),
              textAlign: TextAlign.start,
            ),
            tileColor: (!context.read<AppearanceProvider>().isDarkModeOn)
                ? ColorsConst.lightBlue
                : ColorsConst.black,
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconBoxCustom(
                  icon: Icons.search,
                  onPressed: () {
                    context.read<TaskProvider>().searchResult.clear();
                    Controllers.txtSearch.clear();
                    AppRouter.pushNamed(RouteConstants.searchRoute);
                  },
                ),
                const SizedBox(
                  width: PaddingConstants.padding10,
                ),
                IconBoxCustom(
                  icon: Icons.settings,
                  onPressed: () {
                    AppRouter.pushNamed(RouteConstants.settingsRoute);
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: PaddingConstants.padding45,
          ),
          Consumer<TaskProvider>(
              builder: (context, provider, child) => (!provider.hasData)
                  ? const loading_containers()
                  : (provider.taskList.isEmpty)
                      ? const NoNotesImage()
                      : Padding(
                          padding: const EdgeInsets.only(
                              left: PaddingConstants.padding25,
                              right: PaddingConstants.padding25,
                              bottom: PaddingConstants.padding60),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            itemCount: provider.filteredData.length,
                            itemBuilder: (context, index) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 40, bottom: 10),
                                  child: Text(
                                    provider.filteredData[index][0].created_at
                                        .split("T")[0],
                                    style: FontStyles.subTitle2Style,
                                  ),
                                ),
                                ListView.separated(
                                  shrinkWrap: true,
                                  physics: const ScrollPhysics(),
                                  itemCount:
                                      provider.filteredData[index].length,
                                  itemBuilder: (context, subIndex) =>
                                      ContainerCustom(
                                    text: provider
                                        .filteredData[index][subIndex].title,
                                    onPressed: () {
                                      Controllers.taskTitle.text = provider
                                          .filteredData[index][subIndex].title;
                                      BottomSheetCustom(
                                          LocaleKeys.editNote.tr(),
                                          LocaleKeys.editText.tr(), () {
                                        context.read<TaskProvider>().updateTask(
                                            provider.filteredData[index]
                                                [subIndex]);
                                        Navigator.pop(context);
                                      });
                                    },
                                    onLongPress: () {
                                      DeleteAlertDialog(onPressed: () {
                                        provider.deleteTask(provider
                                            .filteredData[index][subIndex].id);
                                        Navigator.pop(context, true);
                                      });
                                    },
                                  ),
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                    height: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
        ],
      ),
    );
  }
}
