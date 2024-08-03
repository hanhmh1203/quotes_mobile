import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quotes_mobile/core/Constants.dart';
import 'package:quotes_mobile/data/models/author_model.dart';
import 'package:quotes_mobile/data/models/quote_model.dart';
import 'package:quotes_mobile/data/models/type_model.dart';
import 'package:quotes_mobile/ui/bottom_menu/bottom_nav_bar.dart';
import 'package:quotes_mobile/ui/route_generator.dart';

import 'core/app_binding.dart';
import 'ui/init_app_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [AuthorModelSchema, QuoteModelSchema, QuoteTypeModelSchema],
    directory: dir.path,
  );
  runApp(MyApp(
    initRoute: AppInitHelper.getStartRoute(),
    isar: isar,
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.initRoute, required this.isar});

  final Isar isar;
  final String initRoute;
  final List<GetPage> routes = RouteGenerator.routes;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: Constants.appName,
      theme: ThemeData(
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
