import 'package:flutter/material.dart';
import 'package:flutter_app/view/loginscreen.dart';
import 'package:google_fonts/google_fonts.dart';

class Signupconf extends StatefulWidget {
  const Signupconf({super.key});
  @override
  State<Signupconf> createState() => _SignupconfState();
}

class _SignupconfState extends State<Signupconf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(
            flex: 1,
          ),
          Container(
            alignment: Alignment.center,
            child: Image.asset(
              "assets/Vector@3x.png",
              scale: 2,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 30, top: 30),
            child: Text(
              "You’re all done!",
              textAlign: TextAlign.center,
              style: GoogleFonts.beVietnamPro(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: const Color.fromRGBO(0, 0, 0, 1),
              ),
            ),
          ),
          Container(
            margin:
                const EdgeInsets.only(left: 30, right: 30, top: 24, bottom: 24),
            child: Text(
              "Hang tight!  We are currently reviewing your account and will follow up with you in 2-3 business days. In the meantime, you can setup your inventory.",
              textAlign: TextAlign.center,
              style: GoogleFonts.beVietnamPro(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: const Color.fromRGBO(0, 0, 0, 1),
              ),
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.9,
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
            margin: const EdgeInsets.only(left: 30, right: 30, bottom: 50),
            height: 52,
            decoration: const BoxDecoration(
                color: Color.fromRGBO(213, 113, 91, 1),
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const Login();
                }));
              },
              child: Text(
                "Got it!",
                textAlign: TextAlign.center,
                style: GoogleFonts.beVietnamPro(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
