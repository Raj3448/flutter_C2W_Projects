import 'package:demo/app_theme.dart';
import 'package:demo/provider/to_do_provider.dart';
import 'package:demo/shared/widgets/bottom_model_sheet.dart';
import 'package:demo/shared/widgets/to_do_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:zapx/zapx.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  List<Color> colorList = [
    const Color(0xffFAE8E8),
    const Color(0xffE8EDFA),
    const Color(0xffFAF9E8),
    const Color(0xffFAE8FA),
  ];

  final GlobalKey<FormState> _globalKey = GlobalKey();

  final FocusNode _titleFocusNode = FocusNode();
  final FocusNode _descriptionFocusNode = FocusNode();
  final FocusNode _dateTimeFocusNode = FocusNode();
  final FocusNode _amonutFocusNode = FocusNode();
  TextEditingController datetimeController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  void dateSelection(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2023),
            lastDate: DateTime.now())
        .then((enteredDate) {
      if (enteredDate == null) {
        return;
      } else {
        setState(() {
          datetimeController.text =
              DateFormat.yMEd().format(enteredDate).toString();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryColor,
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: const BoxDecoration(color: AppTheme.primaryColor),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Good Morning,',
                      textAlign: TextAlign.left,
                      style: AppTheme.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ).paddingOnly(left: 20, top: 10),
                    const Text(
                      'Rajkumar',
                      style: AppTheme.displayLarge,
                    ).paddingOnly(
                      left: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.8,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 205, 204, 204),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Create To Do List',
                      style: AppTheme.copyWith(color: Colors.black),
                    ),
                  ],
                ),
              ),
              Positioned.fill(
                top: MediaQuery.of(context).size.height * 0.1,
                child: Consumer<ToDoProvider>(builder: (context, todos, child) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: AppTheme.secondaryColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: todos.getTodoModelList.isEmpty
                        ? const Center(
                            child: Text(
                              'No any expense yet...!',
                              style: AppTheme.displayLarge,
                            ),
                          )
                        : ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: todos.getTodoModelList.length,
                            itemBuilder: (context, index) => ToDoItem(
                                  color: colorList[index % colorList.length],
                                  toDoModel: todos.getTodoModelList[index],
                                  dateTimeFocusNode: _dateTimeFocusNode,
                                  datetimeController: datetimeController,
                                  descriptionController: descriptionController,
                                  descriptionFocusNode: _descriptionFocusNode,
                                  globalKey: _globalKey,
                                  titleController: titleController,
                                  titleFocusNode: _titleFocusNode,
                                  amountController: amountController,
                                  amountFocusNode: _amonutFocusNode,
                                )),
                  );
                }),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          titleController.clear();
          descriptionController.clear();
          datetimeController.clear();
          amountController.clear();
          await showBottomSheetCustom(
              isForUpdate: false,
              context: context,
              dateTimeFocusNode: _dateTimeFocusNode,
              datetimeController: datetimeController,
              descriptionController: descriptionController,
              descriptionFocusNode: _descriptionFocusNode,
              globalKey: _globalKey,
              titleController: titleController,
              titleFocusNode: _titleFocusNode,
              amountFocusNode: _amonutFocusNode,
              amountController: amountController);
        },
        backgroundColor: AppTheme.primaryColor,
        child: const Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
      ),
    );
  }
}
