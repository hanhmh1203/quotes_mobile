import 'package:isar/isar.dart';
import 'package:quotes_mobile/data/models/quote_model.dart';

part 'type_model.g.dart';

@collection
class QuoteTypeModel {
  Id id = Isar.autoIncrement; // Auto increment ID
  @Index(unique: true)
  late String type;
  // backlink name must same with variable name.
  @Backlink(to: 'quoteTypeModel')
  final quotes = IsarLinks<QuoteModel>();
  QuoteTypeModel({required this.type});

  @override
  String toString() {
    return 'QuoteTypeModel{id: $id, type: $type, quotes: $quotes}';
  }
  bool operator == (Object other) =>
      identical(this, other) ||
          other is QuoteTypeModel &&
              runtimeType == other.runtimeType &&
              type == other.type;
  @override
  int get hashCode => type.hashCode;
// @override
  // String toString() {
  //   return 'QuoteTypeModel{id: $id, type: $type}';
  // }

}
