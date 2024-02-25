// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

class ToDoModel {
  String title;
  String description;
  String datetime;
  File storedImage;
  ToDoModel({
    required this.title,
    required this.description,
    required this.datetime,
    required this.storedImage,
  });
}
