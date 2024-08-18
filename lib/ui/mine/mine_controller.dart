import 'package:get/get.dart';
import 'package:quotes_mobile/core/log_helper.dart';
import 'package:quotes_mobile/data/models/quote_model.dart';
import 'package:quotes_mobile/data/repositories/quote_repository.dart';
import 'package:quotes_mobile/ui/base_controller.dart';
import 'package:quotes_mobile/ui/mine/quote_mine_view_model.dart';

class MineController extends BaseController {
  var quotes = <QuoteModel>[].obs;
  QuoteRepository quoteRepository= Get.find();

  @override
  void onInit() {
    super.onInit();
    loadQuotes();
  }
  @override
  void onReady(){
    super.onReady();
    loadQuotes();
  }

  Future<void> loadQuotes() async {
    // final data = await DatabaseHelper().getQuotes();
    // quotes.value = data.map((item) => QuoteMineModel.fromMap(item)).toList();
    List<QuoteModel> quotesDB = await quoteRepository.loadMyQuotes();
    LogHelper.showLog(message: "quotesDB:${quotesDB.length}");
    quotes.value = quotesDB;
    // quotes.value = quotesDB.map((item) => QuoteMineModel.quoteModel(item)).toList();
  }


  Future<void> addQuote(QuoteMineViewModel quote) async {
    QuoteModel quoteModel = QuoteModel.fromMyInput(quote);
    await quoteRepository.saveAQuote(quoteModel);
    loadQuotes();
    // fromMyInput
    // await DatabaseHelper().insertQuote(quote.quote, quote.author, quote.type);
    // _loadQuotes();
  }

}
