import 'package:isar/isar.dart';
import 'package:quotes_mobile/data/models/quote_model.dart';
part 'author_model.g.dart';
@collection
class AuthorModel{
  Id id = Isar.autoIncrement; // Auto increment ID

  @Index(unique: true)
  late String name;

  String? bio;
  final quotes = IsarLinks<QuoteModel>();
  AuthorModel({required this.name, this.bio});

}