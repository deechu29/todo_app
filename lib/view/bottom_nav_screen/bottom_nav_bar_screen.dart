import 'package:flutter/material.dart';
import 'package:todo_app/utils/color_constance.dart';
import 'package:todo_app/view/add_screen/add_screen.dart';
import 'package:todo_app/view/all_task_screen/all_task_screen.dart';
import 'package:todo_app/view/completed_task_screen/completed_task_screen.dart';
import 'package:todo_app/view/pending_task_screen/pending_task_screen.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int selectedindex = 0;
  List<Widget> bottomscreen = [
    AllTaskScreen(),
    AddScreen(),
    completedtaskscreen(),
    pendingtaskscreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bottomscreen[selectedindex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorConstance.black,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: selectedindex,
        onTap: (value) {
          setState(() {
            selectedindex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
              label: "All task",
              icon: Icon(
                Icons.list,
              )),
          BottomNavigationBarItem(
              label: "Add task", icon: Icon(Icons.add_task)),
          BottomNavigationBarItem(
              label: "Completed task", icon: Icon(Icons.done_all)),
          BottomNavigationBarItem(
              label: " Peding task", icon: Icon(Icons.pending))
        ],
      ),
    );
  }
}
