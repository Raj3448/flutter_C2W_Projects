import 'dart:math';

import 'package:demo/app_theme.dart';
import 'package:demo/model/expense_details_model.dart';
import 'package:demo/provider/to_do_provider.dart';
import 'package:demo/shared/widgets/bottom_model_sheet.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:zapx/zapx.dart';

class ToDoItem extends StatefulWidget {
  final ExpenseDetailsModel toDoModel;
  final GlobalKey<FormState> globalKey;
  final TextEditingController titleController;
  final FocusNode titleFocusNode;
  final TextEditingController descriptionController;
  final FocusNode descriptionFocusNode;
  final TextEditingController datetimeController;
  final FocusNode dateTimeFocusNode;
  final TextEditingController amountController;
  final FocusNode amountFocusNode;
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
    required this.amountController,
    required this.amountFocusNode,
  }) : super(key: key);

  @override
  State<ToDoItem> createState() => _ToDoItemState();
}

class _ToDoItemState extends State<ToDoItem> {
  Color _BckColor = Colors.black;

  @override
  void initState() {
    const availableColors = [
      Colors.blue,
      Colors.cyan,
      Colors.green,
      Colors.orange,
      Colors.pink,
    ];

    _BckColor = availableColors[Random().nextInt(5)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(widget.toDoModel.id),
      direction: Axis.horizontal,
      closeOnScroll: false,
      dragStartBehavior: DragStartBehavior.down,
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        dismissible: DismissiblePane(
          onDismissed: () {
            // Call the onDismissed callback passed from the parent
            //widget.onDismissed?.call();
          },
        ),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () async {
                  ExpenseDetailsModel existingItem =
                      await Provider.of<ToDoProvider>(context, listen: false)
                          .getToDoItem(widget.toDoModel.id);
                  print(existingItem.title);
                  widget.titleController.text = existingItem.title;
                  widget.descriptionController.text = existingItem.description;
                  widget.datetimeController.text = existingItem.datetime;
                  widget.amountController.text = existingItem.amount;
                  await showBottomSheetCustom(
                      editItemId: existingItem.id,
                      isForUpdate: true,
                      context: context,
                      globalKey: widget.globalKey,
                      titleController: widget.titleController,
                      titleFocusNode: widget.titleFocusNode,
                      descriptionController: widget.descriptionController,
                      descriptionFocusNode: widget.descriptionFocusNode,
                      datetimeController: widget.datetimeController,
                      dateTimeFocusNode: widget.dateTimeFocusNode,
                      amountFocusNode: widget.amountFocusNode,
                      amountController: widget.amountController);
                },
                child: Container(
                  height: 60,
                  decoration: const BoxDecoration(
                      color: AppTheme.primaryColor, shape: BoxShape.circle),
                  child: const Icon(
                    Icons.edit,
                    color: AppTheme.secondaryColor,
                  ).paddingAll(5),
                ),
              ),
              InkWell(
                onTap: () {
                  Provider.of<ToDoProvider>(context, listen: false)
                      .removeToDoItem(widget.toDoModel.id);
                },
                child: Container(
                  height: 60,
                  decoration: const BoxDecoration(
                      color: AppTheme.primaryColor, shape: BoxShape.circle),
                  child: const Icon(
                    Icons.delete_outline_rounded,
                    color: AppTheme.secondaryColor,
                  ).paddingAll(5),
                ),
              ),
            ],
          )
        ],
      ),
      child: Card(
        elevation: 5,
        child: Center(
          child: Container(
            //width: double.infinity,
            decoration: BoxDecoration(
                color: widget.color, borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                LayoutBuilder(builder: (context, constraints) {
                  return Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: CircleAvatar(
                          backgroundColor: _BckColor,
                          radius: 40,
                          child: FittedBox(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                '₹${double.parse(widget.toDoModel.amount).toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      //SizedBox(width: constraints.maxWidth * 0.05),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              widget.toDoModel.title,
                              style: AppTheme.copyWith(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                            Text(
                              widget.toDoModel.description,
                              style: AppTheme.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black),
                            ),
                            Text(
                              widget.toDoModel.datetime,
                              style: AppTheme.copyWith(
                                  fontSize: 14, color: Colors.black38),
                            ),
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.verified_rounded,
                        size: 30,
                        color: Colors.green,
                      ).paddingOnly(right: 5)
                    ],
                  );
                }),
                const Row(
                  children: [
                    // const Spacer(),
                    // SizedBox(
                    //   width: 100,
                    //   child: Row(
                    //     children: [
                    //       IconButton(
                    //           onPressed: () async {
                    //             ExpenseDetailsModel existingItem =
                    //                 Provider.of<ToDoProvider>(context,
                    //                         listen: false)
                    //                     .getToDoItem(widget.toDoModel.id);
                    //             print(existingItem.title);
                    //             widget.titleController.text = existingItem.title;
                    //             widget.descriptionController.text =
                    //                 existingItem.description;
                    //             widget.datetimeController.text =
                    //                 existingItem.datetime;
                    //             await showBottomSheetCustom(
                    //                 editItemId: existingItem.id,
                    //                 isForUpdate: true,
                    //                 context: context,
                    //                 globalKey: widget.globalKey,
                    //                 titleController: widget.titleController,
                    //                 titleFocusNode: widget.titleFocusNode,
                    //                 descriptionController:
                    //                     widget.descriptionController,
                    //                 descriptionFocusNode:
                    //                     widget.descriptionFocusNode,
                    //                 datetimeController: widget.datetimeController,
                    //                 dateTimeFocusNode: widget.dateTimeFocusNode,
                    //                 amountFocusNode: widget.amountFocusNode,
                    //                 amountController: widget.amountController);
                    //           },
                    //           icon: const Icon(Icons.edit)),
                    //       IconButton(
                    //           onPressed: () {
                    //             Provider.of<ToDoProvider>(context, listen: false)
                    //                 .removeToDoItem(widget.toDoModel.id);
                    //           },
                    //           icon: const Icon(Icons.delete_outline_rounded))
                    //     ],
                    //   ),
                    // )
                  ],
                ).paddingSymmetric(horizontal: 10)
              ],
            ),
          ),
        ),
      ).paddingSymmetric(horizontal: 10, vertical: 5),
    );
  }
}
