import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plants_app/view/login.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});
  @override
  State createState() => _GetstartedState();
}

class _GetstartedState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 32,
            color: const Color.fromRGBO(123, 123, 123, 1),
          ),
          const Spacer(
            flex: 1,
          ),
          Container(
            height: 450,
            width: 360,
            margin: const EdgeInsets.all(10),
            padding:
                const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
            decoration: const BoxDecoration(boxShadow: [
              BoxShadow(
                  blurRadius: 10,
                  color: Color.fromARGB(255, 236, 235, 235),
                  spreadRadius: 10)
            ]),
            child: Image.asset(
              "assets/plantimg1.png",
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          SizedBox(
            height: 90,
            width: 250,
            child: Text(
              "Enjoy your life with Plants",
              style: GoogleFonts.poppins(
                  fontSize: 34, fontWeight: FontWeight.w400),
            ),
          ),
          Container(
            height: 50,
            width: 320,
            margin: const EdgeInsets.only(
              top: 50,
              left: 15,
              right: 15,
              bottom: 90,
            ),
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 50,
                  spreadRadius: 5,
                  color: Color.fromRGBO(222, 247, 200, 1),
                  blurStyle: BlurStyle.normal,
                ),
              ],
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Login()));
              },
              child: const Text(
                "Get Started >",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
