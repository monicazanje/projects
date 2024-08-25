import 'package:sqflite/sqflite.dart';
import 'package:plants_app/main.dart';

class Plant {
  final int mobileno;
  final String img;
  final String plantname;
  final double price;

  Plant({
    required this.mobileno,
    required this.plantname,
    required this.price,
    required this.img
  });

  Map<String, dynamic> plantmap() {
    return {
      'mobileno': mobileno,
      'plantname': plantname,
      'price': price,
    };
  }

  @override
  String toString() {
    return '{mobileno:$mobileno,plantname:$plantname,price:$price}';
  }
  static List<Plant>outdoorlist=[
  Plant(img: "assets/plant img2.png",plantname: "Panchira",price: 560,mobileno: 1234567890),
  Plant(img: "assets/english lvy.jpg",plantname: "english lvy",price: 670,mobileno: 1234567890),
  Plant(img: "assets/dracaena.jpeg",plantname: "dracaena",price: 850,mobileno: 1234567890),
  Plant(img: "assets/agave.jpeg",plantname: "Agave",price: 590,mobileno: 1234567890),
  Plant(img: "assets/arborvitae.jpg",plantname: "Arborvitae",price: 270,mobileno: 1234567890),
  Plant(img: "assets/fuchsia.jpeg",plantname: "Fuchsia",price: 270,mobileno: 1234567890),
  Plant(img: "assets/pachira.jpg",plantname: "Panchira",price: 270,mobileno: 1234567890),
];
static List<Plant>indoorlist=[
  Plant(img: "assets/peace lily.jpeg",plantname: "Pease Lily",price: 270,mobileno: 1234567890),
  Plant(img: "assets/plantimg1.png",plantname: "Snake Plants",price: 370,mobileno: 1234567890),
  Plant(img: "assets/zamia green.jpeg",plantname: "Zamina Green",price: 250,mobileno: 1234567890),
  Plant(img: "assets/zz plants.jpeg",plantname: "ZZ Plants",price: 450,mobileno: 1234567890),
  Plant(img: "assets/golden pothos.jpeg",plantname: "Golden Phothos",price: 320,mobileno: 1234567890),
  Plant(img: "assets/philodendron.jpeg",plantname: "Philodendron",price: 360,mobileno: 1234567890),
  Plant(img: "assets/Chinese Evergreen.jpeg",plantname: "Chinese Evergreen",price: 760,mobileno: 1234567890),
  Plant(img: "assets/pachira.jpg",plantname: "Panchira",price: 270,mobileno: 1234567890)

];
}

Future<void> insertOrder(Plant obj) async {
  final localDB = await database;
  await localDB.insert(
    "plantorder",
    obj.plantmap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
  await getOrderData();
  //print(getOrderData());
}

Future<List<Plant>> getOrderData() async {
  final localDb = await database;
  List<Map<String, dynamic>> orderMap = await localDb.query("plantorder");
  return List.generate(orderMap.length, (i) {
    return Plant(
      mobileno: orderMap[i]['mobileno'],
      plantname: orderMap[i]['plantname'],
      price: orderMap[i]['price'],
      img:orderMap[i]['img']

    );
  });
}

Future<void> deleteOrder(int data) async {
  final localDb = await database;

  await localDb.delete(
    "plantorder",
    where: "mobileno:?",
    whereArgs: [data],
  );
  await getOrderData();
}

Future<void> updateorder(Plant obj) async {
  final localDb = await database;

  await localDb.update(
    "plantorder",
    obj.plantmap(),
    where: 'mobileno=?',
    whereArgs: [obj.mobileno],
  );
  await getOrderData();
}

List<Plant> plantlist = [
  Plant(mobileno: 1234567890, plantname: "asdfgh", price: 350,img: "assets/arborvitae.jpg")
];


