import 'package:demo/model/todomodel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ToDoProvider extends ChangeNotifier {
  final List<ToDoModel> _todoModelList = [];

  List<ToDoModel> get getTodoModelList {
    return [..._todoModelList];
  }

  List<>

  List<ToDoModel> get getExpensesInPrev7Days =>
    _todoModelList.where((instance) {
      return DateFormat("E, M/d/yyyy").parse(instance.datetime).isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();


  

  void updateItem(ToDoModel instance) {
    _todoModelList.firstWhere((element) {
      if (element.id == instance.id) {
        element.title = instance.title;
        element.datetime = instance.datetime;
        element.description = instance.description;
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


}
