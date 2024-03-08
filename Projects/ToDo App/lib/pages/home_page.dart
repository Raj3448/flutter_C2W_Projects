import 'package:demo/app_theme.dart';
import 'package:demo/provider/to_do_provider.dart';
import 'package:demo/shared/widgets/bottom_model_sheet.dart';
import 'package:demo/shared/widgets/my_bar_graph_chart.dart';
import 'package:demo/shared/widgets/to_do_item.dart';
import 'package:demo/shared/widgets/sticky_header.dart';
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
  final globalKeyScreen = GlobalKey();

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

  final ScrollController _scrollController = ScrollController();
  bool _showTitle = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final currentPosition = _scrollController.position.pixels;
    const flexibleSpaceHeight = 200.0;

    setState(() {
      _showTitle = currentPosition >= flexibleSpaceHeight;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppTheme.primaryColor,
        height: double.infinity,
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              shape: _showTitle
                  ? const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)))
                  : null,
              pinned: true,
              expandedHeight: 150,
              backgroundColor: AppTheme.primaryColor,
              title: _showTitle
                  ? const Text(
                      'Good Morning, Rajkumar',
                      style: AppTheme.displayLarge,
                    )
                  : null,
              flexibleSpace: !_showTitle
                  ? FlexibleSpaceBar(
                      background: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Good Morning',
                            style: AppTheme.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const Text(
                            'Rajkumar',
                            style: AppTheme.displayLarge,
                          )
                        ],
                      ).paddingOnly(left: 20),
                    )
                  : null,
            ),
            const StickyHeader(
                color: Color(0xFFC3C3C3), title: 'Create Expense List '),
            SliverList(
                delegate: SliverChildListDelegate([
              Consumer<ToDoProvider>(builder: (context, todos, child) {
                return FutureBuilder(
                    future: todos.getTodoModelList,
                    builder: (context, snapshot) {
                      if (snapshot.data == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (!snapshot.hasData) {
                        return const SizedBox();
                      }
                      return Container(
                        padding: EdgeInsets.only(top: _showTitle ? 60 : 0),
                        height: MediaQuery.of(context).size.height,
                        decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 30,
                                  color: Color(0xFFC3C3C3),
                                  blurStyle: BlurStyle.inner)
                            ],
                            color: AppTheme.secondaryColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30))),
                        child: snapshot.data!.isEmpty
                            ? !_showTitle
                                ? Text(
                                    'No any expense yet...!',
                                    style: AppTheme.copyWith(
                                        color: Colors.black87),
                                    textAlign: TextAlign.center,
                                  ).paddingOnly(
                                    top: MediaQuery.of(context).size.height *
                                        0.3)
                                : Center(
                                    child: Text(
                                      'No any expense yet...!',
                                      style: AppTheme.copyWith(
                                          color: Colors.black87),
                                      textAlign: TextAlign.center,
                                    ).paddingOnly(top: 0),
                                  )
                            : Column(
                                children: [
                                  Container(
                                    color: AppTheme.secondaryColor,
                                    height: 200,
                                    child: const MyBarGraphChart(),
                                  ).paddingOnly(left: 3, right: 3, top: 30),
                                  Expanded(
                                    child: ListView.builder(
                                        physics: !_showTitle
                                            ? const NeverScrollableScrollPhysics()
                                            : const BouncingScrollPhysics(),
                                        itemCount: snapshot.data!.length,
                                        itemBuilder: (context, index) =>
                                            ToDoItem(
                                              color: colorList[
                                                  index % colorList.length],
                                              toDoModel: snapshot.data![index],
                                              dateTimeFocusNode:
                                                  _dateTimeFocusNode,
                                              datetimeController:
                                                  datetimeController,
                                              descriptionController:
                                                  descriptionController,
                                              descriptionFocusNode:
                                                  _descriptionFocusNode,
                                              globalKey: _globalKey,
                                              titleController: titleController,
                                              titleFocusNode: _titleFocusNode,
                                              amountController:
                                                  amountController,
                                              amountFocusNode: _amonutFocusNode,
                                            )),
                                  ),
                                ],
                              ),
                      );
                    });
              })
            ])),
          ],
        ),
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
