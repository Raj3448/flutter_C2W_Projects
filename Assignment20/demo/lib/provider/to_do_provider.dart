import 'package:demo/model/todomodel.dart';
import 'package:flutter/material.dart';

class ToDoProvider extends ChangeNotifier {
  List<ToDoModel> _todoModelList = [];

  get getTodoModelList {
    return [..._todoModelList];
  }
}
