import 'package:isar/isar.dart';

import '../models/type_model.dart';

class TypeRepository {
  late Isar isar;

  // late QuoteTypeModel _model;

  TypeRepository({required this.isar});

  void saveQuoteType() async {
    final quoteType = QuoteTypeModel(type: 'Inspirational');

    await isar.writeTxn(() async {
      await isar.quoteTypeModels.put(quoteType); // insert & update
    });
  }

  Future<List<QuoteTypeModel>> loadTypes() async {
    final types = await isar.quoteTypeModels.where().findAll();
    // for (var type in types) {
    //   type.quotes.loadSync();
    //   print('Quote Types: ${type.quotes.map((a) => a.content).join(', ')}');
    // }
    return types;
  }
}
