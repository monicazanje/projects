
import 'package:flutter/material.dart';
import 'package:flutter_app/controller/resistercontroller.dart';
import 'package:flutter_app/view/signuphours.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Signupver extends StatefulWidget {
  Signupver({
    super.key,
  });
  @override
  State<Signupver> createState() => _SignupverState();
}

class _SignupverState extends State<Signupver> {
  @override
  Widget build(BuildContext context) {
    final regProvider=Provider.of<RegisterController>(context);
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
                  onTap: () async {
                    regProvider.data = await regProvider.uplodaepdf();
                  },
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
                    if (regProvider.data != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Signuphours(
                          ),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text(
                                "Please attach a file before continuing.")),
                      );
                    }
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
                      "Continue",
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
}
