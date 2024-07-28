import 'package:isar/isar.dart';

import 'author_model.dart';
import 'type_model.dart';

part 'quote_model.g.dart';

@collection
class QuoteModel {
  Id id = Isar.autoIncrement; // Auto increment ID

  late String content;
  late int authorId;
  late int quoteTypeId;
  late bool isFavorite; // New field to mark quote as favorite
  late bool isMine; // New field to mark quote as favorite

  QuoteModel({
    required this.content,
    required this.authorId,
    required this.quoteTypeId,
    this.isFavorite = false, // Default value is false
    this.isMine = false, // Default value is false
  });
}
