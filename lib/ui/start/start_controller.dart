import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:quotes_mobile/core/read_json_helper.dart';
import 'package:quotes_mobile/data/models/quote_model.dart';
import 'package:quotes_mobile/data/repositories/quote_repository.dart';
import 'package:quotes_mobile/ui/base_controller.dart';

import '../../data/json_models/quote_json_model.dart';

class StartController extends BaseController {
  @override
  Future<void> onReady() async {
    // TODO: implement onReady
    super.onReady();
  }

  Future<void> parseJson() async {
    List<QuoteJsonModel> data = await ReadJsonFileHelper.readDummyData();

    QuoteRepository repository = Get.find();
    repository.saveQuote(data);
  }
}
