import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:quotes_mobile/ui/base_controller.dart';

import '../../data/models/quote_model.dart';
import '../../data/repositories/quote_repository.dart';

class MineController extends BaseController{
  RxList<QuoteModel> quotes = RxList();

  @override
  Future<void> onReady() async {
    // TODO: implement onReady
    super.onReady();
    // loadDataQuote();
    // parseJson();
  }
  Future<void> loadDataQuote() async {
    QuoteRepository repository = Get.find();
    var list = await repository.loadQuotesFav();
    quotes.clear();
    quotes.addAll(list);
  }
  @override
  void onClose() {
    // TODO: implement onClose
    quotes.close();
    super.onClose();
  }
}