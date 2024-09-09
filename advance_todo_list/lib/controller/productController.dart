
import 'package:advance_todo_list/modules/productmodule.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

final productControllerProvider = StateNotifierProvider<ProductController, List<ToDOModel>>((ref) {
  return ProductController();
});
class ProductController extends StateNotifier<List<ToDOModel>> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  String? editingId; 

  ProductController() : super([]);

  void addTodo() {
    final newTodo = ToDOModel(
      id: DateTime.now().toString(), 
      title: titleController.text,
      description: descriptionController.text,
      date: dateController.text,
    );
    state = [...state, newTodo];
    clearControllers();
  }

  void updateTodo(String id) {
    final updatedTodo = ToDOModel(
      id: id,
      title: titleController.text,
      description: descriptionController.text,
      date: dateController.text,
    );
    state = state.map((todo) => todo.id == id ? updatedTodo : todo).toList();
    clearControllers();
  }

  void deleteTodo(String id) {
    state = state.where((todo) => todo.id != id).toList();
  }

  void clearControllers() {
    titleController.clear();
    descriptionController.clear();
    dateController.clear();
    editingId = null; 
  }

  void setDate(String date) {
    dateController.text = date;
  }
}
