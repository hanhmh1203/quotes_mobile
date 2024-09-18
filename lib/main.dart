import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quotes_mobile/core/Constants.dart';
import 'package:quotes_mobile/core/log_helper.dart';
import 'package:quotes_mobile/data/models/author_model.dart';
import 'package:quotes_mobile/data/models/quote_model.dart';
import 'package:quotes_mobile/data/models/type_model.dart';
import 'package:quotes_mobile/ui/bottom_menu/bottom_nav_bar_screen.dart';
import 'package:quotes_mobile/ui/route_generator.dart';

import 'core/app_binding.dart';
import 'ui/init_app_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [AuthorModelSchema, QuoteModelSchema, QuoteTypeModelSchema],
    directory: dir.path,
  );
  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en', 'US'), Locale('vi', 'VN')],
        path: 'assets/translations',
        // <-- change the path of the translation files
        fallbackLocale: Locale('en', 'US'),
        useOnlyLangCode: false,
        child: MyApp(
          initRoute: AppInitHelper.getStartRoute(),
          isar: isar,
        )),
  );
  // runApp(MyApp(
  //   initRoute: AppInitHelper.getStartRoute(),
  //   isar: isar,
  // ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.initRoute, required this.isar});

  final Isar isar;
  final String initRoute;
  final List<GetPage> routes = RouteGenerator.routes;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LogHelper.showLog(message: "hanhmh1203 Get.deviceLocale: ${Get.deviceLocale}");
    LogHelper.showLog(message: "hanhmh1203 context.locale: ${context.locale}");
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: Get.deviceLocale,
      title: Constants.appName,
      theme: ThemeData(
        drawerTheme: const DrawerThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(0),
              bottomRight: Radius.circular(0),
            ),
          ),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialBinding: AppBinding(isar: isar),
      initialRoute: initRoute,
      getPages: routes,
      // home: BottomNavBar(),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
