import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plants_app/view/home.dart';

class Verification extends StatefulWidget {
  final String verificationId;

  const Verification({super.key,required this.verificationId});
  @override
  State<Verification> createState() => _Verificationstate();
}

class _Verificationstate extends State<Verification> {
  TextEditingController num1controller = TextEditingController();
  TextEditingController num2controller = TextEditingController();
  TextEditingController num3controller = TextEditingController();
  TextEditingController num4controller = TextEditingController();
  TextEditingController num5controller = TextEditingController();
  TextEditingController num6controller = TextEditingController();
  void verifyotp()async{
    String otp=num1controller.text.trim()+num2controller.text.trim()+num3controller.text.trim()+num4controller.text.trim()+num5controller.text.trim()+num6controller.text.trim();
    PhoneAuthCredential credential=PhoneAuthProvider.credential(smsCode: otp,verificationId:widget.verificationId );
    
    try{
      UserCredential userCredential=await FirebaseAuth.instance.signInWithCredential(credential);
      if(userCredential.user !=null){
         Navigator.push(
                    // ignore: use_build_context_synchronously
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Home(),
                    ),
                  );
      }

    } on FirebaseAuthException catch(ex){
      log(ex.code.toString());

    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(
              flex: 1,
            ),
            const Text(
              "Verification",
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Enter the OTP code from the phone we  just sent you.",
              style: TextStyle(fontSize: 15),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10,right: 10,top: 20,bottom: 20),
              child: Row(
                children: [
                  Container(
                    height: 60,
                    width: 50,
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(style: BorderStyle.solid),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 2),
                          blurRadius: 5,
                          spreadRadius: 3,
                          color: Color.fromARGB(255, 201, 199, 199),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: num1controller,
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Container(
                    height: 60,
                    width: 50,
                    margin: const EdgeInsets.all(3),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(style: BorderStyle.solid),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 2),
                          blurRadius: 5,
                          spreadRadius: 3,
                          color: Color.fromARGB(255, 201, 199, 199),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: num2controller,
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Container(
                    height: 60,
                    width: 50,
                    margin: const EdgeInsets.all(3),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(style: BorderStyle.solid),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 2),
                          blurRadius: 5,
                          spreadRadius: 3,
                          color: Color.fromARGB(255, 201, 199, 199),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: num3controller,
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Container(
                    height: 60,
                    width: 50,
                    margin: const EdgeInsets.all(3),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(style: BorderStyle.solid),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 2),
                          blurRadius: 5,
                          spreadRadius: 3,
                          color: Color.fromARGB(255, 201, 199, 199),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: num4controller,
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 50,
                    margin: const EdgeInsets.all(3),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(style: BorderStyle.solid),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 2),
                          blurRadius: 5,
                          spreadRadius: 3,
                          color: Color.fromARGB(255, 201, 199, 199),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: num5controller,
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 50,
                    margin: const EdgeInsets.all(3),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(style: BorderStyle.solid),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 2),
                          blurRadius: 5,
                          spreadRadius: 3,
                          color: Color.fromARGB(255, 201, 199, 199),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: num6controller,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              "Don’t receive OTP code! Resend",
              style: TextStyle(fontSize: 15),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 60,
              width: 360,
              decoration: const BoxDecoration(
                // gradient: LinearGradient(
                //   colors: [
                //     Color.fromRGBO(124, 180, 70, 1),
                //     Color.fromRGBO(62, 102, 24, 1),
                //   ],
                // ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(124, 180, 70, 1),
                    Color.fromRGBO(62, 102, 24, 1),
                  ],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  // shadowColor: MaterialStatePropertyAll(
                  //   Color.fromRGBO(124, 180, 70, 1),
                  // ),
                ),
                onPressed: () {
                  verifyotp();
                 
                },
                child: const Text(
                  "Submit",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            const Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}
