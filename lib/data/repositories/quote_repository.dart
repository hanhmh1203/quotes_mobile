import 'package:isar/isar.dart';

import '../models/quote_model.dart';

class QuoteRepository {
  late Isar isar;

  QuoteRepository({required this.isar});

  saveQuote(List<QuoteModel>data) {
    // isar.writeTxnSync(() {
    //   isar.quoteModels.putAllSync(data);
    // });
    // for (QuoteModel model in data) {
    //   isar.writeTxnSync(() {
    //     isar.quoteModels.putAllSync(objects)
    //   });
    // }
  }
}
