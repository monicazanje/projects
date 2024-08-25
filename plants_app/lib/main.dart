import 'dart:io';

import 'package:flutter/material.dart';
import 'package:plants_app/firebase_options.dart';
import 'package:plants_app/view/get_start_page.dart';
import 'package:provider/provider.dart';
import 'package:plants_app/controller/productcontroller.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart' as p;
// import 'package:plants_app/model/plantsqimodel.dart';

dynamic database;

void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); 
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
  //final database = await initialisedatabase();
  // database = openDatabase(
  //   p.join(await getDatabasesPath(), "plant1db.db"),
  //   version: 1,
  //   onCreate: (db, version) async {
  //     await db.execute('''
  //      CREATE TABLE plantorder (
  //         mobileno INTEGER PRIMARY KEY,
  //         plantname TEXT,
  //         price REAL
  //       )

  //     ''');
  //   },
  // );
  // plantlist = await getOrderData();
  
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // final Database database;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return ProductController();
        })
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: GetStarted(),
      ),
    
    );
  }
}
