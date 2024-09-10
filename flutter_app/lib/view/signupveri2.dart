

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/view/signupconf.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class Signupver2 extends StatefulWidget {
  final TextEditingController namecontroller;
  final TextEditingController emailcontroller;
  final TextEditingController phonecontroller;
  final TextEditingController passcontroller;
  final TextEditingController repasscontroller;
  final TextEditingController businesscontroller;
  final TextEditingController informalcontroller;
  final TextEditingController streetcontroller;
  final TextEditingController citycontroller;
  final TextEditingController zipcodecontroller;
  String? selectstate;
  final FormData? data;
  final String? selectedSize;
  Set<String> selecttime;
  Signupver2(
      {super.key,
      required this.emailcontroller,
      required this.namecontroller,
      required this.passcontroller,
      required this.phonecontroller,
      required this.repasscontroller,
      required this.businesscontroller,
      required this.citycontroller,
      required this.informalcontroller,
      required this.selectstate,
      required this.streetcontroller,
      required this.zipcodecontroller,
      required this.data,
      required this.selectedSize,
      required this.selecttime});
  @override
  State<Signupver2> createState() => _Signupver2State();
}

class _Signupver2State extends State<Signupver2> {
  bool isLoading = false;
  String? getFileName() {
    if (widget.data != null) {
      for (var entry in widget.data!.files) {
        String fileName = entry.value.filename ?? 'No file selected';
        return fileName;
      }
    }
    return 'No file selected';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
          Container(
            margin: const EdgeInsets.only(left: 30, top: 40),
            child: Text(
              "Signup 3 of 4",
              textAlign: TextAlign.center,
              style: GoogleFonts.beVietnamPro(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: const Color.fromRGBO(0, 0, 0, 0.3),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 30),
            child: Text(
              "Verification",
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
              "Attached proof of Department of Agriculture registrations i.e. Florida Fresh, USDA Approved, USDA Organic",
              textAlign: TextAlign.start,
              style: GoogleFonts.beVietnamPro(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: const Color.fromRGBO(0, 0, 0, 1),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 30, right: 30, top: 30),
            child: Row(
              children: [
                Text(
                  "Attach proof of registration",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.beVietnamPro(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(0, 0, 0, 1),
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 53,
                    width: 53,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(213, 113, 91, 1),
                    ),
                    child: Image.asset(
                      "assets/Group 61@2x.png",
                      scale: 2,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 30, right: 30, top: 30),
            padding: const EdgeInsets.all(16),
            height: 50,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 203, 203, 203),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Row(
              children: [
                Text(
                  getFileName() ?? "",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.beVietnamPro(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(0, 0, 0, 1),
                      decoration: TextDecoration.underline),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {},
                    padding: const EdgeInsets.only(bottom: 20),
                    icon: const Icon(Icons.cancel_outlined))
              ],
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          Container(
            margin:
                const EdgeInsets.only(left: 30, right: 30, top: 70, bottom: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    alignment: Alignment.center,
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 30,
                        ))),
                GestureDetector(
                  onTap: () {
                    onTap:
                    isLoading ? null : signupPostRequest;
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.6,
                    padding: const EdgeInsets.only(
                        left: 30, right: 30, top: 10, bottom: 10),
                    height: 52,
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(213, 113, 91, 1),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Text(
                      isLoading ? "Loading..." : "Continue",
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
          )
        ],
      ),
    );
  }

  Future<void> signupPostRequest() async {
    var dio = Dio();
    setState(() {
      isLoading = true;
    });

    try {
      String url = 'https://sowlab.com/assignment/#/Login%2FRegister/post_user_register';

      FormData formData = FormData.fromMap({
        'name': widget.namecontroller.text,
        'email': widget.emailcontroller.text,
        'phone': widget.phonecontroller.text,
        'password': widget.passcontroller.text,
        'business_name': widget.businesscontroller.text,
        'informal_name': widget.informalcontroller.text,
        'street': widget.streetcontroller.text,
        'city': widget.citycontroller.text,
        'zipcode': widget.zipcodecontroller.text,
        'state': widget.selectstate,
        'file': widget.data?.files[0],
      });
      Response response = await dio.post(url, data: formData);

      if (response.statusCode == 200) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Signupconf()));
      } else {
        log('Error: ${response.statusCode}, ${response.data}');
      }
    } catch (e) {
      log('Error: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
}
