import 'package:flutter/material.dart';
import 'package:flutter_app/controller/resistercontroller.dart';
import 'package:flutter_app/view/signupveri2.dart';
import 'package:flutter_app/view/timeslotwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Signuphours extends StatefulWidget {
  const Signuphours({
    super.key,
  });

  @override
  State<Signuphours> createState() => _SignuphourState();
}

class _SignuphourState extends State<Signuphours> {
  List<String> days = ["M", "T", "W", "Th", "F", "S", "Su"];

  @override
  Widget build(BuildContext context) {
    final regProvider = Provider.of<RegisterController>(context);
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
            margin: const EdgeInsets.only(right: 2 + 0, left: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(days.length, (index) {
                String day = days[index];
                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        regProvider.selectedSize = day;
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
                        color: regProvider.selectedSize == day
                            ? const Color.fromRGBO(213, 113, 91, 1)
                            : days.indexOf(regProvider.selectedSize) > index
                                ? Colors.grey
                                : Colors.transparent,
                      ),
                      child: Text(
                        day,
                        style: GoogleFonts.imprima(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: regProvider.selectedSize == day
                              ? Colors.white
                              : days.indexOf(regProvider.selectedSize) > index
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
                TimeSlotWidget(timeSlot: "8:00am - 10:00am"),
                const Spacer(flex: 1,),
                TimeSlotWidget(timeSlot: "10:00am - 12:00pm"),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
            child: Row(
              children: [
                TimeSlotWidget(timeSlot: "12:00pm - 2:00pm"),
                const Spacer(flex: 1,),
                TimeSlotWidget(timeSlot: "2:00pm - 4:00pm"),
              ],
            ),
          ),
          TimeSlotWidget(timeSlot: "4:00pm - 6:00pm"),
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
                    if (regProvider.allfieldfill3()) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Signupver2();
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
