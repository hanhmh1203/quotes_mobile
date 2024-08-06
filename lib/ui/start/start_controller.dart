import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:quotes_mobile/core/read_json_helper.dart';
import 'package:quotes_mobile/data/models/author_model.dart';
import 'package:quotes_mobile/data/models/quote_model.dart';
import 'package:quotes_mobile/data/models/type_model.dart';
import 'package:quotes_mobile/data/repositories/author_repository.dart';
import 'package:quotes_mobile/data/repositories/quote_repository.dart';
import 'package:quotes_mobile/data/repositories/type_repository.dart';
import 'package:quotes_mobile/ui/base_controller.dart';

import '../../data/json_models/quote_json_model.dart';

class StartController extends BaseController {
  RxList<QuoteModel> quotes = RxList();
  @override
  Future<void> onReady() async {
    // TODO: implement onReady
    super.onReady();
    loadDataQuote();
    // parseJson();
  }

  Future<void> parseJson() async {
    List<QuoteJsonModel> data = await ReadJsonFileHelper.readDummyData();

    QuoteRepository repository = Get.find();
    repository.clearAllData();
    repository.saveQuoteSync(data);
    // await repository.loadQuotes();
  }

  Future<void> loadDataQuote() async {
    QuoteRepository repository = Get.find();
    var list = await repository.loadQuotes();
    quotes.clear();
    print("hanhmh1203 loadDataQuote:${quotes.length}");
    quotes.addAll(list);

  }

  Future<void> loadQuoteByType({required QuoteTypeModel typeModel}) async {
    print("hanhmh1203 loadQuoteByType:${typeModel}");
    QuoteRepository repository = Get.find();
    var list = await repository.loadQuotesByType(typeModel: typeModel);
    quotes.clear();
    quotes.addAll(list);
    // print("loadQuoteByType list:${list.length}");
  }

  Future<void> loadDataAuthor() async {
    AuthorRepository repository = Get.find();
    await repository.loadAuthors();
  }

  Future<void> loadDataType() async {
    TypeRepository repository = Get.find();
    var list = await repository.loadTypes();
  }
}
