import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Signup2 extends StatefulWidget{
  const Signup2({super.key});
  @override
  State<Signup2>createState()=>_Signup2State();
}
class _Signup2State extends State<Signup2>{
  TextEditingController businesscontroller=TextEditingController();
  TextEditingController informalcontroller=TextEditingController();
  TextEditingController streetcontroller=TextEditingController();
  TextEditingController citycontroller=TextEditingController();
  TextEditingController zipcodecontroller=TextEditingController();
  TextEditingController statecontroller=TextEditingController();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
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
                margin:  const EdgeInsets.only(left: 30,right: 30,top: 40,bottom: 10),
                height: 50,
                decoration: const BoxDecoration(
                  color:   Color.fromARGB(255, 226, 226, 226),
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: TextField(
                  controller: businesscontroller,
                  decoration:  InputDecoration(
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
                margin:  const EdgeInsets.only(left: 30,right: 30,top: 14,bottom: 10),
                height: 50,
                decoration: const BoxDecoration(
                  color:   Color.fromARGB(255, 226, 226, 226),
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: TextField(
                  controller: informalcontroller,
                  decoration:  InputDecoration(
                    border: InputBorder.none,
                    hintText: "Informal Name",
                    hintStyle: GoogleFonts.beVietnamPro(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(0, 0, 0, 0.3),
                          ),
                    
                    prefixIcon: Image.asset("assets/Group 57@2x.png",scale: 1.5,),
                  ),     
                ),
              ),
               Container(
                margin:  const EdgeInsets.only(left: 30,right: 30,top: 14,bottom: 10),
                height: 50,
                decoration: const BoxDecoration(
                  color:   Color.fromARGB(255, 226, 226, 226),
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: TextField(
                  controller: statecontroller,
                  decoration:  InputDecoration(
                    border: InputBorder.none,
                    hintText: "Street Address",
                    hintStyle: GoogleFonts.beVietnamPro(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(0, 0, 0, 0.3),
                          ),
                    
                    prefixIcon: Image.asset("assets/Vector@2x.png",height: 10,width: 10,scale: 1.5,),
                  ),     
                ),
              ),
               Container(
                margin:  const EdgeInsets.only(left: 30,right: 30,top: 14,bottom: 10),
                height: 50,
                decoration: const BoxDecoration(
                  color:   Color.fromARGB(255, 226, 226, 226),
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: TextField(
                  controller: citycontroller,
                  decoration:  InputDecoration(
                    border: InputBorder.none,
                    hintText: "city",
                    hintStyle: GoogleFonts.beVietnamPro(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(0, 0, 0, 0.3),
                          ),
                    
                    prefixIcon: Image.asset("assets/Group 58@2x.png",scale: 1.7,),
                  ),     
                ),
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                  Container(
                    margin:  const EdgeInsets.only(left: 30,top: 14,bottom: 10),
                    height: 50,
                    width: MediaQuery.of(context).size.width*0.3,
                    decoration: const BoxDecoration(
                      color:   Color.fromARGB(255, 226, 226, 226),
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: TextField(
                      controller: statecontroller,
                      decoration:  InputDecoration(
                        border: InputBorder.none,
                        hintText: "   Status",
                        hintStyle: GoogleFonts.beVietnamPro(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: const Color.fromRGBO(0, 0, 0, 0.3),
                              ),
                        
                        suffixIcon: IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_drop_down,size: 40,))
                      ),     
                    ),
                                 ),
                   Container(
                    margin:  const EdgeInsets.only(right: 30,top: 14,bottom: 10),
                    height: 50,
                    width: MediaQuery.of(context).size.width*0.5,
                    decoration: const BoxDecoration(
                      color:   Color.fromARGB(255, 226, 226, 226),
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: TextField(
                      controller: zipcodecontroller,
                      decoration:  InputDecoration(
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
        ],),
      ),
    );
  }
}