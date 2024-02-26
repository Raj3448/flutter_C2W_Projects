import 'package:demo/model/todomodel.dart';
import 'package:flutter/material.dart';

class ToDoProvider extends ChangeNotifier {
  final List<ToDoModel> _todoModelList = [];

  List<ToDoModel> get getTodoModelList {
    return [..._todoModelList];
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

  ToDoModel getToDoItem(String id){
    return _todoModelList.firstWhere((element) => element.id == id);
  }
}
