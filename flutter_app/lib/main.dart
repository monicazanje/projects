import 'package:flutter/material.dart';
import 'package:flutter_app/controller/resistercontroller.dart';
import 'package:flutter_app/view/onbodingscreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (create){return  RegisterController();}),

      ],
      child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Onboard()
    ),
    );
  }
}
