import 'package:demo/app_theme.dart';
import 'package:demo/model/todomodel.dart';
import 'package:demo/provider/to_do_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:zapx/zapx.dart';

Future<void> showBottomSheetCustom(
    {required bool isForUpdate,
    String? editItemId,
    required BuildContext context,
    required GlobalKey<FormState> globalKey,
    required TextEditingController titleController,
    required FocusNode titleFocusNode,
    required TextEditingController descriptionController,
    required FocusNode descriptionFocusNode,
    required TextEditingController datetimeController,
    required FocusNode amountFocusNode,
    required TextEditingController amountController,
    required FocusNode dateTimeFocusNode}) async {
  void submit(BuildContext context) {
    if (isForUpdate) {
      Provider.of<ToDoProvider>(context, listen: false).updateItem(ToDoModel(
          id: editItemId!,
          title: titleController.text,
          description: descriptionController.text,
          datetime: datetimeController.text,
          amount: amountController.text));
      print("Item Edited Successfully");
    } else {
      globalKey.currentState!.save();
      ToDoModel newTask = ToDoModel(
          datetime: datetimeController.text,
          description: descriptionController.text,
          title: titleController.text,
          id: DateTime.now().toIso8601String(),
          amount: amountController.text);
      Provider.of<ToDoProvider>(context, listen: false).addToDoItem(newTask);
      print('Item added successfully');

      titleController.clear();
      descriptionController.clear();
      datetimeController.clear();
    }
  }

  void dateSelection(
    BuildContext context,
  ) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2023),
            lastDate: DateTime.now())
        .then((enteredDate) {
      if (enteredDate == null) {
        return;
      } else {
        datetimeController.text =
            DateFormat.yMEd().format(enteredDate).toString();
      }
    });
  }

  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          margin: const EdgeInsets.only(top: 20),
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          width: double.infinity,
          child: Form(
            key: globalKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Create Task',
                  style: AppTheme.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: titleController,
                  focusNode: titleFocusNode,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Field is empty';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      label: const Text('Title'),
                      labelStyle: AppTheme.copyWith(
                        color: AppTheme.primaryColor,
                      ),
                      fillColor: Colors.white24,
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      helperStyle:
                          const TextStyle(color: AppTheme.primaryColor),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10.0),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 1, color: AppTheme.primaryColor),
                          borderRadius: BorderRadius.circular(10))),
                  onFieldSubmitted: (value) {
                    titleFocusNode.unfocus();
                    FocusScope.of(context).requestFocus(descriptionFocusNode);
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  focusNode: descriptionFocusNode,
                  controller: descriptionController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'description is empty';
                    }
                    return null;
                  },
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      label: const Text('Description'),
                      labelStyle: AppTheme.copyWith(
                        color: AppTheme.primaryColor,
                      ),
                      fillColor: Colors.white24,
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      helperStyle:
                          const TextStyle(color: AppTheme.primaryColor),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10.0),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 1, color: AppTheme.primaryColor),
                          borderRadius: BorderRadius.circular(10))),
                  onFieldSubmitted: (value) {
                    descriptionFocusNode.unfocus();
                    FocusScope.of(context).requestFocus(amountFocusNode);
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: amountController,
                  focusNode: amountFocusNode,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Field is empty';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Invalid Field plz nter number';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      label: const Text('Amount'),
                      labelStyle: AppTheme.copyWith(
                        color: AppTheme.primaryColor,
                      ),
                      fillColor: Colors.white24,
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      helperStyle:
                          const TextStyle(color: AppTheme.primaryColor),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10.0),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 1, color: AppTheme.primaryColor),
                          borderRadius: BorderRadius.circular(10))),
                  onFieldSubmitted: (value) {
                    titleFocusNode.unfocus();
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: datetimeController,
                  focusNode: dateTimeFocusNode,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please select date';
                    }
                    return null;
                  },
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  readOnly: true,
                  decoration: InputDecoration(
                      label: const Text('Select Date'),
                      labelStyle: AppTheme.copyWith(
                        color: AppTheme.primaryColor,
                      ),
                      suffixIcon: IconButton(
                          onPressed: () => dateSelection(context),
                          icon: const Icon(Icons.date_range_outlined)),
                      fillColor: Colors.white24,
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      helperStyle:
                          const TextStyle(color: AppTheme.primaryColor),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10.0),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 1, color: AppTheme.primaryColor),
                          borderRadius: BorderRadius.circular(10))),
                  onFieldSubmitted: (value) {
                    dateTimeFocusNode.unfocus();
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        shape: const MaterialStatePropertyAll<
                                RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                        backgroundColor: const MaterialStatePropertyAll(
                            AppTheme.primaryColor),
                        fixedSize: MaterialStatePropertyAll(
                            Size(MediaQuery.of(context).size.width * 0.8, 50))),
                    onPressed: () {
                      if (globalKey.currentState!.validate()) {
                        submit(context);
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text(
                      'Submit',
                      style: AppTheme.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )).paddingOnly(bottom: 10)
              ],
            ).paddingSymmetric(horizontal: 20),
          ),
        );
      });
}
