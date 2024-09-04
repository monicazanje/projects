import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/module/cursormodule.dart';
import 'package:google_fonts/google_fonts.dart';


class Onboard extends StatefulWidget {
  const Onboard({super.key});
  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  // List<dynamic> cursorlist = [
  //   "assets/img4.png",
  //   "assets/img1.png",
  //   "assets/img3.png",
  // ];
  // Map<String,List<String>> cursormap={
  //   "img":[]
  // };

  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.topCenter,
            // height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width * 1,
            child: CarouselSlider.builder(
              itemCount: 3,
              itemBuilder: (context, index, realIndex) {
                final imageurl = Cursor.cursorlist[index];
                return ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(-40),
                    bottomRight: Radius.circular(-40),
                  ),
                  child: Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.6,
                        decoration: const BoxDecoration(borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(-40),
                    bottomRight: Radius.circular(-40),
                    
                  ),
                  color: Colors.orange
                  ),
                        child: Container(
                          alignment: Alignment.topCenter,
                          child: Image.asset(
                            imageurl.img,
                            fit: BoxFit.fill,
                            height: MediaQuery.of(context).size.height * 0.6,
                            width: double.infinity,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 450,
                        child: Container(
                          // margin: const EdgeInsets.all(20),
                          padding:const EdgeInsets.all(20) ,
                          decoration: const BoxDecoration(borderRadius:  BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20),),
                                color: Colors.white
                                ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width*1,
                            
                                child: Text(imageurl.name,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.beVietnamPro(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700,
                                        color: const Color.fromARGB(255, 0, 0, 0),
                                      ),),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width*1,
                               
                                
                                
                                child: Text(imageurl.detail,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.beVietnamPro(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: const Color.fromARGB(255, 0, 0, 0),
                                      ),),
                              ),
                            ],
                          ),
                        ),
                      ),
                       
                      
                    ],
                  ),
                );
                // return Column(
                //   children: [
                //     Container(
                //       alignment: Alignment.topCenter,
                //       height: MediaQuery.of(context).size.height * 0.5,
                //       child: Image.asset(
                //         imageurl.img,
                //         fit: BoxFit.cover,
                //         width: double.infinity,
                //       ),
                //     ),
                //     const SizedBox(
                //       height: 30,
                //     ),
                //     Container(
                //       padding: const EdgeInsets.only(left: 20, right: 20),
                //       // width: 370,
                //       width: MediaQuery.of(context).size.width * 0.9,
                //       height: 100,
                //       child: Text.rich(
                //         TextSpan(
                //           children: [
                //             TextSpan(
                //               text: imageurl.name,
                //               style: GoogleFonts.aclonica(
                //                 fontSize: 26,
                //                 fontWeight: FontWeight.w600,
                //                 color: const Color.fromARGB(255, 0, 0, 0),
                //               ),
                //             ),
                //             TextSpan(
                //               text: imageurl.dec,
                //               style: GoogleFonts.aclonica(
                //                 fontSize: 26,
                //                 fontWeight: FontWeight.w600,
                //                 color: const Color.fromRGBO(207, 82, 10, 1),
                //               ),
                //             )
                //           ],
                //         ),
                //       ),
                //     ),
                //     const SizedBox(
                //       height: 15,
                //     ),
                //     Container(
                //       margin: const EdgeInsets.only(left: 20, right: 20),
                //       height: 70,
                //       child: Text(
                //         imageurl.detail,
                //         style: GoogleFonts.inter(
                //           fontSize: 16,
                //           fontWeight: FontWeight.w600,
                //           color: const Color.fromRGBO(112, 41, 1, 1),
                //         ),
                //       ),
                //     )
                //   ],
                // );
              },
              options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 8 / 12,
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
          // Container(
          //   padding: const EdgeInsets.all(20),
          //   child: CarouselSlider.builder(
          //     itemCount: 3,
          //     itemBuilder: (context, index, realIndex) {
          //       final imageurl = Cursor.cursorlist[index];
          //       return Column(
          //         children: [
          //           Container(
          //             // width: 370,
          //             margin: const EdgeInsets.all(20),
          //             width: MediaQuery.of(context).size.width * 0.9,
          //             height: 70,
          //             child: Text.rich(
          //               TextSpan(
          //                 children: [
          //                   TextSpan(
          //                     text: imageurl.name,
          //                     style: GoogleFonts.aclonica(
          //                       fontSize: 26,
          //                       fontWeight: FontWeight.w600,
          //                       color: const Color.fromARGB(255, 0, 0, 0),
          //                     ),
          //                   ),
          //                   TextSpan(
          //                     text: imageurl.dec,
          //                     style: GoogleFonts.aclonica(
          //                       fontSize: 26,
          //                       fontWeight: FontWeight.w600,
          //                       color: const Color.fromRGBO(207, 82, 10, 1),
          //                     ),
          //                   )
          //                 ],
          //               ),
          //             ),
          //           ),
          //         ],
          //       );
          //     },
          //     options: CarouselOptions(
          //         autoPlay: true,
          //         aspectRatio: 8 / 12,
          //         viewportFraction: 1,
          //         initialPage: 0,
          //         autoPlayAnimationDuration: const Duration(seconds: 3),
          //         onPageChanged: (index, reason) {
          //           setState(() {
          //             currentindex = index;
          //           });
          //         }),
          //   ),
          // ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
          Container(
            margin: const EdgeInsets.all(30),
            padding: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width * 0.8,
            height: 50,
            decoration: const BoxDecoration(
                color: Color.fromRGBO(13, 110, 253, 1),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: GestureDetector(
              onTap: () {},
              child: Text(
                "Get Started",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
