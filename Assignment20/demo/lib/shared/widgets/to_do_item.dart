// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:demo/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:zapx/zapx.dart';

class ToDoItem extends StatelessWidget {
  final Color color;
  const ToDoItem({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Card(
      child: Center(
        child: Container(
          height: screenSize.height * 0.26,
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
                      'Lorem Ipsum is simply setting industry. ',
                      style: AppTheme.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    Text(
                      'Simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
                      style: AppTheme.copyWith(
                          fontSize: 15, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  const Text(
                    '25/2/2024',
                    style: AppTheme.displayMedium,
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {},
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
