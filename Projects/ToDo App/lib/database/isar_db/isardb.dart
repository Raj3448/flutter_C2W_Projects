import 'package:demo/model/isar_db/expense_model.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open([ExpenseModelIsarSchema],
          inspector: true, directory: dir.path);
    }
    return Future.value(Isar.getInstance());
  }