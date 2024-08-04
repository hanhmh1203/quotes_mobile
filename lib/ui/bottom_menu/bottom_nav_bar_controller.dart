import 'package:get/get.dart';
import 'package:quotes_mobile/ui/base_controller.dart';

class BottomNavBarController extends BaseController {
  var selectedIndex = 0.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}
