import 'package:demo/app_theme.dart';
import 'package:demo/model/expense_details_model.dart';
import 'package:sqflite/sqflite.dart';

class ExpenseDbApi {
  static String expenseDBName = 'ExpenseDetails';

  static Future<List<ExpenseDetailsModel>> getExpenseModelList() async {
    List<Map<String, dynamic>> retrivedMap =
        await AppTheme.database!.query(expenseDBName);
    return List.generate(retrivedMap.length, (index) {
      return ExpenseDetailsModel.fromJson(retrivedMap[index]);
    });
  }

  static Future<void> insert(ExpenseDetailsModel instance) async {
    try {
      print(instance.amount.runtimeType);
      int insertedRowId = await AppTheme.database!.insert(
          expenseDBName, instance.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace);
      print('Data Inserted....!!!');
      print('Inserted Row Id : $insertedRowId');
    } catch (error) {
      print('Error During data insert : $error');
    }
  }

  static Future<int> delete(String id) async {
    int ret = await AppTheme.database!
        .delete(expenseDBName, where: 'id = ? ', whereArgs: [id]);
    print('Expense Instance deleted Successfully at $ret');
    return ret;
  }

  static Future<int> update(ExpenseDetailsModel instance) async {
    print('Update instance id : ${instance.id}');
    int ret = await AppTheme.database!.update(
      expenseDBName,
      instance.toJson(),
      where: 'id = ?',
      whereArgs: [instance.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print("Update at Id : $ret");

    return ret;
  }

  static Future<ExpenseDetailsModel> getExpenseModelItem(String id) async {
    return ExpenseDetailsModel.fromJson((await AppTheme.database!
            .query(expenseDBName, where: 'id = ?', whereArgs: [id], limit: 1))
        .first);
  }
}
