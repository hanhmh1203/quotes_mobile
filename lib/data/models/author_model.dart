import 'package:isar/isar.dart';
part 'author_model.g.dart';
@collection
class AuthorModel{
  Id id = Isar.autoIncrement; // Auto increment ID

  late String name;

  late String bio;

  AuthorModel({required this.name, required this.bio});
}