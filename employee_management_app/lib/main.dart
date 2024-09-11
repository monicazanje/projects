import 'package:employee_management_app/controller/employeecontroller.dart';
import 'package:employee_management_app/view/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: 
    [
      ChangeNotifierProvider(create: (create){return EmployeeController();})
    ],
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen()
    ),
    );
  }
}
