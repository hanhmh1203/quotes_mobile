import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'app_routes.dart';
import 'bottom_menu/bottom_nav_bar.dart';
import 'start/start_page.dart';

class EnsureAuthenticatedMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    return RouteSettings(name: AppRoutes.startScreen);
  }

  @override
  GetPage? onPageCalled(GetPage? page) {
    return null;
  }
}

class RouteGenerator {
  static List<GetPage> routes = [
    GetPage(
        name: AppRoutes.startScreen,
        page: () => const BottomNavBar(),
        transition: Transition.rightToLeftWithFade,
        binding: BindingsBuilder(() {
          Get.lazyPut(() => StartController());
        })),
  ];
}
