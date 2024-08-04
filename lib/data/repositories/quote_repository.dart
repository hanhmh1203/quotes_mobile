import 'package:isar/isar.dart';
import 'package:quotes_mobile/data/models/author_model.dart';
import 'package:quotes_mobile/data/models/type_model.dart';
import 'package:quotes_mobile/data/repositories/BaseRepository.dart';

import '../json_models/quote_json_model.dart';
import '../models/quote_model.dart';

class QuoteRepository extends BaseRepository{
  late Isar isar;

  QuoteRepository({required this.isar});

  void clearAllData() async {
    // await isar.writeTxn(() async {
    //   await isar.quoteModels.clear();
    //   await isar.authorModels.clear();
    //   await isar.quoteTypeModels.clear();
    // });
    isar.writeTxnSync(() {
      isar.quoteModels.clearSync();
      isar.authorModels.clearSync();
      isar.quoteTypeModels.clearSync();
    });
  }

  Future<List<QuoteModel>> loadQuotes() async {
    final quotes = await isar.quoteModels.where().findAll();
    print("--- loadQuotes quotes lengh: ${quotes.length}");
    for (var quote in quotes) {

      quote.author.loadSync();
      quote.quoteTypeModel.loadSync();

      // Assign linked data to temporary variables for easy access
      quote.tempQuoteTypes = quote.quoteTypeModel.toList();

      // Print or use the data as needed
      print('Quote: ${quote.content}');
      // print('Author: ${quote.tempAuthor?.name}');
      print('quote.author: ${quote.author.value?.name ?? "null"}');
      print(
          'Quote Types: ${quote.tempQuoteTypes.map((type) => type.type).join(', ')}');
    }

    final authors = await isar.authorModels.where().findAll();
    print("--- loadQuotes authors lengh: ${authors.length}");
    return quotes;
  }
  Future<List<QuoteModel>> loadQuotesByType({required QuoteTypeModel typeModel}) async {
    typeModel.quotes.loadSync();
    return typeModel.quotes.toList();
    final quotes = await isar.quoteModels.where().findAll();
    print("--- loadQuotes quotes lengh: ${quotes.length}");
    for (var quote in quotes) {

      quote.author.loadSync();
      quote.quoteTypeModel.loadSync();

      // Assign linked data to temporary variables for easy access
      quote.tempQuoteTypes = quote.quoteTypeModel.toList();

      // Print or use the data as needed
      print('Quote: ${quote.content}');
      // print('Author: ${quote.tempAuthor?.name}');
      print('quote.author: ${quote.author.value?.name ?? "null"}');
      print(
          'Quote Types: ${quote.tempQuoteTypes.map((type) => type.type).join(', ')}');
    }

    final authors = await isar.authorModels.where().findAll();
    print("--- loadQuotes authors lengh: ${authors.length}");
    return quotes;
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
