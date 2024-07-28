import 'package:isar/isar.dart';

import '../models/type_model.dart';

class TypeRepository {
  late Isar isar;
  // late QuoteTypeModel _model;

  TypeRepository(this.isar);
  void saveQuoteType() async {
    final quoteType = QuoteTypeModel(type: 'Inspirational');

    await isar.writeTxn(() async {
      await isar.quoteTypeModels.put(quoteType); // insert & update
    });
  }
}
