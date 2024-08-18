import 'package:get/get.dart';
import 'package:quotes_mobile/data/models/quote_model.dart';
import 'package:quotes_mobile/data/repositories/quote_repository.dart';
import 'package:quotes_mobile/ui/base_controller.dart';
import 'package:quotes_mobile/ui/view_item/view_item_page.dart';
import 'package:share_plus/share_plus.dart';

class QuoteItemController extends BaseController {
  QuoteViewModel quoteVM;

  QuoteItemController(this.quoteVM);

  QuoteRepository quoteRepository = Get.find();

  toggleFavorite() async {
    quoteVM.isFav.value = !quoteVM.isFav.value;
    await quoteRepository.saveQuoteFav(quoteVM.isFav.value, quoteVM.id);
  }
  shareQuote() async {
    final String quoteText = '"${quoteVM.content}" - ${quoteVM.author}';
    await Share.share(quoteText);
  }
}
