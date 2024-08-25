import 'package:flutter/material.dart';
import 'package:plants_app/model/modelview.dart';
//import 'package:plants_app/main.dart';
// import 'package:plants_app/model/plantsqimodel.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:sqflite/sqlite_api.dart';

class ProductController with ChangeNotifier {
  List<ProductModel> imglist = ProductModel.imagelist();
  // final Database database;
  // ProductController(this.database);
  // List<Plant> cartItems = [];

  void addproduct(ProductModel obj) {
    imglist.add(obj);
  }

  void addtocart({required int index}) {
    imglist[index].addtocart = !imglist[index].addtocart;
    notifyListeners();
  }

  // Future<void> insertOrder(Plant obj) async {
  //   final localDB = await database;
  //   await localDB.insert(
  //     "plantorder",
  //     obj.plantmap(),
  //     conflictAlgorithm: ConflictAlgorithm.replace,
  //   );
  //   await getOrderData();
  //   //print(getOrderData());
  //   notifyListeners();
  // }

  //  Future<List<Plant>> getOrderData() async {
  //   final localDb = await database;
  //   List<Map<String, dynamic>> orderMap = await localDb.query("plantorder");
  //   return List.generate(orderMap.length, (i) {
  //     return Plant(
  //       mobileno: orderMap[i]['mobileno'],
  //       plantname: orderMap[i]['plantname'],
  //       price: orderMap[i]['price'],
  //     );
  //   });
  // }

  // Future<void> deleteOrder(int data) async {
  //   final localDb = await database;

  //   await localDb.delete(
  //     "plantorder",
  //     where: "mobileno:?",
  //     whereArgs: [data],
  //   );
  //   await getOrderData();
  //   notifyListeners();
  // }

  // Future<void> updateorder(Plant obj) async {
  //   final localDb = await database;

  //   await localDb.update(
  //     "plantorder",
  //     obj.plantmap(),
  //     where: 'mobileno=?',
  //     whereArgs: [obj.mobileno],
  //   );
  //   await getOrderData();
  //   notifyListeners();
  // }
}
