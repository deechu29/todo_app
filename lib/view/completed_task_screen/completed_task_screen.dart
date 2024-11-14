import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/utils/color_constance.dart';

class completedtaskscreen extends StatefulWidget {
  const completedtaskscreen({super.key});

  @override
  State<completedtaskscreen> createState() => _completedtaskscreenState();
}

class _completedtaskscreenState extends State<completedtaskscreen> {
    
  
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstance.black,
      appBar: AppBar(
        backgroundColor: ColorConstance.black,
        centerTitle: true,
        title: Text(
          "Completed  task",
          style: TextStyle(color: ColorConstance.white),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer(
            builder: (context, ref, child) {
              return ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => InkWell(
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
                                    Text("title"),
                                    Text("Discription"),
                                    Text("Pending")
                                  ],
                                ),
                                Checkbox(
                                  value: isChecked,
                                  onChanged: (value) {
                                    setState(() {
                                      isChecked = value!;
                                    });
                                  },
                                )
                              ],
                            ),
                            height: MediaQuery.sizeOf(context).height * 0.1,
                          ),
                        ),
                      ),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 20,
                      ),
                  itemCount: 2);
            },
          )),
    );
  }
}
