import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:quotes_mobile/core/log_helper.dart';
import 'package:quotes_mobile/core/read_json_helper.dart';
import 'package:quotes_mobile/core/shared_utils.dart';
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
  RxString title = tr("app_name").obs;
  SharedUtils sharedUtils = Get.find();

  @override
  void onClose() {
    // TODO: implement onClose
    quotes.close();
    title.close();
    super.onClose();
  }

  setTitle(String value) {
    title.value = value;
  }

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    if (!await sharedUtils.isDBInit()) {
      LogHelper.showLog(
          className: 'StartController',
          funcName: 'onReady',
          message: 'sharedUtils.isDBInit = false');
      await parseJson();
      await sharedUtils.saveDBInit(true);
    }
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    // TODO: implement onReady
    super.onReady();
    loadDataQuote();
  }

  Future<void> parseJson() async {
    List<QuoteJsonModel> data = await ReadJsonFileHelper.readDummyData();
    QuoteRepository repository = Get.find();
    repository.clearAllData();
    repository.saveQuoteSync(data);
    // await repository.loadQuotes();
  }

  Future<void> loadDataQuote() async {
    setTitle(tr("app_name"));
    quotes.clear();
    QuoteRepository repository = Get.find();
    var list = await repository.loadQuotes();
    quotes.addAll(list);
  }

  Future<void> loadQuoteByType({required QuoteTypeModel typeModel}) async {
    QuoteRepository repository = Get.find();
    quotes.clear();
    var list = await repository.loadQuotesByType(typeModel: typeModel);
    quotes.addAll(list);

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
