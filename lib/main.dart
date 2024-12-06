import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo_task_f5/controller/todo_provider.dart';


import 'model/todo_model.dart';
import 'view/bottom_nav_screen/bottom_nav_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TodoAdapter());
  await Hive.openBox<Todo>('todos');
  runApp(MyApp());
  
}class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TodoProvider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BottomNavScreen(),
      
      ),
    );
  }
}