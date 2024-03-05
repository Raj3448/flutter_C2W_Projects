import 'package:demo/model/individual_chart_data.dart';
import 'package:demo/model/todomodel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ToDoProvider extends ChangeNotifier {
  final List<ToDoModel> _todoModelList = [];

  List<ToDoModel> get getTodoModelList {
    return [..._todoModelList];
  }

  List<ToDoModel> get getExpensesInPrev7Days =>
      _todoModelList.where((instance) {
        return DateFormat("E, M/d/yyyy")
            .parse(instance.datetime)
            .isAfter(DateTime.now().subtract(const Duration(days: 7)));
      }).toList();

  void updateItem(ToDoModel instance) {
    _todoModelList.firstWhere((element) {
      if (element.id == instance.id) {
        element.title = instance.title;
        element.datetime = instance.datetime;
        element.description = instance.description;
        element.amount = instance.amount;
        return true;
      } else {
        return false;
      }
    });
    notifyListeners();
  }

  void addToDoItem(ToDoModel instance) {
    _todoModelList.add(instance);
    print('Item Added');
    notifyListeners();
  }

  void removeToDoItem(String id) {
    _todoModelList.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  ToDoModel getToDoItem(String id) {
    return _todoModelList.firstWhere((element) => element.id == id);
  }

  List<IndividualChartData> getChartData() {
    List<ToDoModel> expensList = getExpensesInPrev7Days;
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
