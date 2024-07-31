import 'package:isar/isar.dart';
import 'package:quotes_mobile/data/models/author_model.dart';
import 'package:quotes_mobile/data/models/type_model.dart';

import '../json_models/quote_json_model.dart';
import '../models/quote_model.dart';

class QuoteRepository {
  late Isar isar;

  QuoteRepository({required this.isar});

  saveQuote(List<QuoteJsonModel> list) async {
    var data = list.map((e) => QuoteModel.fromJsonModel(e)).toList();

    for (var e in data) {
      if (e.author.value != null) {
        var author = await isar.authorModels
            .where()
            .nameEqualTo(e.author.value!.name)
            .findFirst();
        if (author != null) {
          e.author.value = author;
        } else {
          await isar.writeTxn(() async {
            await isar.authorModels.put(e.author.value!);
          });
        }
      }

      List<QuoteTypeModel> types = [];
      print("saveQuote quoteTypeModel ${e.quoteTypeModel.isNotEmpty}");
      for (var type in e.quoteTypeModel) {
        var first = await isar.quoteTypeModels
            .where()
            .typeEqualTo(type.type)
            .findFirst();
        if (first != null) {
          types.add(first);
          print("saveQuote type: query notnull $first");
        } else {
          await isar.quoteTypeModels.put(type);
          print("saveQuote type: ${type}");
          types.add(type);
        }
      }
      e.quoteTypeModel.clear();
      e.quoteTypeModel.addAll(types);
      isar.writeTxnSync((){
        isar.quoteModels.putSync(e);
      });
    }
    // isar.writeTxnSync((){
    //     isar.quoteModels.putAllSync(data);
    // });
    // await isar.writeTxn(() async {
    //   for (var item in data) {
    //     await isar.quoteModels.put(item);
    //   }
    // });
  }
}
