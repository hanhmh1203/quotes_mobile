import 'package:get/get.dart';
import 'package:quotes_mobile/ui/mine/demo_crud_mine/database_helper.dart';
import 'package:quotes_mobile/ui/mine/demo_crud_mine/quote_model.dart';

class MineController extends GetxController {
  var quotes = <QuoteModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadQuotes();
  }

  Future<void> _loadQuotes() async {
    final data = await DatabaseHelper().getQuotes();
    quotes.value = data.map((item) => QuoteModel.fromMap(item)).toList();
  }

  Future<void> addQuote(QuoteModel quote) async {
    await DatabaseHelper().insertQuote(quote.quote, quote.author, quote.type);
    _loadQuotes();
  }
}
