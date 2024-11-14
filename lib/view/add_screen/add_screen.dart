import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controller/home_screen_controller.dart';
import 'package:todo_app/utils/color_constance.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  TextEditingController title = TextEditingController();
  TextEditingController des = TextEditingController();

  String? selectedPriority;
  String status = "Pending";
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  fetchData() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstance.black,
      appBar: AppBar(
        backgroundColor: ColorConstance.black,
        centerTitle: true,
        title: Text(
          "Add task",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: ColorConstance.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: title,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: ColorConstance.white,
                  hintText: "Title",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  )),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: des,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: ColorConstance.white,
                  hintText: "Description",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  )),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Priority",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: ColorConstance.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Radio(
                      activeColor: ColorConstance.redcolor,
                      value: "High",
                      groupValue: selectedPriority,
                      onChanged: (value) {
                        setState(() {
                          selectedPriority = value;
                        });
                      },
                    ),
                    Text(
                      "High",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorConstance.white),
                    )
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      activeColor: ColorConstance.yellowcolor,
                      value: "Medium",
                      groupValue: selectedPriority,
                      onChanged: (value) {
                        setState(() {
                          selectedPriority = value;
                        });
                      },
                    ),
                    Text(
                      "Medium",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorConstance.white),
                    )
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      activeColor: ColorConstance.greencolor,
                      value: "Low",
                      groupValue: selectedPriority,
                      onChanged: (value) {
                        setState(() {
                          selectedPriority = value;
                        });
                      },
                    ),
                    Text(
                      "Low",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorConstance.white),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(ColorConstance.blue)),
                  onPressed: () async {
                    await context.read<HomeScreenController>().addData(
                        title: title.text,
                        description: des.text,
                        priority: selectedPriority ?? "High",
                        status: status);
                    title.clear();
                    des.clear();
                  },
                  child: Text(
                    "Save",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ColorConstance.white),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
