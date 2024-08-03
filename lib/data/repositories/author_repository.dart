import 'package:isar/isar.dart';
import 'package:quotes_mobile/data/models/author_model.dart';

import 'BaseRepository.dart';

class AuthorRepository extends BaseRepository {
  late Isar isar;

  AuthorRepository({required this.isar});

  Future<List<AuthorModel>> loadAuthors() async {
    isar = await openIsar();
    final authors = await isar.authorModels.where().findAll();
    print("--- loadAuthors author lengh: ${authors.length}");
    for (var author in authors) {
      author.quotes.loadSync();
      print(
          'Quote Types: ${author.quotes.map((a) => a.content).join(', ')}');
    }
    return authors;
  }
}
