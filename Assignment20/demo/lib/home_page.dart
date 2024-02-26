import 'package:demo/app_theme.dart';
import 'package:demo/provider/to_do_provider.dart';
import 'package:demo/shared/widgets/bottom_model_sheet.dart';
import 'package:demo/shared/widgets/to_do_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

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
  TextEditingController datetimeController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

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
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor,
        title: Text(
          'To Do List',
          style: AppTheme.copyWith(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
        ),
      ),
      body: Consumer<ToDoProvider>(builder: (context, todos, child) {
        return SizedBox(
          height: MediaQuery.of(context).size.height,
          child: todos.getTodoModelList.isEmpty
              ? const Center(
                  child: Text(
                    'No any to do item yet...!',
                    style: AppTheme.displayLarge,
                  ),
                )
              : ListView.builder(
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
                      )),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          titleController.clear();
          descriptionController.clear();
          datetimeController.clear();
          await showBottomSheetCustom(
              context: context,
              dateTimeFocusNode: _dateTimeFocusNode,
              datetimeController: datetimeController,
              descriptionController: descriptionController,
              descriptionFocusNode: _descriptionFocusNode,
              globalKey: _globalKey,
              titleController: titleController,
              titleFocusNode: _titleFocusNode);
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
