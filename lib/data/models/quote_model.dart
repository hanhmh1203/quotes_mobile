import 'package:isar/isar.dart';
import 'package:quotes_mobile/data/json_models/quote_json_model.dart';

import 'author_model.dart';
import 'type_model.dart';

part 'quote_model.g.dart';

@collection
class QuoteModel {
  Id id = Isar.autoIncrement; // Auto increment ID
  late String content;
  late bool isFavorite; // New field to mark quote as favorite
  late bool isMine; // New field to mark quote as favorite
  final author = IsarLink<AuthorModel>();
  final quoteTypeModel =  IsarLinks<QuoteTypeModel>();
  factory QuoteModel.fromJsonModel(QuoteJsonModel json){
    var model = QuoteModel(content: json.content);

    List<String> arr = json.topic.split(",");
    List<QuoteTypeModel> quoteTypes = arr.map((e) => QuoteTypeModel(type: e.trim())).toList();
    model.quoteTypeModel.addAll(quoteTypes);

    AuthorModel authorModel = AuthorModel(name: json.author.trim(), bio: '');
    model.author.value = authorModel;
    return model;
  }
  QuoteModel({
    required this.content,
    this.isFavorite = false, // Default value is false
    this.isMine = false, // Default value is false
  });
}
