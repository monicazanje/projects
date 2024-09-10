import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/view/signupveri2.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class Signuphours extends StatefulWidget {
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
  Signuphours(
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
      required this.data});

  @override
  State<Signuphours> createState() => _SignuphourState();
}

class _SignuphourState extends State<Signuphours> {
  String selectedSize = '';
  Set<String> selecttime = {};
  List<String> days = ["M", "T", "W", "Th", "F", "S", "Su"];

  bool allfieldfill() {
    return selectedSize.isNotEmpty && selecttime.isNotEmpty;
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
              "Signup 4 of 4",
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
              "Business Hours",
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
              "Choose the hours your farm is open for pickups. This will allow customers to order deliveries.",
              textAlign: TextAlign.start,
              style: GoogleFonts.beVietnamPro(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: const Color.fromRGBO(0, 0, 0, 1),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 2+0, left: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(days.length, (index) {
                String day = days[index];
                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedSize = day;
                      });
                    },
                    child: Container(
                      height: 35,
                      margin: const EdgeInsets.only(right: 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                            style: BorderStyle.solid,
                            color: const Color.fromRGBO(38, 28, 18, 0.3)),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: selectedSize == day
                            ? const Color.fromRGBO(213, 113, 91, 1)
                            : days.indexOf(selectedSize) > index
                                ? Colors.grey
                                : Colors.transparent,
                      ),
                      child: Text(
                        day,
                        style: GoogleFonts.imprima(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: selectedSize == day
                              ? Colors.white
                              : days.indexOf(selectedSize) > index
                                  ? Colors.white
                                  : const Color.fromRGBO(121, 119, 128, 1),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          Container(
            margin:
                const EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 10),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (selecttime.contains("8:00am - 10:00am")) {
                        selecttime.remove("8:00am - 10:00am");
                      } else {
                        selecttime.add("8:00am - 10:00am");
                      }
                    });
                  },
                  child: Container(
                    height: 48,
                    width: 140,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(
                          style: BorderStyle.solid,
                          color: const Color.fromRGBO(38, 28, 18, 0.3),
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: selecttime.contains("8:00am - 10:00am")
                            ? const Color.fromRGBO(248, 197, 105, 1)
                            : const Color.fromARGB(255, 203, 203, 203)),
                    child: Text(
                      "8:00am - 10:00am",
                      style: GoogleFonts.imprima(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromARGB(255, 92, 92, 92)),
                    ),
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (selecttime.contains("10:00am - 1:00pm")) {
                        selecttime.remove("10:00am - 1:00pm");
                      } else {
                        selecttime.add("10:00am - 1:00pm");
                      }
                    });
                  },
                  child: Container(
                    height: 48,
                    width: 140,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(
                          style: BorderStyle.solid,
                          color: const Color.fromRGBO(38, 28, 18, 0.3),
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: selecttime.contains("10:00am - 1:00pm")
                            ? const Color.fromRGBO(248, 197, 105, 1)
                            : const Color.fromARGB(255, 203, 203, 203)),
                    child: Text(
                      "10:00am - 1:00pm",
                      style: GoogleFonts.imprima(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 92, 92, 92)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (selecttime.contains("1:00pm - 4:00pm")) {
                        selecttime.remove("1:00pm - 4:00pm");
                      } else {
                        selecttime.add("1:00pm - 4:00pm");
                      }
                    });
                  },
                  child: Container(
                    height: 48,
                    width: 140,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(
                          style: BorderStyle.solid,
                          color: const Color.fromRGBO(38, 28, 18, 0.3),
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: selecttime.contains("1:00pm - 4:00pm")
                            ? const Color.fromRGBO(248, 197, 105, 1)
                            : const Color.fromARGB(255, 203, 203, 203)),
                    child: Text(
                      "1:00pm - 4:00pm",
                      style: GoogleFonts.imprima(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 92, 92, 92)),
                    ),
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (selecttime.contains("4:00pm - 7:00pm")) {
                        selecttime.remove("4:00pm - 7:00pm");
                      } else {
                        selecttime.add("4:00pm - 7:00pm");
                      }
                    });
                  },
                  child: Container(
                    height: 48,
                    width: 140,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(
                          style: BorderStyle.solid,
                          color: const Color.fromRGBO(38, 28, 18, 0.3),
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: selecttime.contains("4:00pm - 7:00pm")
                            ? const Color.fromRGBO(248, 197, 105, 1)
                            : const Color.fromARGB(255, 203, 203, 203)),
                    child: Text(
                      "4:00pm - 7:00pm",
                      style: GoogleFonts.imprima(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 92, 92, 92)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                if (selecttime.contains("7:00pm - 10:00pm")) {
                  selecttime.remove("7:00pm - 10:00pm");
                } else {
                  selecttime.add("7:00pm - 10:00pm");
                }
              });
            },
            child: Container(
              height: 48,
              width: 140,
              margin: const EdgeInsets.only(left: 30),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(
                    style: BorderStyle.solid,
                    color: const Color.fromRGBO(38, 28, 18, 0.3),
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: selecttime.contains("7:00pm - 10:00pm")
                      ? const Color.fromRGBO(248, 197, 105, 1)
                      : const Color.fromARGB(255, 203, 203, 203)),
              child: Text(
                "7:00pm - 10:00pm",
                style: GoogleFonts.imprima(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromARGB(255, 92, 92, 92)),
              ),
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
                    if (allfieldfill()) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Signupver2(
                          namecontroller: widget.namecontroller,
                          emailcontroller: widget.emailcontroller,
                          phonecontroller: widget.phonecontroller,
                          passcontroller: widget.passcontroller,
                          repasscontroller: widget.repasscontroller,
                          businesscontroller: widget.businesscontroller,
                          citycontroller: widget.citycontroller,
                          informalcontroller: widget.informalcontroller,
                          selectstate: widget.selectstate,
                          streetcontroller: widget.streetcontroller,
                          zipcodecontroller: widget.zipcodecontroller,
                          data: widget.data,
                          selectedSize: selectedSize,
                          selecttime: selecttime,
                        );
                      }));
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
                      "Signup",
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
