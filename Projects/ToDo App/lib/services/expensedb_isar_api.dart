import 'package:demo/database/isar_db/isardb.dart';
import 'package:demo/model/isar_db/expense_model.dart';
import 'package:isar/isar.dart';

class ExpenseIsarDb {
  late Future<Isar> db;
  static final ExpenseIsarDb _instance = ExpenseIsarDb._private();

  factory ExpenseIsarDb() {
    return _instance;
  }
  ExpenseIsarDb._private() {
    print('Isar data base is initialized');
    db = openDB();
  }

  Future<void> insert(ExpenseModelIsar newInstance) async {
    final isar = await db;
    isar.writeTxnSync(() => isar.expenseModelIsars.putSync(
          newInstance,
        ));
  }

  Future<void> update(ExpenseModelIsar newInstance) async {
    final isar = await db;
    isar.writeTxn(() => isar.expenseModelIsars.put(newInstance));
  }

  Future<void> delete(String id) async {
    final isar = await db;
    isar.writeTxn(() => isar.expenseModelIsars.delete(int.parse(id)));
  }

  Future<ExpenseModelIsar?> getExpenseModelItem(String id) async {
    final isar = await db;
    return await isar.expenseModelIsars.get(int.parse(id));
  }

  Future<void> cleanDb() async {
    final isar = await db;
    await isar.writeTxn(() => isar.clear());
  }

  Future<List<ExpenseModelIsar>> getIsarExpenseModelList() async {
    final isar = await db;
    return await isar.expenseModelIsars.where().findAll();
  }

  Stream<List<ExpenseModelIsar>> listenToExpenseModels() async* {
    final isar = await db;
    yield* await isar.expenseModelIsars.where().watch();
  }
}
