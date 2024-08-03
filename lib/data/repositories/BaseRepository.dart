import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/author_model.dart';
import '../models/quote_model.dart';
import '../models/type_model.dart';

class BaseRepository {
  Future<Isar> openIsar() async {

    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      final isar = await Isar.open(
        [AuthorModelSchema, QuoteModelSchema, QuoteTypeModelSchema],
        directory: dir.path,
      );
      print("BaseRepository openIsar new");
      return isar;
    }
    print("BaseRepository openIsar exists");
    return Future.value(Isar.getInstance());
  }
}
