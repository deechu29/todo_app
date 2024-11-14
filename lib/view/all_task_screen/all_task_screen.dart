import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controller/home_screen_controller.dart';

import 'package:todo_app/utils/color_constance.dart';

class AllTaskScreen extends StatefulWidget {
  const AllTaskScreen({super.key});

  @override
  State<AllTaskScreen> createState() => _AllTaskScreenState();
}

class _AllTaskScreenState extends State<AllTaskScreen> {
  bool isChecked = false;
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  fetchData() async {
    await context.read<HomeScreenController>().getData();
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstance.black,
      appBar: AppBar(
        backgroundColor: ColorConstance.black,
        centerTitle: true,
        title: Text(
          "All task",
          style: TextStyle(color: ColorConstance.white),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<HomeScreenController>(
            builder: (context, prov, child) {
              return ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var task = prov.myDatalist[index];
                    bool isCompleted = task['status'] == 'Completed';

                    return InkWell(
                      onLongPress: () {},
                      child: Card(
                        child: Container(
                          decoration: BoxDecoration(
                            //borderRadius: BorderRadius.circular(20),
                            color: Colors.blue,
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(task['title']),
                                  Text(task['description']),
                                  Text(task['priority'])
                                ],
                              ),
                              Checkbox(
                                value: isCompleted,
                                onChanged: (value) async {
                                  String newstatus =
                                      value! ? 'Completed' : 'Pending';
                                  await prov.updateTask(
                                      id: task['id'], status: newstatus);
                                },
                              )
                            ],
                          ),
                          height: MediaQuery.sizeOf(context).height * 0.1,
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                        height: 20,
                      ),
                  itemCount: prov.myDatalist.length);
            },
          )),
    );
  }
}
