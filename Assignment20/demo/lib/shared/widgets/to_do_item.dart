// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:demo/app_theme.dart';
import 'package:demo/model/todomodel.dart';
import 'package:demo/provider/to_do_provider.dart';
import 'package:demo/shared/widgets/bottom_model_sheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zapx/zapx.dart';

class ToDoItem extends StatelessWidget {
  final ToDoModel toDoModel;
  final GlobalKey<FormState> globalKey;
  final TextEditingController titleController;
  final FocusNode titleFocusNode;
  final TextEditingController descriptionController;
  final FocusNode descriptionFocusNode;
  final TextEditingController datetimeController;
  final FocusNode dateTimeFocusNode;
  final Color color;
  const ToDoItem({
    Key? key,
    required this.toDoModel,
    required this.globalKey,
    required this.titleController,
    required this.titleFocusNode,
    required this.descriptionController,
    required this.descriptionFocusNode,
    required this.datetimeController,
    required this.dateTimeFocusNode,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Center(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              ListTile(
                leading: const CircleAvatar(
                  radius: 30,
                  backgroundImage:
                      AssetImage('assets/images/profile-pic (22).png'),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      toDoModel.title,
                      style: AppTheme.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    Text(
                      toDoModel.description,
                      style: AppTheme.copyWith(
                          fontSize: 15, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Text(
                    toDoModel.datetime,
                    style: AppTheme.displayMedium,
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () async {
                              ToDoModel existingItem =
                                  Provider.of<ToDoProvider>(context,
                                          listen: false)
                                      .getToDoItem(toDoModel.id);
                              print(existingItem.title);
                              titleController.text = existingItem.title;
                              descriptionController.text =
                                  existingItem.description;
                              datetimeController.text = existingItem.datetime;
                              await showBottomSheetCustom(
                                  context: context,
                                  globalKey: globalKey,
                                  titleController: titleController,
                                  titleFocusNode: titleFocusNode,
                                  descriptionController: descriptionController,
                                  descriptionFocusNode: descriptionFocusNode,
                                  datetimeController: datetimeController,
                                  dateTimeFocusNode: dateTimeFocusNode);
                            },
                            icon: const Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {
                              Provider.of<ToDoProvider>(context, listen: false)
                                  .removeToDoItem(toDoModel.id);
                            },
                            icon: const Icon(Icons.delete_outline_rounded))
                      ],
                    ),
                  )
                ],
              ).paddingSymmetric(horizontal: 10)
            ],
          ),
        ),
      ),
    ).paddingSymmetric(horizontal: 10, vertical: 5);
  }
}
