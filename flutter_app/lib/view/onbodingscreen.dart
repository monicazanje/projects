import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/module/cursormodule.dart';
import 'package:flutter_app/view/loginscreen.dart';
import 'package:google_fonts/google_fonts.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});
  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.topCenter,
            // height: MediaQuery.of(context).size.height * 1,
            width: MediaQuery.of(context).size.width * 1,

            child: CarouselSlider.builder(
              itemCount: 3,
              itemBuilder: (context, index, realIndex) {
                final imageurl = Cursor.cursorlist[index];

                return Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(-40),
                            bottomRight: Radius.circular(-40),
                          ),
                          color: imageurl.color),
                      child: Container(
                        alignment: Alignment.topCenter,
                        child: Image.asset(
                          imageurl.img,
                          fit: BoxFit.contain,
                          height: MediaQuery.of(context).size.height * 0.6,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 350,
                      child: Container(
                        // margin: const EdgeInsets.all(20),
                        padding: const EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                            ),
                            color: Colors.white),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 30),
                              width: MediaQuery.of(context).size.width * 1,
                              child: Text(
                                imageurl.name,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.beVietnamPro(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 1,
                              padding: const EdgeInsets.only(
                                  right: 30, top: 50, left: 20),
                              child: Text(
                                imageurl.detail,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.beVietnamPro(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: MediaQuery.of(context).size.width * 2 / 4.5,
                      bottom: MediaQuery.of(context).size.height * 0.1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          for (int i = 0; i < 3; i++)
                            currentindex == i
                                ? Container(
                                    height: 7,
                                    width: 20,
                                    margin: const EdgeInsets.all(5),
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  )
                                : Container(
                                    height: 7,
                                    width: 7,
                                    margin: const EdgeInsets.all(2),
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      color: Color.fromRGBO(159, 159, 159, 1),
                                    ),
                                  ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: MediaQuery.of(context).size.width / 4.5,
                      child: Container(
                        margin:
                            const EdgeInsets.only(left: 0, right: 80, top: 10),
                        padding: const EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: 50,
                        decoration: BoxDecoration(
                            color: imageurl.color,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30))),
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Join the movement!",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.beVietnamPro(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
              options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 6.5 / 12,
                  viewportFraction: 1,
                  initialPage: 0,
                  autoPlayAnimationDuration: const Duration(seconds: 3),
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentindex = index;
                    });
                  }),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const Login();
              }));
            },
            child: Container(
              margin: const EdgeInsets.all(20),
              child: Text(
                "Login",
                textAlign: TextAlign.center,
                style: GoogleFonts.beVietnamPro(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(0, 0, 0, 1),
                    decoration: TextDecoration.underline),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
