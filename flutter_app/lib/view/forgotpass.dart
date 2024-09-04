import 'package:flutter/material.dart';
import 'package:flutter_app/view/loginotp.dart';
import 'package:google_fonts/google_fonts.dart';


class Forgotpass extends StatefulWidget{
  const Forgotpass({super.key});
  @override
  State<Forgotpass>createState()=>_ForgotpassState();
}
class _ForgotpassState extends State<Forgotpass>{
  TextEditingController phonecontroller=TextEditingController();
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
              const SizedBox(height: 80,),
               Container(
                margin: const EdgeInsets.only(left: 30,top:40),
                child: Text(
                      "Forgot Password?",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.beVietnamPro(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: const Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
              ),
              // const SizedBox(height: 24,),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 30,top:24),
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
                    onTap: (){},
                    child: Container(
                      margin: const EdgeInsets.only(left:5,top:24),
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
                margin:  const EdgeInsets.only(left: 30,right: 30,top: 72,bottom: 10),
                height: 50,
                decoration: const BoxDecoration(
                  color:   Color.fromARGB(255, 226, 226, 226),
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: TextField(
                  controller: phonecontroller,
                  decoration:  InputDecoration(
                    border: InputBorder.none,
                    hintText: "Phone Number",
                    hintStyle: GoogleFonts.beVietnamPro(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(0, 0, 0, 0.3),
                          ),
                    
                    prefixIcon: const Icon(Icons.phone),
                  ),     
                ),
              ),
              
              Container(
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width * 1,
                                    margin: const EdgeInsets.only(left: 30,right: 30 ,top: 30),
                                    padding: const EdgeInsets.all(10),
                                    height: 52,
                  
                                    decoration:  const BoxDecoration(
                                        color:  Color.fromRGBO(213, 113, 91, 1),
                                        borderRadius:  BorderRadius.all(Radius.circular(30))),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(context,MaterialPageRoute(builder: (context){return const LoginOtp() ;}));
                                      },
                                      child: Text(
                                        "Send Code",
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
      ),
    );
  }
}