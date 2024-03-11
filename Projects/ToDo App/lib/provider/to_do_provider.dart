import 'package:demo/model/expense_details_model.dart';
import 'package:demo/model/individual_chart_data.dart';
import 'package:demo/model/isar_db/expense_model.dart';
import 'package:demo/services/expensedb_isar_api.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ToDoProvider extends ChangeNotifier {
  final List<ExpenseDetailsModel> _todoModelList = [];

  Future<List<ExpenseModelIsar>> get getTodoModelList async {
    //return await ExpenseDbApi.getExpenseModelList();
    return await ExpenseIsarDb().getIsarExpenseModelList();
  }

  Future<List<ExpenseModelIsar>> get getExpensesInPrev7Days async {
    final reterivedList = await ExpenseIsarDb().getIsarExpenseModelList();
    return reterivedList.where((instance) {
      return DateFormat("E, M/d/yyyy")
          .parse(instance.datetime)
          .isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }

  void updateItem(ExpenseModelIsar instance) {
    // _todoModelList.firstWhere((element) {
    //   if (element.id == instance.id) {
    //     element.title = instance.title;
    //     element.datetime = instance.datetime;
    //     element.description = instance.description;
    //     element.amount = instance.amount;
    //     return true;
    //   } else {
    //     return false;
    //   }
    // });
    ExpenseIsarDb().update(instance);
    notifyListeners();
  }

  void addToDoItem(ExpenseModelIsar instance) {
    //_todoModelList.add(instance);
    ExpenseIsarDb().insert(instance);
    print('Item Added');
    notifyListeners();
  }

  void removeToDoItem(String id) {
    _todoModelList.removeWhere((element) => element.id == id);
    ExpenseIsarDb().delete(id);
    notifyListeners();
  }

  Future<ExpenseModelIsar?> getToDoItem(String id) async {
    return await ExpenseIsarDb().getExpenseModelItem(id);
  }

  Future<List<IndividualChartData>> getChartData() async {
    List<ExpenseModelIsar> expensList = await getExpensesInPrev7Days;
    List<double> weekAmounts = List<double>.filled(7, 0.0);

    List<IndividualChartData> chartList = List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(days: index));
      for (int i = 0; i < expensList.length; i++) {
        if (weekday.day ==
                DateFormat("E, M/d/yyyy").parse(expensList[i].datetime).day &&
            weekday.month ==
                DateFormat("E, M/d/yyyy").parse(expensList[i].datetime).month &&
            weekday.year ==
                DateFormat("E, M/d/yyyy").parse(expensList[i].datetime).year) {
          weekAmounts[index] += double.parse(expensList[i].amount.trim());
        }
      }
      return IndividualChartData(
          x: index,
          y: weekAmounts[index],
          day: DateFormat.E().format(weekday).substring(0, 1));
    });
    chartList.forEach((element) {
      print(element.toString());
    });

    return chartList;
  }
}
