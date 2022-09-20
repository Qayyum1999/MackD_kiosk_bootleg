// class ProductPage extends StatelessWidget {
//   final FoodProduct itemOfFood;
//   ProductPage(this.itemOfFood);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         title: Text('Food delivery'),
//         leading: Padding(
//           padding: const EdgeInsets.only(left: 18.0),
//           child: BackButton(
//             color: Colors.grey[600],
//           ),
//         ),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 32.0, top: 16),
//             child: Container(
//               height: 50,
//               width: 50,
//               child: Stack(
//                 children: [
//                   Positioned(
//                     top: 0,
//                     right: 0,
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: Color(0xFFF0C143),
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(15),
//                         ),
//                       ),
//                       height: 22,
//                       width: 22,
//                       child: Center(
//                         child: Consumer<MyProvider>(
//                             builder: (context, numberOfOrders, child) {
//                           return Text(
//                             numberOfOrders.ordersNumber.toString(),
//                             style: TextStyle(color: Colors.black),
//                           );
//                         }),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     bottom: 0,
//                     left: 0,
//                     child: GestureDetector(
//                       onTap: () {
//                         Navigator.of(context).push(
//                           MaterialPageRoute(
//                             builder: (context) => CartPage(),
//                           ),
//                         );
//                       },
//                       child: Image.asset(
//                         'images/carticon2.png',
//                         height: 25,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//       body: Container(
//         color: Colors.white,
//         child: Column(
//           children: [
//             Image.asset(
//               itemOfFood.pathOfImage.toString(),
//               height: 300,
//               width: 400,
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Container(
//               height: 40,
//               width: 130,
//               decoration: BoxDecoration(
//                 color: Color(0xFFF0C143),
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(30),
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Consumer<MyProvider>(
//                         builder: (context, numbersOfOrders, child) {
//                       return GestureDetector(
//                         onTap: () {
//                           Provider.of<MyProvider>(context, listen: false)
//                               .decreaseAmountOfFood();
//                           numbersOfOrders.decreaseOrderNumber();
//                         },
//                         child: Icon(
//                           Icons.remove,
//                           size: 28,
//                           color: Colors.grey[900],
//                         ),
//                       );
//                     }),
//                     SizedBox(
//                       width: 3,
//                     ),
//                     Consumer<MyProvider>(
//                         builder: (context, numbersOfOrders, child) {
//                       return Text(
//                         numbersOfOrders.amountOfFood.toString(),
//                         style: TextStyle(
//                           fontWeight: FontWeight.w600,
//                           fontSize: 24,
//                           color: Colors.grey[900],
//                         ),
//                       );
//                     }),
//                     SizedBox(
//                       width: 3,
//                     ),
//                     Consumer<MyProvider>(
//                         builder: (context, numbersOfOrders, child) {
//                       return GestureDetector(
//                         onTap: () {
//                           Provider.of<MyProvider>(context, listen: false)
//                               .increaseAmountOfFood();
//                           numbersOfOrders.increaseOrderNumber();
//                         },
//                         child: Icon(
//                           Icons.add,
//                           size: 28,
//                           color: Colors.grey[900],
//                         ),
//                       );
//                     }),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 32.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       Container(
//                         width: 200,
//                         child: Text(
//                           itemOfFood.describeFood.toString(),
//                           style: TextStyle(
//                               fontSize: 22, fontWeight: FontWeight.w600),
//                         ),
//                       ),
//                       RichText(
//                         text: TextSpan(children: [
//                           TextSpan(
//                             text: '\$',
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                               color: Color(0xFFF4D479),
//                             ),
//                           ),
//                           TextSpan(
//                             text: itemOfFood.price,
//                             style: TextStyle(
//                               fontSize: 24,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ]),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 32.0),
//                   child: Row(
//                     children: [
//                       Text(
//                         itemOfFood.stars.toString(),
//                         style: TextStyle(
//                             fontWeight: FontWeight.w500, fontSize: 18),
//                       ),
//                       SizedBox(
//                         width: 30,
//                       ),
//                       Text(
//                         itemOfFood.calories.toString(),
//                         style: TextStyle(
//                             fontWeight: FontWeight.w500, fontSize: 18),
//                       ),
//                       SizedBox(
//                         width: 30,
//                       ),
//                       Text(
//                         itemOfFood.time.toString(),
//                         style: TextStyle(
//                             fontWeight: FontWeight.w500, fontSize: 18),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 32.0),
//                   child: Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       'Details',
//                       style: TextStyle(
//                         fontWeight: FontWeight.w600,
//                         fontSize: 20,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 32.0),
//                   child: Text(
//                     itemOfFood.details.toString(),
//                     style: TextStyle(fontSize: 16, color: Colors.grey[400]),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 32.0),
//                   child: Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       'Ingredients',
//                       style:
//                           TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 32.0),
//                   child: Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       itemOfFood.ingredients.toString(),
//                       style: TextStyle(
//                           fontSize: 42,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.grey[500]),
//                     ),
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//       floatingActionButton: Container(
//         child: Consumer<MyProvider>(builder: (context, numbersOfOrders, child) {
//           return FloatingActionButton(
//             backgroundColor: Color(0xFFFFCC2E),
//             onPressed: () {
//               numbersOfOrders.increaseOrderNumber();
//               numbersOfOrders.calculateTotalPrice(numbersOfOrders.amountOfFood,
//                   double.parse(itemOfFood.price.toString()));
//             },
//             child: Container(
//               child: Icon(
//                 Icons.add,
//                 size: 32,
//                 color: Colors.black,
//               ),
//             ),
//             elevation: 7,
//           );
//         }),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:foodkiosk/providers/shopping_cart_provider.dart';
import 'package:provider/provider.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({Key? key}) : super(key: key);

  @override
  _PaymentMethodScreenState createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  late String paymentmethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 10.h,
          ),
          Text("Select payment method",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w900,
                fontSize: 14.sp,
              )),
          Expanded(
            child: Center(
              child: Container(
                height: 80.h,
                width: 100.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(1.h),
                      child: Consumer<ShoppingCart>(
                        builder: (context, provider, child) {
                          return TextButton.icon(
                            onPressed: () {
                              // Navigator.pop(context);
                              paymentmethod = "Card";
                              provider.paymentmethodprovider(paymentmethod);
                              Navigator.pushNamed(context, '/fifth');
                            },
                            icon: Padding(
                              padding: EdgeInsets.only(left: 2.w),
                              child: Icon(
                                Icons.payment_rounded,
                                size: 5.w,
                              ),
                            ),
                            label: Padding(
                              padding: EdgeInsets.fromLTRB(1.w, 2.h, 3.w, 2.h),
                              child: Container(
                                child: Text(
                                  "Credit/Debit Card",
                                  style: TextStyle(
                                      fontSize: 10.sp, color: Colors.black),
                                ),
                              ),
                            ),
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(2.h),
                                        ),
                                        side: BorderSide(
                                          width: (0.4).w,
                                          color: Colors.black,
                                        )))),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(1.h),
                      child: Consumer<ShoppingCart>(
                        builder: (context, methodofpayment, child) {
                          return TextButton.icon(
                            onPressed: () {
                              // Navigator.pop(context);
                              paymentmethod = "QR Code";
                              methodofpayment
                                  .paymentmethodprovider(paymentmethod);
                              Navigator.pushNamed(context, '/fifth');
                            },
                            icon: Padding(
                              padding: EdgeInsets.only(left: 2.w),
                              child: Icon(
                                Icons.qr_code_scanner_rounded,
                                size: 5.w,
                              ),
                            ),
                            label: Padding(
                              padding: EdgeInsets.fromLTRB(1.w, 2.h, 3.w, 2.h),
                              child: Container(
                                child: Text(
                                  "QR Code",
                                  style: TextStyle(
                                      fontSize: 10.sp, color: Colors.black),
                                ),
                              ),
                            ),
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(2.h),
                                        ),
                                        side: BorderSide(
                                          width: (0.4).w,
                                          color: Colors.black,
                                        )))),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(1.h),
                      child: Consumer<ShoppingCart>(
                        builder: (context, provider, child) {
                          return TextButton.icon(
                            onPressed: () {
                              // Navigator.pop(context);
                              paymentmethod = "Cash";
                              provider.paymentmethodprovider(paymentmethod);
                              Navigator.pushNamed(context, '/fifth');
                            },
                            icon: Padding(
                              padding: EdgeInsets.only(left: 2.w),
                              child: Icon(
                                Icons.payments_sharp,
                                size: 5.w,
                              ),
                            ),
                            label: Padding(
                              padding: EdgeInsets.fromLTRB(1.w, 2.h, 3.w, 2.h),
                              child: Container(
                                child: Text(
                                  "Cash",
                                  style: TextStyle(
                                      fontSize: 10.sp, color: Colors.black),
                                ),
                              ),
                            ),
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(2.h),
                                        ),
                                        side: BorderSide(
                                          width: (0.4).w,
                                          color: Colors.black,
                                        )))),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                      width: 10.h,
                    ),
                    GestureDetector(
                        child: Icon(
                          Icons.arrow_back_rounded,
                          size: 5.w,
                        ),
                        onTap: () {
                          // Navigate to the second screen using a named route.
                          Navigator.pop(context);
                        }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
