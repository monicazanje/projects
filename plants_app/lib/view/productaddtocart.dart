import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:plants_app/controller/productcontroller.dart';
import 'package:plants_app/model/historymodel.dart';
import 'package:plants_app/model/plantsmodel.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class AddToCart extends StatefulWidget {
  final List<Plant> cartlist;
  final int currentindex;

  const AddToCart({super.key, required this.cartlist, required this.currentindex});

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  late Razorpay _razorpay;
  late int cartindex;

  @override
  void initState() {
    super.initState();
    cartindex = widget.currentindex;
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    _razorpay.clear(); // Clear all listeners
    super.dispose();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "Payment Successful: ${response.paymentId!}",
        toastLength: Toast.LENGTH_SHORT);
    setState(() {
      historyData.add(
        Historymodel(
          name: widget.cartlist[cartindex].plantname,
          status: true,
          amount: widget.cartlist[cartindex].price.toString(),
          image: widget.cartlist[cartindex].img,
        ),
      );
    });
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "Payment Failed: ${response.message!}",
        toastLength: Toast.LENGTH_SHORT);
    setState(() {
      historyData.add(
        Historymodel(
          name: widget.cartlist[cartindex].plantname,
          status: false,
          amount: widget.cartlist[cartindex].price.toString(),
          image: widget.cartlist[cartindex].img,
        ),
      );
    });
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "External Wallet: ${response.walletName!}",
        toastLength: Toast.LENGTH_SHORT);
  }

  void openCheckout(double amount) {
    amount = amount * 100.toDouble(); // Convert to paise
    var options = {
      'key': 'rzp_test_it8oYn1wKBwt6N',
      'amount': amount,
      'name': 'Monika Zanje',
      'timeout': 160, // in seconds
      'prefill': {
        'contact': '7249520949',
        'email': 'monikazanje29@gmail.com',
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: $e');
      Fluttertoast.showToast(msg: "Error: $e");
    }
  }

  void removeFromCart(Plant plant) {
    setState(() {
      widget.cartlist.remove(plant); // Use widget.cartlist to remove the item
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 148, 190, 93),
        title: Text(
          "Add To Cart",
          style: GoogleFonts.dmSans(fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: Consumer<ProductController>(
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: widget.cartlist.length,
            itemBuilder: (context, index) {
              Plant plant = widget.cartlist[index];
              return Container(
                height: 100,
                width: 100,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(style: BorderStyle.solid),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                margin: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Image.asset(plant.img),
                    const Spacer(flex: 1),
                    Text(
                      plant.plantname,
                      style: GoogleFonts.dmSans(
                          fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    const Spacer(flex: 1),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Price",
                          style: GoogleFonts.dmSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "${plant.price}",
                          style: GoogleFonts.dmSans(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                // cartindex = index; 
                                setState(() {
                                  double amount = double.parse(plant.price.toString());
                                  openCheckout(amount);
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 67, 139, 241),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Text(
                                  "Payment",
                                  style: GoogleFonts.dmSans(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                removeFromCart(plant);
                              },
                              child: Container(
                                margin: const EdgeInsets.only(left: 10),
                                child: const Icon(Icons.delete_outlined),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

