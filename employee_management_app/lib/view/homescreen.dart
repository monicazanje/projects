import 'package:employee_management_app/controller/employeecontroller.dart';
import 'package:employee_management_app/view/employeedetailscerre.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<EmployeeController>(context, listen: false).empdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee List'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (query) {
                Provider.of<EmployeeController>(context, listen: false)
                    .searchEmployeeById(query);
              },
              decoration: InputDecoration(
                labelText: 'Employee ID',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                prefixIcon: const Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: Consumer<EmployeeController>(
              builder: (context, employeeController, child) {
                if (employeeController.filteredData.isEmpty) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return ListView.builder(
                  itemCount: employeeController.filteredData.length,
                  itemBuilder: (context, index) {
                    var employee = employeeController.filteredData[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EmployeeDetail(
                              employee: employee,
                            ),
                          ),
                        );
                      },
                      child: Card(
                        margin:const  EdgeInsets.all(8.0),
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.blueAccent,
                            maxRadius: 25,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(Radius.circular(30)),
                              child: Image.asset("assets/employeeimg.png",fit: BoxFit.cover))
                          ),
                          title: Text(employee.empName ?? 'Unknown'),
                          subtitle: Text(
                              'Salary: \$${employee.empsal} | Age: ${employee.empAge}'),
                          trailing: const Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
