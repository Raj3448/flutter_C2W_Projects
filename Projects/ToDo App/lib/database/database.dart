import 'package:demo/app_theme.dart';
import 'package:demo/model/expense_details_model.dart';
import 'package:demo/services/expensedb_api.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<void> initializeDataBase() async {
  await deleteDatabase(await getDatabasesPath());
  AppTheme.database = await openDatabase(
      join(await getDatabasesPath(), 'ExpenseDetails.db'),
      version: 1, onCreate: (Database db, int version) async {
    await db.execute(
        '''CREATE TABLE ${ExpenseDbApi.expenseDBName} (id text PRIMARY KEY, title text , description text , datetime text , storedImage text , amount text)''');
  });
  await ExpenseDbApi.insert(ExpenseDetailsModel(
    id: '1',
    title: 'Testing1',
    description: 'dhghcjhdjd djchdjkchdcd cdjcdjch',
    datetime: 'Sat, 3/9/2024',
    amount: '353554',
  ));
  await ExpenseDbApi.insert(ExpenseDetailsModel(
    id: '2',
    title: 'Testing2',
    description: 'dhghcjhdjd djchdjkchdcd cdjcdjch',
    datetime: 'Fri, 3/8/2024',
    amount: '345454',
  ));
  ExpenseDbApi.getExpenseModelList().then((value) {
    value.forEach((element) => print(element.toString()));
  });

  await ExpenseDbApi.update(ExpenseDetailsModel(
    id: '2',
    title: 'Testing2 cha 4',
    description: 'dhghcjhdjd djchdjkchdcd cdjcdjch',
    datetime: 'Fri, 3/8/2024',
    amount: '345454',
  ));


  ExpenseDbApi.getExpenseModelList().then((value) {
    value.forEach((element) => print(element.toString()));
  });
}
