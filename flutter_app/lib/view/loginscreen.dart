import 'package:flutter/material.dart';
import 'package:flutter_app/view/forgotpass.dart';
import 'package:flutter_app/view/signup.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget{
  const Login({super.key});
  @override
  State<Login>createState()=>_LoginState();
}
class _LoginState extends State<Login>{
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController passcontroller=TextEditingController();
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
                      "Welcome back!",
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
                          "New here?",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.beVietnamPro(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromARGB(255, 147, 147, 147),
                          ),
                        ),
                  ),
                  GestureDetector(
                    onTap: (){
                       Navigator.push(context,MaterialPageRoute(builder: (context){return const Signup() ;}));
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left:5,top:24),
                      child: Text(
                            " Create account",
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
                  controller: emailcontroller,
                  decoration:  InputDecoration(
                    border: InputBorder.none,
                    hintText: "Email Address",
                    hintStyle: GoogleFonts.beVietnamPro(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(0, 0, 0, 0.3),
                          ),
                    
                    prefixIcon: const Icon(Icons.alternate_email),
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
                  controller: passcontroller,
                  decoration:  InputDecoration(
                    border: InputBorder.none,
                    hintText: "Password",
                    hintStyle: GoogleFonts.beVietnamPro(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(0, 0, 0, 0.3),
                          ),
                    
                    prefixIcon: Image.asset("assets/Vector.png"),
                    suffix: GestureDetector(
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context){return const Forgotpass() ;}));
                      },
                      child: Text(
                          "Forgot?   ",
                          
                          style: GoogleFonts.beVietnamPro(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(213, 113, 91, 1),
                          ),
                        ),
                    )
                  ),     
                ),
              ),
              Container(
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width * 0.6,
                                    margin: const EdgeInsets.only(left: 100,right: 80 ,top: 30),
                                    padding: const EdgeInsets.all(10),
                                    height: 50,
                  
                                    decoration:  const BoxDecoration(
                                        color:  Color.fromRGBO(213, 113, 91, 1),
                                        borderRadius:  BorderRadius.all(Radius.circular(30))),
                                    child: GestureDetector(
                                      onTap: () {
                                        // Navigator.push(context,MaterialPageRoute(builder: (context){return const Forgotpass() ;}));
                                      },
                                      child: Text(
                                        "Login",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.beVietnamPro(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: const Color.fromRGBO(255, 255, 255, 1),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                margin: const EdgeInsets.only(left: 30,top:40),
                child: Text(
                      "or login with",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.beVietnamPro(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromARGB(51, 24, 18, 12),
                      ),
                    ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 30,right: 30,top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 52,
                      width: 96,
                      decoration: BoxDecoration(
                        border: Border.all(style: BorderStyle.solid,color:const  Color.fromARGB(255, 226, 226, 226),),
                        borderRadius:const  BorderRadius.all(Radius.circular(30))
                      ),
                      child: Image.asset("assets/g1520.png"),
                    ),
                    Container(
                      height: 52,
                      width: 96,
                      decoration: BoxDecoration(
                        border: Border.all(style: BorderStyle.solid,color:const  Color.fromARGB(255, 226, 226, 226),),
                        borderRadius:const  BorderRadius.all(Radius.circular(30))
                      ),
                      child: Image.asset("assets/Frame 4.png"),
                    ),
                    Container(
                      height: 52,
                      width: 96,
                      decoration: BoxDecoration(
                        border: Border.all(style: BorderStyle.solid,color:const  Color.fromARGB(255, 226, 226, 226),),
                        borderRadius:const  BorderRadius.all(Radius.circular(30))
                      ),
                      child: Image.asset("assets/Facebook_f_logo_(2019) 1.png"),
                    )
                
                  ],),
              )
              
        
        ],),
      ),
    );
  }

}