import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:isar/isar.dart';
import 'package:quotes_mobile/core/shared_utils.dart';
import 'package:quotes_mobile/data/repositories/author_repository.dart';
import 'package:quotes_mobile/data/repositories/quote_repository.dart';
import 'package:quotes_mobile/data/repositories/type_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppBinding extends Bindings {
  final Isar isar;

  AppBinding({required this.isar});

  @override
  Future<void> dependencies() async {
    // TODO: implement dependencies
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Get.lazyPut(() => SharedUtils(prefs: sharedPreferences));
    Get.put(AuthorRepository(isar: isar));
    Get.put(QuoteRepository(isar: isar));
    Get.put(TypeRepository(isar: isar));
  }
}
