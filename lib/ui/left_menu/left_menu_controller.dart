import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:quotes_mobile/data/models/type_model.dart';
import 'package:quotes_mobile/data/repositories/author_repository.dart';
import 'package:quotes_mobile/data/repositories/type_repository.dart';
import 'package:quotes_mobile/ui/base_controller.dart';

import '../../core/log_helper.dart';
import '../../data/models/author_model.dart';
import '../start/start_controller.dart';

class LeftMenuController extends BaseController {
  AuthorRepository authorRepository = Get.find();
  TypeRepository typeRepository = Get.find();
  RxList<AuthorModel> authors = RxList();
  RxList<QuoteTypeModel> types = RxList();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // loadType();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    authors.close();
    types.close();
  }
  setType(List<QuoteTypeModel>_types){
    types.clear();
    types.addAll(_types);
  }
  clickItem({required QuoteTypeModel typeModel}){
    StartController controller = Get.find();
    controller.setTitle(typeModel.type);
    controller.loadQuoteByType(typeModel: typeModel);
  }
}
