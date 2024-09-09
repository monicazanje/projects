import 'package:advance_todo_list/controller/productController.dart';
import 'package:advance_todo_list/modules/productmodule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoList = ref.watch(productControllerProvider);
    final List<Color> colors = [
    const Color.fromARGB(255, 247, 225, 224),
    const Color.fromARGB(255, 220, 233, 244),
    const Color.fromARGB(255, 206, 228, 207),
    const Color.fromARGB(255, 246, 213, 224),
  ];

    return Scaffold(
      backgroundColor: const Color.fromRGBO(111, 81, 255, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 45),
          Container(
            padding: const EdgeInsets.only(left: 29),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Good Morning", style: TextStyle(fontSize: 22, color: Colors.white)),
                Text("Monika", style: TextStyle(fontSize: 30, color: Colors.white)),
                 SizedBox(height: 45)
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(217, 217, 217, 1),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 19),
                  Text("CREATE TO DO LIST",style: GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.w600
                    ),),
                  Expanded(
                    child: ListView.builder(
                      itemCount: todoList.length,
                      itemBuilder: (context, index) {
                        final todo = todoList[index];
                        return Slidable(
                          endActionPane: ActionPane(
                            motion: const DrawerMotion(),
                            children: [
                              SlidableAction(
                                   onPressed: (context) => showBottomSheet(context, ref, doEdit: true, obj: todo),
                                   icon: Icons.edit,
                                   backgroundColor: colors[index % colors.length],
                                   foregroundColor: const Color.fromARGB(255, 1, 1, 1),
                                                           ),
                             SlidableAction(
                                   onPressed: (context) {
                                    ref.read(productControllerProvider.notifier).deleteTodo(todo.id);
                                   },
                                  icon: Icons.delete,
                                  backgroundColor: colors[index % colors.length],
                                  foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                            ),]
                          ),
                          child:
                          //  ListTile(
                          //   title: Text(todo.title ?? ''),
                          //   subtitle: Text(todo.description),
                          //   trailing: Checkbox(value: true, onChanged: (value) {}),
                          // ),
                          Container(
                            width: MediaQuery.of(context).size.width*0.9,
                            margin: const EdgeInsets.all(20),
                          padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10,top: 10),
                          decoration: BoxDecoration(
                            color: colors[index % colors.length],
                            border: Border.all(
                            color: const Color.fromARGB(255, 101, 101, 101),),
                            borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(todo.title,style: GoogleFonts.poppins(
                                              fontSize: 20, fontWeight: FontWeight.w500
                                              ),),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(todo.description,style: GoogleFonts.poppins(
                                              fontSize: 15, fontWeight: FontWeight.w400
                                              ),),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text("${todo.date}",style: GoogleFonts.poppins(
                                              fontSize: 15, fontWeight: FontWeight.w400
                                              ),)
                              ],
                            ),
                          )
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showBottomSheet(context, ref),
        child: const Text("Add"),
      ),
    );
  }

  void showBottomSheet(BuildContext context, WidgetRef ref,{bool doEdit = false, ToDOModel? obj}) {
    final controller = ref.read(productControllerProvider.notifier);
    if (doEdit && obj != null) {
    controller.titleController.text = obj.title ;
    controller.descriptionController.text = obj.description;
    controller.dateController.text = obj.date;
    controller.editingId = obj.id; 
  } else {
    controller.editingId = null; 
  }
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
              top: 13, left: 15, right: 15, bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                child: Text("Create Task",style:GoogleFonts.poppins(
                      fontSize: 25, fontWeight: FontWeight.w500
                      ) ,),
              ),
              TextField(
                controller: controller.titleController,
                 decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(0, 139, 148, 1),
                                  width: 0.5),
                              borderRadius: BorderRadius.circular(5)),
                  focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(0, 139, 148, 1),
                                  width: 0.5),
                              borderRadius: BorderRadius.circular(5)),
                  labelText: 'Title',labelStyle:GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.w600
                    ),)),
                    const SizedBox(height: 20,),
              TextField(
                controller: controller.descriptionController,
                 decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(0, 139, 148, 1),
                                  width: 0.5),
                              borderRadius: BorderRadius.circular(5)),
                  focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(0, 139, 148, 1),
                                  width: 0.5),
                              borderRadius: BorderRadius.circular(5)),
                  labelText: 'Description',labelStyle:GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.w600
                    ))),
                    const SizedBox(height: 20,),
              TextField(
                controller: controller.dateController, 
                onTap: ()async{
                  DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2024),
                              lastDate: DateTime(2025));

                  if (pickedDate != null) {
                              String formattedDate = DateFormat.yMd().format(pickedDate);
                              controller.setDate(formattedDate);  
                  }

                        
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(0, 139, 148, 1),
                                  width: 0.5),
                              borderRadius: BorderRadius.circular(5)),
                  focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(0, 139, 148, 1),
                                  width: 0.5),
                              borderRadius: BorderRadius.circular(5)),
                  labelText: 'Date',labelStyle:GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.w600
                    ))),
              GestureDetector(
                onTap: () {
                   if (controller.titleController.text.isNotEmpty &&
                    controller.descriptionController.text.isNotEmpty &&
                    controller.dateController.text.isNotEmpty) {
                  if (controller.editingId != null) {
                    controller.updateTodo(controller.editingId!);
                  } else {
                    controller.addTodo();
                  }
                  Navigator.of(context).pop();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Please fill all the fields."),
                    ),
                  );
                }
                },
                child: Container(
                  height: 40,
                  width: 150,
                  decoration:const  BoxDecoration(
                    color:  Color.fromRGBO(111, 81, 255, 1),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  margin: const EdgeInsets.only(top: 50,bottom: 30),
                  padding: const EdgeInsets.only(top: 5),
                  child:  Text("Submit",textAlign: TextAlign.center,style:GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.w600,color: Colors.white
                    ) ,)),
              ),
            ],
          ),
        );
      },
    );
  }
}
