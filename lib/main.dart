import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controller/home_screen_controller.dart';
import 'package:todo_app/view/bottom_nav_screen/bottom_nav_bar_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HomeScreenController.initDB;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeScreenController(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BottomNavBarScreen(),
      ),
    );
  }
}
