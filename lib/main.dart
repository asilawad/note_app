import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/core/providers/appearance_provider.dart';
import 'package:shop_app/core/providers/auth_provider.dart';
import 'package:shop_app/core/providers/task_provider.dart';
import 'package:shop_app/utils/constants/routes_constants.dart';
import 'package:shop_app/utils/routes/route_generator.dart';
import 'package:shop_app/utils/routes/router.dart';
import 'package:shop_app/utils/themes/theme_data.dart';
import 'utils/l10n/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
    supportedLocales: L10n.all,
    path: 'assets/l10n',
    fallbackLocale: L10n.all[0],
    child: MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => AuthProvider()),
      ChangeNotifierProvider(create: (context) => AppearanceProvider()),
      ChangeNotifierProvider(create: (context) => TaskProvider())
    ], child: MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: (Provider.of<AppearanceProvider>(context).isDarkModeOn)
          ? AppTheme.darkTheme
          : AppTheme.lightTheme,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      initialRoute: RouteConstants.loginRoute,
      onGenerateRoute: RouteGenerator.generateRoutes,
      navigatorKey: AppRouter.navigatorKey,
    );
  }
}
