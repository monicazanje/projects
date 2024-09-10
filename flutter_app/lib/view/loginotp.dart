import 'dart:convert';
import 'dart:developer';
import 'package:flutter_app/controller/resistercontroller.dart';
import 'package:http/http.dart ' as http;
import 'package:flutter/material.dart';
import 'package:flutter_app/view/loginscreen.dart';
import 'package:flutter_app/view/resetpass.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class LoginOtp extends StatefulWidget {

  const LoginOtp({super.key});
  @override
  State<LoginOtp> createState() => _LoginOtpState();
}

class _LoginOtpState extends State<LoginOtp> {
  


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
                "Verify OTP",
                textAlign: TextAlign.center,
                style: GoogleFonts.beVietnamPro(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: const Color.fromRGBO(0, 0, 0, 1),
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 30, top: 24),
                  child: Text(
                    "Remember your pasword?",
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
                      return const Login();
                    }));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 5, top: 24),
                    child: Text(
                      " Login",
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
              alignment: Alignment.center,
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.only(top: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(6, (index) {
                  return Container(
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 226, 226, 226),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    width: 58,
                    height: 59,
                    child: TextField(
                      controller: regProvider.otpcontroller[index],
                      focusNode: regProvider.focusNodes[index],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      decoration: const InputDecoration(
                          border: InputBorder.none, counterText: ''),
                      onChanged: (value) =>regProvider.handleOtpInput(index, value),
                    ),
                  );
                }),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ResetPass(otpcontroller: regProvider.otpcontroller,);
                }));
              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 1,
                margin: const EdgeInsets.only(left: 30, right: 30, top: 30),
                padding: const EdgeInsets.all(10),
                height: 52,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(213, 113, 91, 1),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Text(
                  "Submit",
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
              margin: const EdgeInsets.only(top: 10),
              alignment: Alignment.center,
              child: Text(
                "Resend Code",
                textAlign: TextAlign.center,
                style: GoogleFonts.beVietnamPro(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(0, 0, 0, 1),
                    decoration: TextDecoration.underline),
              ),
            )
          ],
        ),
      ),
    );
  }
  
  Future<void> resetpassPostRequest(dynamic otp) async {
  String baseUrl = 'https://sowlab.com';
  String endpoint = '/assignment/#/Verify%20OTP/post_user_verify_otp'; 
  String fullUrl = baseUrl + endpoint;
  Map<String, dynamic> requestData = {
    'otp': otp, 
  };
 try {
    final response = await http.post(
      Uri.parse(fullUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(requestData),
    );
    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);

      if (responseBody['success'] == 'true') {
        log('Success: ${responseBody['message']}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(responseBody['message'])),
        );
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const Login();
        }));
      } else {
        log('Failed: ${responseBody['message']}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(responseBody['message'])),
        );
      }
    } else {
      log('Error: ${response.statusCode}, ${response.body}');
    }
  } catch (e) {
    log('Exception: $e');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Error occurred. Please try again later.')),
    );
  }
}
}
