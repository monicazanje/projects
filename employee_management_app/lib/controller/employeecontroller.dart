import 'dart:convert';
import 'dart:developer';

import 'package:employee_management_app/model/employeemodule.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class EmployeeController extends ChangeNotifier{
  List<Data> mapdata=[];
  List<Data> filteredData = [];
  Future<void> empdata()async{
    Uri url=Uri.parse("https://dummy.restapiexample.com/api/v1/employees");
    http.Response responce= await http.get(url);
    log(responce.body);
    var responsedata=json.decode(responce.body);
    Employee obj=Employee(responsedata);
    mapdata=obj.data!;
    filteredData=mapdata;
    notifyListeners();
  }
  void searchEmployeeById(String query) {
    if (query.isEmpty) {
      filteredData = mapdata;
    } else {
      filteredData = mapdata
          .where((employee) => employee.empid!.toString().contains(query))
          .toList();
    }
    notifyListeners();
  }

}