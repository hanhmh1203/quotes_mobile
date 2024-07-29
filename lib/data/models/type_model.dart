import 'package:isar/isar.dart';

part 'type_model.g.dart';
@collection
class QuoteTypeModel {
  Id id = Isar.autoIncrement; // Auto increment ID
  @Index(unique: true)
  late String type;

  QuoteTypeModel({required this.type});
}
