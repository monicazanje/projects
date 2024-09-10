import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_app/view/loginscreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class ResetPass extends StatefulWidget {
  List<TextEditingController> otpcontroller =
      List.generate(6, (_) => TextEditingController());
  ResetPass({super.key,required this.otpcontroller});
  @override
  State<ResetPass> createState() => _ResetPassState();
}

class _ResetPassState extends State<ResetPass> {
  TextEditingController newpasscontroller = TextEditingController();
  TextEditingController confpasscontroller = TextEditingController();
  bool validatePasswords() {
    String newPassword = newpasscontroller.text.trim();
    String confirmPassword = confpasscontroller.text.trim();

    if (newPassword.isEmpty || confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Both fields are required'),
        ),
      );
      return false;
    }

    if (newPassword != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Passwords do not match'),
        ),
      );
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 30, top: 30),
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
                "Reset Password",
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
              margin: const EdgeInsets.only(
                  left: 30, right: 30, top: 70, bottom: 10),
              height: 50,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 226, 226, 226),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: TextField(
                controller: newpasscontroller,
                obscureText: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "New Password",
                  hintStyle: GoogleFonts.beVietnamPro(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(0, 0, 0, 0.3),
                  ),
                  prefixIcon: Image.asset("assets/Vector.png"),
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
                controller: confpasscontroller,
                obscureText: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Confirm New Password",
                  hintStyle: GoogleFonts.beVietnamPro(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(0, 0, 0, 0.3),
                  ),
                  prefixIcon: Image.asset("assets/Vector.png"),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                resetpassPostRequest(widget.otpcontroller,newpasscontroller.text,confpasscontroller.text);
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
          ],
        ),
      ),
    );
  }
  Future<void> resetpassPostRequest(List<TextEditingController> otpControllers, String newpass, String cnewpass) async {
  String baseUrl = 'https://sowlab.com';
  String endpoint = '/assignment/#/Verify%20OTP/post_user_reset_password'; 
  String fullUrl = baseUrl + endpoint;
  String otp = otpControllers.map((controller) => controller.text.trim()).join('');

  Map<String, dynamic> requestData = {
    'token': otp, 
    'password': newpass, 
    'cpassword': cnewpass 
  };

  try {
    final response = await http.post(
      Uri.parse(fullUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(requestData),
    );

    log('Response body: ${response.body}');

    if (response.headers['content-type']?.contains('application/json') == true) {
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

      log('Error: Unexpected response format');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Unexpected response from the server. Please try again later.')),
      );
    }
  } catch (e) {
    log('Exception: $e');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Error occurred. Please try again later.')),
    );
  }
}

  
//   Future<void> resetpassPostRequest(List<TextEditingController> token,String newpass,String cnewpass) async {
//   String baseUrl = 'https://sowlab.com';
//   String endpoint = '/assignment/#/Verify%20OTP/post_user_reset_password'; 
//   String fullUrl = baseUrl + endpoint;
//   String otp = widget.otpcontroller.map((controller) => controller.text.trim()).join('');
//   Map<String, dynamic> requestData = {
//     'token': otp,
//     'password':newpass,
//     'cpassword':cnewpass  
//   };
//  try {
//     final response = await http.post(
//       Uri.parse(fullUrl),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode(requestData),
//     );
//     if (response.statusCode == 200) {
//       var responseBody = jsonDecode(response.body);

//       if (responseBody['success'] == 'true') {
//         log('Success: ${responseBody['message']}');
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(responseBody['message'])),
//         );
//         Navigator.push(context, MaterialPageRoute(builder: (context) {
//           return const Login();
//         }));
//       } else {
//         log('Failed: ${responseBody['message']}');
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(responseBody['message'])),
//         );
//       }
//     } else {
//       log('Error: ${response.statusCode}, ${response.body}');
//     }
//   } catch (e) {
//     log('Exception: $e');
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text('Error occurred. Please try again later.')),
//     );
//   }
// }
}
