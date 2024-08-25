// import 'dart:developer';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class SignUp extends StatefulWidget {
//   const SignUp({super.key});
//   @override
//   State<SignUp> createState() => _SignInState();
// }

// class _SignInState extends State<SignUp> {
//   TextEditingController phoneController = TextEditingController();
  
//   final FocusNode phoneFocusNode = FocusNode();
  
//   final GlobalKey<FormState> _formkey2 = GlobalKey<FormState>();
//   String phoneno = '';
 

//   void createacc() async {
//     phoneno = phoneController.text.trim();
   
//     if (phoneno == '' || phoneno.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text("please enter phone number"),
//         ),
//       );
//       log("please enter phone number");
//     }  else {
//       try {
        
          
//         log("user created");
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text("Sign Up successfully "),
//           ),
//         );
//         if (userCredential.user != null) {
//           // ignore: use_build_context_synchronously
//           Navigator.of(context).pop();
//         }
//       } on FirebaseAuthException catch (ex) {
//         // ignore: use_build_context_synchronously
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text("Already Available "),
//           ),
//         );
//       }
//     }
//     discard();
//   }

//   void discard() {
//     phoneController.clear();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 45, 45, 45),
//       body: Center(
//         child: Form(
//           key: _formkey2,
//           child: SingleChildScrollView(
//             child: Container(
//               margin: const EdgeInsets.only(
//                   top: 130, bottom: 130, left: 20, right: 20),
//               padding: const EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                   border: Border.all(
//                     style: BorderStyle.solid,
//                   ),
//                   boxShadow: const [
//                     BoxShadow(
//                         color: Color.fromARGB(255, 215, 53, 17),
//                         blurRadius: 10,
//                         spreadRadius: 5),
//                   ],
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(30)),
//               child: Column(
//                 children: [
//                   const SizedBox(
//                     height: 50,
//                   ),
//                   SizedBox(
//                     height: 50,
//                     width: 350,
//                     child: TextFormField(
//                       controller: nameController,
//                       focusNode: nameFocusNode,
//                       decoration: InputDecoration(
//                         hintText: "Enter  email",
//                         hintStyle: const TextStyle(
//                             color: Color.fromRGBO(255, 46, 0, 1), fontSize: 15),
//                         enabledBorder: const OutlineInputBorder(
//                           borderRadius: BorderRadius.all(
//                             Radius.circular(30),
//                           ),
//                           borderSide: BorderSide(width: 2),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20),
//                           borderSide:
//                               const BorderSide(color: Colors.orange, width: 2),
//                         ),
//                       ),
//                       onChanged: (value) {
//                         email = value;
//                         // print("Value=$value");
//                       },
//                       textInputAction: TextInputAction.done,
//                       keyboardType: TextInputType.emailAddress,
//                       validator: (name) {
//                         if (name == null || name.isEmpty) {
//                           return "Please Enter name";
//                         } else {
//                           return null;
//                         }
//                       },
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   SizedBox(
//                     height: 50,
//                     width: 350,
//                     child: TextFormField(
//                       controller: passController,
//                       focusNode: passFocusNode,
//                       decoration: InputDecoration(
//                         hintText: "Enter  password",
//                         hintStyle: const TextStyle(
//                             color: Color.fromRGBO(255, 46, 0, 1), fontSize: 15),
//                         enabledBorder: const OutlineInputBorder(
//                           borderRadius: BorderRadius.all(
//                             Radius.circular(30),
//                           ),
//                           borderSide: BorderSide(width: 2),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20),
//                           borderSide:
//                               const BorderSide(color: Colors.orange, width: 2),
//                         ),
//                       ),
//                       onChanged: (value) {
//                         password = value;
//                         // print("Value=$value");
//                       },
//                       textInputAction: TextInputAction.done,
//                       keyboardType: TextInputType.emailAddress,
//                       validator: (password) {
//                         if (password == null || password.isEmpty) {
//                           return "Please Enter password";
//                         } else {
//                           return null;
//                         }
//                       },
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   SizedBox(
//                     height: 50,
//                     width: 350,
//                     child: TextFormField(
//                       controller: compassController,
//                       focusNode: compassFocusNode,
//                       decoration: InputDecoration(
//                         hintText: "Confirm password",
//                         hintStyle: const TextStyle(
//                             color: Color.fromRGBO(255, 46, 0, 1), fontSize: 15),
//                         enabledBorder: const OutlineInputBorder(
//                           borderRadius: BorderRadius.all(
//                             Radius.circular(30),
//                           ),
//                           borderSide: BorderSide(width: 2),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20),
//                           borderSide:
//                               const BorderSide(color: Colors.orange, width: 2),
//                         ),
//                       ),
//                       textInputAction: TextInputAction.done,
//                       keyboardType: TextInputType.emailAddress,
//                       validator: (compass) {
//                         if (compass == null || compass.isEmpty) {
//                           return "Confirm Password";
//                         } else {
//                           return null;
//                         }
//                       },
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 100,
//                   ),
//                   ElevatedButton(
//                     style: ButtonStyle(
//                       backgroundColor: const MaterialStatePropertyAll(
//                         Color.fromRGBO(255, 46, 0, 1),
//                       ),
//                       fixedSize: MaterialStateProperty.all<Size>(
//                         const Size(350.0, 50.0),
//                       ),
//                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                         RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(30.0),
//                         ),
//                       ),
//                     ),
//                     onPressed: () {
//                       createacc();
//                       // Navigator.push(
//                       //   context,
//                       //   MaterialPageRoute(
//                       //     builder: (context) {
//                       //       return const SignIn();
//                       //     },
//                       //   ),
//                       // );
//                     },
//                     child: const Text(
//                       "Sign Up",
//                       style: TextStyle(
//                           fontSize: 15,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
