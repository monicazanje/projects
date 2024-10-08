import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_app/controller/resistercontroller.dart';
import 'package:flutter_app/view/forgotpass.dart';
import 'package:flutter_app/view/homescreen.dart';
import 'package:flutter_app/view/signup.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final regProvider = Provider.of<RegisterController>(context);
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 30, top: 40),
              child: Text(
                "FarmerEats",
                textAlign: TextAlign.center,
                style: GoogleFonts.beVietnamPro(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(0, 0, 0, 1),
                ),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            Container(
              margin: const EdgeInsets.only(left: 30, top: 40),
              child: Text(
                "Welcome back!",
                textAlign: TextAlign.center,
                style: GoogleFonts.beVietnamPro(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: const Color.fromRGBO(0, 0, 0, 1),
                ),
              ),
            ),
            // const SizedBox(height: 24,),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 30, top: 24),
                  child: Text(
                    "New here?",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.beVietnamPro(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromARGB(255, 147, 147, 147),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const Signup();
                    }));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 5, top: 24),
                    child: Text(
                      " Create account",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.beVietnamPro(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(213, 113, 91, 1),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: 30, right: 30, top: 72, bottom: 10),
              height: 50,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 226, 226, 226),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: TextField(
                controller: regProvider.emailController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Email Address",
                  hintStyle: GoogleFonts.beVietnamPro(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(0, 0, 0, 0.3),
                  ),
                  prefixIcon: const Icon(Icons.alternate_email),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: 30, right: 30, top: 14, bottom: 10),
              height: 50,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 226, 226, 226),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: TextField(
                controller: regProvider.passController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Password",
                    hintStyle: GoogleFonts.beVietnamPro(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(0, 0, 0, 0.3),
                    ),
                    prefixIcon: Image.asset("assets/Vector.png"),
                    suffix: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const Forgotpass();
                        }));
                      },
                      child: Text(
                        "Forgot?   ",
                        style: GoogleFonts.beVietnamPro(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(213, 113, 91, 1),
                        ),
                      ),
                    )),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (regProvider.emailController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Please enter your email address.')),
                  );
                } else if (regProvider.passController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Please enter your password.')),
                  );
                } else {
                  loginPostRequest(
                    regProvider.emailController.text,
                    regProvider.passController.text,
                  );
                }
              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.6,
                margin: const EdgeInsets.only(left: 100, right: 80, top: 30),
                padding: const EdgeInsets.all(10),
                height: 50,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(213, 113, 91, 1),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Text(
                  "Login",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.beVietnamPro(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 30, top: 40),
              child: Text(
                "or login with",
                textAlign: TextAlign.center,
                style: GoogleFonts.beVietnamPro(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromARGB(51, 24, 18, 12),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 30, right: 30, top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 52,
                    width: 96,
                    decoration: BoxDecoration(
                        border: Border.all(
                          style: BorderStyle.solid,
                          color: const Color.fromARGB(255, 226, 226, 226),
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30))),
                    child: Image.asset("assets/g1520.png"),
                  ),
                  Container(
                    height: 52,
                    width: 96,
                    decoration: BoxDecoration(
                        border: Border.all(
                          style: BorderStyle.solid,
                          color: const Color.fromARGB(255, 226, 226, 226),
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30))),
                    child: Image.asset("assets/Frame 4.png"),
                  ),
                  Container(
                    height: 52,
                    width: 96,
                    decoration: BoxDecoration(
                        border: Border.all(
                          style: BorderStyle.solid,
                          color: const Color.fromARGB(255, 226, 226, 226),
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30))),
                    child: Image.asset("assets/Facebook_f_logo_(2019) 1.png"),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> loginPostRequest(String name, String password) async {
    String baseUrl = 'https://sowlab.com';
    String endpoint = '/assignment/#/Login%2FRegister/post_user_login';
    String fullUrl = baseUrl + endpoint;

    Map<String, dynamic> requestData = {
      "email": name,
      "password": password,
      "role": "farmer",
      "device_token": "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx",
      "type": "email/facebook/google/apple",
      "social_id": "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx"
    };
    try {
      final response = await http.post(
        Uri.parse(fullUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestData),
      );
      if (response.statusCode == 200) {
        log('Success: ${response.body}');
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const HomeScreen();
        }));
      } else {
        log('Error: ${response.statusCode}, ${response.body}');
        log('Error: Unexpected response format');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text(
                  'Unexpected response from the server. Please try again later.')),
        );
      }
    } catch (e) {
      log('Exception: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Error occurred. Please try again later.')),
      );
    }
  }
}
