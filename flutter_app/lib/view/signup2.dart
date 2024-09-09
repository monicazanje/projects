import 'package:flutter/material.dart';
import 'package:flutter_app/view/signupverification.dart';
import 'package:google_fonts/google_fonts.dart';

class Signup2 extends StatefulWidget {
  final TextEditingController namecontroller;
  final TextEditingController emailcontroller;
  final TextEditingController phonecontroller;
  final TextEditingController passcontroller;
  final TextEditingController repasscontroller;

  const Signup2(
      {super.key,
      required this.emailcontroller,
      required this.namecontroller,
      required this.passcontroller,
      required this.phonecontroller,
      required this.repasscontroller});
  @override
  State<Signup2> createState() => _Signup2State();
}

class _Signup2State extends State<Signup2> {
  TextEditingController businesscontroller = TextEditingController();
  TextEditingController informalcontroller = TextEditingController();
  TextEditingController streetcontroller = TextEditingController();
  TextEditingController citycontroller = TextEditingController();
  TextEditingController zipcodecontroller = TextEditingController();

  bool allfieldfill() {
    return businesscontroller.text.isNotEmpty &&
        informalcontroller.text.isNotEmpty &&
        streetcontroller.text.isNotEmpty &&
        citycontroller.text.isNotEmpty &&
        zipcodecontroller.text.isNotEmpty &&
        selectedState.isNotEmpty;
  }

  String selectedState="";
  List<String> statesOfIndia = [
    "Assam",
    "Bihar",
    "Chhattisgarh",
    "Goa",
    "Gujarat",
    "Haryana",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "Maharashtra",
    "Manipur",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Odisha",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
    "Telangana",
    "Tripura",
    "Uttarakhand",
    "West Bengal"
  ];

  @override
  Widget build(BuildContext context) {
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
            Container(
              margin: const EdgeInsets.only(left: 30, top: 30),
              child: Text(
                "Signup 2 of 4",
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
                "Farm Info",
                textAlign: TextAlign.center,
                style: GoogleFonts.beVietnamPro(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: const Color.fromRGBO(0, 0, 0, 1),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: 30, right: 30, top: 40, bottom: 10),
              height: 50,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 226, 226, 226),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: TextField(
                controller: businesscontroller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Business Name",
                  hintStyle: GoogleFonts.beVietnamPro(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(0, 0, 0, 0.3),
                  ),
                  prefixIcon: Image.asset("assets/Vector (2).png"),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: 30, right: 30, top: 10, bottom: 10),
              height: 50,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 226, 226, 226),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: TextField(
                controller: informalcontroller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Informal Name",
                  hintStyle: GoogleFonts.beVietnamPro(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(0, 0, 0, 0.3),
                  ),
                  prefixIcon: Image.asset(
                    "assets/Group 57@2x.png",
                    scale: 1.5,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: 30, right: 30, top: 10, bottom: 10),
              height: 50,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 226, 226, 226),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: TextField(
                controller: streetcontroller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Street Address",
                  hintStyle: GoogleFonts.beVietnamPro(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(0, 0, 0, 0.3),
                  ),
                  prefixIcon: Image.asset(
                    "assets/Vector@2x.png",
                    height: 10,
                    width: 10,
                    scale: 1.5,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: 30, right: 30, top: 10, bottom: 10),
              height: 50,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 226, 226, 226),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: TextField(
                controller: citycontroller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "city",
                  hintStyle: GoogleFonts.beVietnamPro(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(0, 0, 0, 0.3),
                  ),
                  prefixIcon: Image.asset(
                    "assets/Group 58@2x.png",
                    scale: 1.7,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 30, top: 10),
                  padding: const EdgeInsets.only(left: 10, top: 5, ),
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.45,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 226, 226, 226),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: DropdownButtonFormField<String>(
                    // isDense: false,
                    value: selectedState,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 0),
                    ),
                    hint: Text(
                      "State",
                      style: GoogleFonts.beVietnamPro(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(0, 0, 0, 0.3),
                      ),
                    ),
                    items: statesOfIndia.map((String state) {
                      return DropdownMenuItem<String>(
                        value: state,
                        child: Text(
                          state,
                          style: GoogleFonts.beVietnamPro(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(0, 0, 0, 0.3),
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedState = newValue!;
                      });
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 30, top: 10,left: 10),
                  padding: const EdgeInsets.only(left: 30),
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.35,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 226, 226, 226),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: TextField(
                    controller: zipcodecontroller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Zipcode",
                      hintStyle: GoogleFonts.beVietnamPro(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(0, 0, 0, 0.3),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            Container(
              margin: const EdgeInsets.only(left: 30, right: 30, top: 50),
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
                          return Signupver(
                            namecontroller: widget.namecontroller,
                            emailcontroller: widget.emailcontroller,
                            phonecontroller: widget.phonecontroller,
                            passcontroller: widget.passcontroller,
                            repasscontroller: widget.repasscontroller,
                            businesscontroller: businesscontroller,
                            citycontroller: citycontroller,
                            informalcontroller: informalcontroller,
                            streetcontroller: streetcontroller,
                            zipcodecontroller: zipcodecontroller,
                            selectstate: selectedState,
                          );
                        }));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please fill in all the fields.'),
                          ),
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
      ),
    );
  }
}
