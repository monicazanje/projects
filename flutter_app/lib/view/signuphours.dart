import 'package:flutter/material.dart';
import 'package:flutter_app/view/signupveri2.dart';
import 'package:google_fonts/google_fonts.dart';

class Signuphours extends StatefulWidget{
  const Signuphours({super.key});
  @override
  State<Signuphours>createState()=>_SignuphourState();
}
class _SignuphourState extends State<Signuphours>{
  String? selectedSize;
  String? selecttime;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
                margin: const EdgeInsets.only(left: 30,top:40),
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
                margin: const EdgeInsets.only(left: 30,top:40),
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
                margin: const EdgeInsets.only(left: 30,right: 30,top: 24,bottom: 24),
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
            margin: const EdgeInsets.only(right: 30, left: 30),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedSize = "M";
                    });
                  },
                  child: Container(
                    height: 35,
                    width: 35,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(style: BorderStyle.solid,color: const  Color.fromRGBO(38,28,18,0.3)),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: selectedSize == "M"
                          ? const  Color.fromRGBO(213, 113, 91, 1)
                          : Colors.transparent,
                    ),
                    child: Text(
                      "M",
                      style: GoogleFonts.imprima(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: selectedSize == "M"
                            ? Colors.white
                            : const Color.fromRGBO(121, 119, 128, 1),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedSize = "T";
                    });
                  },
                  child: Container(
                    height: 35,
                    width: 35,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(style: BorderStyle.solid,color: const  Color.fromRGBO(38,28,18,0.3)),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: selectedSize == "T"
                          ? const  Color.fromRGBO(213, 113, 91, 1)
                          : Colors.transparent,
                    ),
                    child: Text(
                      "T",
                      style: GoogleFonts.imprima(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: selectedSize == "T"
                            ? Colors.white
                            : const Color.fromRGBO(121, 119, 128, 1),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedSize = "W";
                    });
                  },
                  child: Container(
                    height: 35,
                    width: 35,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(style: BorderStyle.solid,color: const  Color.fromRGBO(38,28,18,0.3)),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: selectedSize == "W"
                          ? const  Color.fromRGBO(213, 113, 91, 1)
                          : Colors.transparent,
                    ),
                    child: Text(
                      "W",
                      style: GoogleFonts.imprima(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: selectedSize == "W"
                            ? Colors.white
                            : const Color.fromRGBO(121, 119, 128, 1),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedSize = "Th";
                    });
                  },
                  child: Container(
                    height: 35,
                    width: 35,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(style: BorderStyle.solid,color: const  Color.fromRGBO(38,28,18,0.3)),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: selectedSize == "Th"
                          ? const  Color.fromRGBO(213, 113, 91, 1)
                          : Colors.transparent,
                    ),
                    child: Text(
                      "Th",
                      style: GoogleFonts.imprima(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: selectedSize == "Th"
                            ? Colors.white
                            : const Color.fromRGBO(121, 119, 128, 1),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedSize = "F";
                    });
                  },
                  child: Container(
                    height: 35,
                    width: 35,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(style: BorderStyle.solid,color: const  Color.fromRGBO(38,28,18,0.3)),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: selectedSize == "F"
                          ? const  Color.fromRGBO(213, 113, 91, 1)
                          : Colors.transparent,
                    ),
                    child: Text(
                      "F",
                      style: GoogleFonts.imprima(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: selectedSize == "F"
                            ? Colors.white
                            : const Color.fromRGBO(121, 119, 128, 1),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedSize = "S";
                    });
                  },
                  child: Container(
                    height: 35,
                    width: 35,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(style: BorderStyle.solid,color: const  Color.fromRGBO(38,28,18,0.3)),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: selectedSize == "S"
                          ? const  Color.fromRGBO(213, 113, 91, 1)
                          : Colors.transparent,
                    ),
                    child: Text(
                      "S",
                      style: GoogleFonts.imprima(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: selectedSize == "S"
                            ? Colors.white
                            : const Color.fromRGBO(121, 119, 128, 1),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedSize = "Su";
                    });
                  },
                  child: Container(
                    height: 35,
                    width: 35,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(style: BorderStyle.solid,color: const  Color.fromRGBO(38,28,18,0.3),),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: selectedSize == "Su"
                          ? const  Color.fromRGBO(213, 113, 91, 1)
                          : Colors.transparent,
                    ),
                    child: Text(
                      "Su",
                      style: GoogleFonts.imprima(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: selectedSize == "Su"
                            ? Colors.white
                            : const Color.fromRGBO(121, 119, 128, 1),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 30,right: 30,top: 30,bottom: 10),
            child: Row(children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selecttime = "8:00am - 10:00am";
                    });
                  },
                  child: Container(
                    height: 48,
                    width: 160,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(style: BorderStyle.solid,color: const  Color.fromRGBO(38,28,18,0.3),),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: selecttime == "8:00am - 10:00am"
                          ? const Color.fromARGB(255, 203, 203, 203)
                          : const  Color.fromRGBO(248, 197, 105, 1)
                    ),
                    child: Text(
                      "8:00am - 10:00am",
                      style: GoogleFonts.imprima(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: const Color.fromARGB(255, 92, 92, 92)
                      ),
                    ),
                  ),
                ),
                const Spacer(flex: 1,),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selecttime = "10:00am - 1:00pm";
                    });
                  },
                  child: Container(
                    height: 48,
                    width: 160,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(style: BorderStyle.solid,color: const  Color.fromRGBO(38,28,18,0.3),),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: selecttime == "10:00am - 1:00pm"
                          ? const Color.fromARGB(255, 203, 203, 203)
                          : const  Color.fromRGBO(248, 197, 105, 1)
                          
                    ),
                    child: Text(
                      "10:00am - 1:00pm",
                      style: GoogleFonts.imprima(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 92, 92, 92)
                      ),
                    ),
                  ),
                ),

            ],),
          ),
          Container(
            margin: const EdgeInsets.only(left: 30,right: 30,bottom: 10),
            child: Row(children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selecttime = "1:00pm - 4:00pm";
                    });
                  },
                  child: Container(
                    height: 48,
                    width: 160,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(style: BorderStyle.solid,color: const  Color.fromRGBO(38,28,18,0.3),),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color:selecttime == "1:00pm - 4:00pm"
                          ? const  Color.fromRGBO(213, 113, 91, 1)
                          : const Color.fromARGB(255, 203, 203, 203)
                    ),
                    child: Text(
                      "1:00pm - 4:00pm",
                      style: GoogleFonts.imprima(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 92, 92, 92)
                      ),
                    ),
                  ),
                ),
                const Spacer(flex: 1,),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selecttime = "4:00pm - 7:00pm";
                    });
                  },
                  child: Container(
                    height: 48,
                    width: 160,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(style: BorderStyle.solid,color: const  Color.fromRGBO(38,28,18,0.3),),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: selecttime == "4:00pm - 7:00pm"
                          ? const  Color.fromRGBO(213, 113, 91, 1)
                          : const Color.fromARGB(255, 203, 203, 203)
                    ),
                    child: Text(
                      "4:00pm - 7:00pm",
                      style: GoogleFonts.imprima(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 92, 92, 92)
                      ),
                    ),
                  ),
                ),

            ],),
          ),
          GestureDetector(
                  onTap: () {
                    setState(() {
                      selecttime = "7:00pm - 10:00pm";
                    });
                  },
                  child: Container(
                    height: 48,
                    width: 160,
                    margin: const EdgeInsets.only(left: 30),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(style: BorderStyle.solid,color: const  Color.fromRGBO(38,28,18,0.3),),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: selecttime == "7:00pm - 10:00pm"
                          ? const  Color.fromRGBO(213, 113, 91, 1)
                          : const Color.fromARGB(255, 203, 203, 203)
                    ),
                    child: Text(
                      "7:00pm - 10:00pm",
                      style: GoogleFonts.imprima(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 92, 92, 92)
                      ),
                    ),
                  ),
                ),
                const Spacer(flex: 1,),
             Container(
              margin: const EdgeInsets.only(left: 30,right: 30,top: 70,bottom: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                Container(
              alignment: Alignment.center,
             
              child: IconButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                icon: const  Icon(Icons.arrow_back,size: 30,))
                  
            ),
            Container(
                                  alignment: Alignment.center,
                                  width: MediaQuery.of(context).size.width * 0.6,
                                
                                  padding: const EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 10),
                                  height: 52,
                
                                  decoration:  const BoxDecoration(
                                      color:  Color.fromRGBO(213, 113, 91, 1),
                                      borderRadius:  BorderRadius.all(Radius.circular(30))),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,MaterialPageRoute(builder: (context){return const Signupver2() ;}));
                                    },
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
      
              ],),
            )

      ],),
    );
  }
}