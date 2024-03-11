import 'package:isar/isar.dart';

part 'expense_model.g.dart';

@Collection()
class ExpenseModelIsar {
  
  Id id = Isar.autoIncrement;
  String title;
  String description;
  String datetime;
  String storedImage = 'assets';
  String amount;
  ExpenseModelIsar({
    
    required this.title,
    required this.description,
    required this.datetime,
    required this.amount,
  });
}
