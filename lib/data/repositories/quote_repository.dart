import 'package:isar/isar.dart';
import 'package:quotes_mobile/data/models/author_model.dart';
import 'package:quotes_mobile/data/models/type_model.dart';

import '../json_models/quote_json_model.dart';
import '../models/quote_model.dart';

class QuoteRepository {
  late Isar isar;

  QuoteRepository({required this.isar});

  void clearAllData() async {
    await isar.writeTxn(() async {
      await isar.quoteModels.clear();
      await isar.authorModels.clear();
      await isar.quoteTypeModels.clear();
    });
  }

  void saveQuoteSync(List<QuoteJsonModel> list) async {
    var data = list.map((e) => QuoteModel.fromJsonModel(e)).toList();
    for (var e in data) {
      var dbItem =
          await isar.quoteModels.where().contentEqualTo(e.content).findFirst();
      if (dbItem != null) {
        // do not save this item.
        continue;
      }
      if (e.tempAuthor != null) {
        var author = await isar.authorModels
            .where()
            .nameEqualTo(e.tempAuthor!.name)
            .findFirst();
        if (author != null) {
          e.author.value = author;
        } else {
          e.author.value = e.tempAuthor;
        }
      }
      List<QuoteTypeModel> types = [];
      for (var type in e.tempQuoteTypes) {
        QuoteTypeModel inputType;
        var first = await isar.quoteTypeModels
            .where()
            .typeEqualTo(type.type)
            .findFirst();
        if (first != null) {
          inputType = first;
          types.add(first);
        } else {
          inputType = type;
          types.add(type);
        }
        e.quoteTypeModel.add(inputType);
      }
      // save all relation.
      await isar.writeTxnSync(() async {
        isar.quoteModels.putSync(e);
      });
    }
  }
  @deprecated
  void saveQuote(List<QuoteJsonModel> list) async {
    var data = list.map((e) => QuoteModel.fromJsonModel(e)).toList();
    await isar.writeTxn(() async {
      for (var e in data) {
        if (e.tempAuthor != null) {
          var author = await isar.authorModels
              .where()
              .nameEqualTo(e.tempAuthor!.name)
              .findFirst();
          if (author != null) {
            e.author.value = author;
          } else {
            e.author.value = e.tempAuthor;
          }
          await isar.authorModels.put(e.author.value!);
        }
        await isar.quoteModels.put(e);
        await e.author.save();

        List<QuoteTypeModel> types = [];
        for (var type in e.tempQuoteTypes) {
          QuoteTypeModel inputType;
          var first = await isar.quoteTypeModels
              .where()
              .typeEqualTo(type.type)
              .findFirst();
          if (first != null) {
            inputType = first;
            types.add(first);
          } else {
            inputType = type;
            types.add(type);
          }
          await isar.quoteTypeModels.put(inputType);
          e.quoteTypeModel.add(inputType);
        }
        await e.quoteTypeModel.save();
      }
    });
  }
}
