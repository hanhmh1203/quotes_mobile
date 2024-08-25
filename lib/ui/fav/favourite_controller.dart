import 'package:get/get.dart';
import 'package:quotes_mobile/core/log_helper.dart';
import 'package:quotes_mobile/ui/base_controller.dart';

import '../../data/models/quote_model.dart';
import '../../data/repositories/quote_repository.dart';

class FavouriteController extends BaseController {
  RxList<QuoteModel> quotes = <QuoteModel>[].obs;

  @override
  Future<void> onReady() async {
    // TODO: implement onReady
    super.onReady();
    loadDataQuote();
    // parseJson();
  }

  Future<void> loadDataQuote() async {
    quotes.clear();
    QuoteRepository repository = Get.find();
    var list = await repository.loadQuotesFav();
    quotes.addAll(list);
    refresh();
  }

  Future<void> updateFav(int id) async {
    int index = quotes.indexWhere((e){
      return e.id == id;
    });
    quotes.removeAt(index);
    refresh();
  }
}
