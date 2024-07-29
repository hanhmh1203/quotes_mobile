import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:isar/isar.dart';
import 'package:quotes_mobile/data/repositories/author_repository.dart';
import 'package:quotes_mobile/data/repositories/quote_repository.dart';
import 'package:quotes_mobile/data/repositories/type_repository.dart';

class AppBinding extends Bindings {
  final Isar isar;

  AppBinding({required this.isar});

  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(AuthorRepository(isar: isar));
    Get.put(QuoteRepository(isar: isar));
    Get.put(TypeRepository(isar: isar));
  }
}
