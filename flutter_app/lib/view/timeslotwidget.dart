import 'package:flutter/material.dart';
import 'package:flutter_app/controller/resistercontroller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TimeSlotWidget extends StatelessWidget {
  final String timeSlot;

  TimeSlotWidget({required this.timeSlot});

  @override
  Widget build(BuildContext context) {
    final regProvider = Provider.of<RegisterController>(context);

    return GestureDetector(
      onTap: () {
        // Add or remove the time slot on tap
        regProvider.toggleTimeSlot(timeSlot);
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
          color: regProvider.selectTime.contains(timeSlot)
              ? const Color.fromRGBO(248, 197, 105, 1)
              : const Color.fromARGB(255, 203, 203, 203),
        ),
        child: Text(
          timeSlot,
          style: GoogleFonts.imprima(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: const Color.fromARGB(255, 92, 92, 92)),
        ),
      ),
    );
  }
}
