// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// import 'package:foodkiosk/model/product_model.dart';
// import 'package:foodkiosk/widget/category_item.dart';
// import 'package:foodkiosk/providers/shopping_cart_provider.dart';
// import 'package:foodkiosk/widget/menu_item.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:sizer/sizer.dart';

// class MenuScreen extends StatefulWidget {
//   @override
//   State<MenuScreen> createState() => _MenuScreenState();
// }

// class _MenuScreenState extends State<MenuScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey.shade50,
//       body: Column(
//         children: [
//           Stack(
//             children: [
//               Container(
//                 height: 10.h,
//                 width: 100.w,
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                       colors: [
//                         Color.fromARGB(255, 177, 17, 5),
//                         Color.fromARGB(255, 235, 33, 19),
//                         Colors.red,
//                         Colors.redAccent,
//                         Colors.red,
//                         Color.fromARGB(255, 235, 33, 19),
//                         Color.fromARGB(255, 177, 17, 5),
//                         //add more colors for gradient
//                       ],
//                       begin: Alignment.topLeft, //begin of the gradient color
//                       end: Alignment.bottomRight, //end of the gradient color
//                       stops: [
//                         0,
//                         0.1,
//                         0.3,
//                         0.5,
//                         0.7,
//                         0.9,
//                         1
//                       ] //stops for individual color
//                       //set the stops number equal to numbers of color
//                       ),
//                 ),
//               ),
//               Center(
//                 child: Container(
//                   alignment: Alignment.center,
//                   height: 10.h,
//                   width: 100.w,
//                   decoration: const BoxDecoration(
//                       image: DecorationImage(
//                     image: AssetImage("images/adsmcd.png"),
//                     fit: BoxFit.cover,
//                   )), // button text
//                 ),
//               ),
//             ],
//           ),
//           Expanded(
//             flex: 5,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Expanded(
//                   child: Padding(
//                     padding: EdgeInsets.only(top: 4.h),
//                     child: Container(
//                       height: 80.h,
//                       width: 20.w,
//                       child: ListView(
//                         children: <Widget>[
//                           CategoryItem(
//                             imageUrl: 'assets/images/quarter_pounder.png',
//                             name: 'Burgers',
//                           ),
//                           CategoryItem(
//                             name: "Happy Meal",
//                             imageUrl: 'assets/images/happy_meal.png',
//                           ),
//                           CategoryItem(
//                             name: "Beverages",
//                             imageUrl: 'assets/images/beverages.png',
//                           ),
//                           CategoryItem(
//                             name: "Fries",
//                             imageUrl: 'assets/images/snacks_and_sides.png',
//                           ),
//                           CategoryItem(
//                             imageUrl: 'assets/images/bacon_ranch_salad.png',
//                             name: 'Snacks & Sides',
//                           ),
//                           CategoryItem(
//                             name: "Chicken",
//                             imageUrl: 'assets/images/chicken.png',
//                           ),
//                           CategoryItem(
//                             imageUrl: 'assets/images/quarter_pounder.png',
//                             name: 'Burgers',
//                           ),
//                           CategoryItem(
//                             name: "Happy Meal",
//                             imageUrl: 'assets/images/happy_meal.png',
//                           ),
//                           CategoryItem(
//                             name: "Beverages",
//                             imageUrl: 'assets/images/beverages.png',
//                           ),
//                           CategoryItem(
//                             name: "Fries",
//                             imageUrl: 'assets/images/snacks_and_sides.png',
//                           ),
//                           CategoryItem(
//                             imageUrl: 'assets/images/bacon_ranch_salad.png',
//                             name: 'Snacks & Sides',
//                           ),
//                           CategoryItem(
//                             name: "Chicken",
//                             imageUrl: 'assets/images/chicken.png',
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   flex: 6,
//                   child: Padding(
//                     padding: EdgeInsets.fromLTRB(1.w, 1.h, 1.w, 0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Padding(
//                           padding: EdgeInsets.only(left: 2.w),
//                           child: Text(
//                             "Burgers",
//                             style: TextStyle(
//                               fontSize: 15.sp,
//                               fontWeight: FontWeight.w900,
//                             ),
//                           ),
//                         ),

//                         // Expanded(
//                         //   child: GridView.extent(
//                         //     primary: false,
//                         //     padding: EdgeInsets.fromLTRB(0.1.w, 0.1.h, 0.1.w, 0.1.h),
//                         //     crossAxisSpacing: 5,
//                         //     mainAxisSpacing: 5,
//                         //     maxCrossAxisExtent: 20.w,
//                         //     children: List.generate(choices.length, (index) {
//                         //       return Center(
//                         //         child: Menuitem(choice: choices[index]),
//                         //       );
//                         //     }),
//                         //   ),
//                         // ),
//                         Expanded(
//                           child: GridView.builder(
//                             padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
//                             itemCount: choices.length,
//                             gridDelegate:
//                                 SliverGridDelegateWithFixedCrossAxisCount(
//                               crossAxisCount: 3,
//                             ),
//                             itemBuilder: (BuildContext context, int index) {
//                               return Center(
//                                 child: GestureDetector(
//                                   child: Menuitem(choice: choices[index]),
//                                   onTap: () {
//                                     context
//                                         .read<ShoppingCart>()
//                                         .increaseOrderNumber();
//                                     // int noquantity =
//                                     //     int.parse(choices[index].quantity);
//                                     // String squantity = '${noquantity++}';

//                                     context
//                                         .read<ShoppingCart>()
//                                         .addselecteditem(
//                                           Choice(
//                                             title: choices[index].title,
//                                             imageUrl: choices[index].imageUrl,
//                                             price: choices[index].price,
//                                             quantity: choices[index].quantity,
//                                             category: choices[index].category,
//                                           ),
//                                         );

//                                     context
//                                         .read<ShoppingCart>()
//                                         .calculateAddTotalPrice(
//                                             choices[index].quantity!,
//                                             double.parse(choices[index].price));
//                                   },
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             alignment: Alignment.centerRight,
//             // color: Color.fromARGB(255, 0, 104, 9),
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                   colors: [
//                     Color.fromARGB(255, 5, 112, 2),
//                     Color.fromARGB(255, 8, 146, 3),
//                     Color.fromARGB(255, 11, 177, 5),
//                     Color.fromARGB(255, 11, 177, 5),
//                     Color.fromARGB(255, 11, 177, 5),
//                     Color.fromARGB(255, 8, 146, 3),
//                     Color.fromARGB(255, 5, 112, 2),
//                     //add more colors for gradient
//                   ],
//                   begin: Alignment.topLeft, //begin of the gradient color
//                   end: Alignment.bottomRight, //end of the gradient color
//                   stops: [
//                     0,
//                     0.2,
//                     0.3,
//                     0.5,
//                     0.7,
//                     0.8,
//                     1
//                   ] //stops for individual color
//                   //set the stops number equal to numbers of color
//                   ),
//             ),
//             width: double.infinity,
//             child: Padding(
//               padding: EdgeInsets.fromLTRB(3.w, 5, 3.w, 5),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'My Order - ${context.watch<ShoppingCart>().newordermethod}',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 7.sp,
//                     ),
//                   ),
//                   selectedchoices.isEmpty
//                       ? Text(
//                           'Please select an item',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 7.sp,
//                           ),
//                         )
//                       : Consumer<ShoppingCart>(
//                           builder: (context, provider, child) {
//                           return Text(
//                             '${provider.ordersNumber} items in list',
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 7.sp,
//                             ),
//                           );
//                         }),
//                 ],
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 0,
//             child: Container(
//               height: 10.h,
//               color: Colors.white,
//               width: double.infinity,
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Expanded(
//                     child: Padding(
//                       padding: const EdgeInsets.fromLTRB(10, 6, 10, 6),
//                       child: TextButton(
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                           child: Container(
//                               child: Center(
//                                   child: Text(
//                             "Cancel Order",
//                             style:
//                                 TextStyle(fontSize: 10.sp, color: Colors.red),
//                           ))),
//                           style: ButtonStyle(
//                               shape: MaterialStateProperty.all<
//                                   RoundedRectangleBorder>(
//                             RoundedRectangleBorder(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(1.h)),
//                               side: BorderSide(
//                                 color: Colors.red,
//                                 width: 0.4.h,
//                               ),
//                             ),
//                           ))),
//                     ),
//                   ),
//                   Expanded(
//                     child: Padding(
//                       padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
//                       child: GestureDetector(
//                         child: Center(
//                           child: Stack(
//                             alignment: Alignment.center,
//                             children: <Widget>[
//                               Expanded(
//                                 child: Container(
//                                   height: 8.h,
//                                   width: double.infinity,
//                                   child: TextButton.icon(
//                                     icon: Icon(
//                                       Icons.shopping_cart_outlined,
//                                       size: 5.h,
//                                     ),
//                                     label: Text(
//                                       "Check Cart",
//                                       style: TextStyle(
//                                         fontSize: 10.sp,
//                                       ),
//                                     ),
//                                     onPressed: () {
//                                       if (selectedchoices.isEmpty) {
//                                         //toast message
//                                         Fluttertoast.showToast(
//                                             msg: "Please select an item");
//                                       } else {
//                                         Navigator.pushNamed(context, '/third');
//                                       }
//                                     },
//                                     style: TextButton.styleFrom(
//                                       backgroundColor:
//                                           Color.fromARGB(255, 11, 177, 5),
//                                       primary: Colors.white,
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.all(
//                                           Radius.circular(1.h),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// //  Row(
// //                 crossAxisAlignment: CrossAxisAlignment.end,
// //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                 children: [
// //                   // Expanded(
// //                   //   child: Padding(
// //                   //     padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
// //                   //     child: GestureDetector(
// //                   //       child: Container(
// //                   //         height: 50,
// //                   //         width: 200,
// //                   //         decoration: BoxDecoration(
// //                   //           color: const Color(0xFFC8151D),
// //                   //           borderRadius: const BorderRadius.all(
// //                   //             Radius.circular(10),
// //                   //           ),
// //                   //         ),
// //                   //       ),
// //                   //       onTap: () {
// //                   //         Navigator.pop(context);
// //                   //       },
// //                   //     ),
// //                   //   ),
// //                   // ),
// //                   // Expanded(
// //                   //   child: Padding(
// //                   //     padding: const EdgeInsets.fromLTRB(20, 8, 10, 8),
// //                   //     child: TextButton(
// //                   //         onPressed: () {
// //                   //           Navigator.pop(context);
// //                   //         },
// //                   //         child: Container(
// //                   //             height: 10.h,
// //                   //             width: 40.w,
// //                   //             child: Center(
// //                   //                 child: Text(
// //                   //               "Cancel Order",
// //                   //               style: TextStyle(
// //                   //                   fontSize: 10.sp, color: Colors.red),
// //                   //             ))),
// //                   //         style: ButtonStyle(
// //                   //             shape: MaterialStateProperty.all<
// //                   //                     RoundedRectangleBorder>(
// //                   //                 RoundedRectangleBorder(
// //                   //                     borderRadius: const BorderRadius.all(
// //                   //                       Radius.circular(10),
// //                   //                     ),
// //                   //                     side: BorderSide(
// //                   //                       width: 0.2.w,
// //                   //                       color: Colors.red,
// //                   //                     ))))),
// //                   //   ),
// //                   // ),
// //                   // Expanded(
// //                   //   child: Padding(
// //                   //     padding: const EdgeInsets.fromLTRB(10, 8, 20, 8),
// //                   //     child: GestureDetector(
// //                   //         child: Stack(
// //                   //           alignment: Alignment.center,
// //                   //           children: <Widget>[
// //                   //             Expanded(
// //                   //               child: Container(
// //                   //                 height: 50,
// //                   //                 width: double.infinity,
// //                   //                 child: TextButton.icon(
// //                   //                   icon: Icon(
// //                   //                     Icons.shopping_cart,
// //                   //                     size: 28,
// //                   //                   ),
// //                   //                   label: Text("View Cart"),
// //                   //                   onPressed: () {
// //                   //                     if (selectedchoices.isEmpty) {
// //                   //                       //toast message
// //                   //                       Fluttertoast.showToast(
// //                   //                           msg: "Please select an item");
// //                   //                     } else {
// //                   //                       Navigator.pushNamed(context, '/third');
// //                   //                     }
// //                   //                   },
// //                   //                   style: TextButton.styleFrom(
// //                   //                     backgroundColor:
// //                   //                         Color.fromARGB(255, 21, 200, 45),
// //                   //                     primary: Colors.white,
// //                   //                     shape: RoundedRectangleBorder(
// //                   //                       borderRadius: const BorderRadius.all(
// //                   //                         Radius.circular(10),
// //                   //                       ),
// //                   //                     ),
// //                   //                   ),
// //                   //                 ),
// //                   //               ),
// //                   //             ),
// //                   //             if (choices.length > 0)
// //                   //               Padding(
// //                   //                 padding: const EdgeInsets.only(
// //                   //                   right: 55.0,
// //                   //                   bottom: 25.0,
// //                   //                 ),
// //                   //                 child: CircleAvatar(
// //                   //                   radius: 10.0,
// //                   //                   backgroundColor: Colors.red,
// //                   //                   foregroundColor: Colors.white,
// //                   //                   child: FittedBox(
// //                   //                     fit: BoxFit.fitWidth,
// //                   //                     child: Consumer<ShoppingCart>(
// //                   //                       builder:
// //                   //                           (context, numbersOfOrders, child) {
// //                   //                         return Padding(
// //                   //                           padding: const EdgeInsets.all(2.0),
// //                   //                           child: Text(
// //                   //                             '${context.watch<ShoppingCart>().ordersNumber}',
// //                   //                             key: Key('counterState'),
// //                   //                             style: const TextStyle(
// //                   //                               fontSize: 11,
// //                   //                               fontWeight: FontWeight.normal,
// //                   //                             ),
// //                   //                           ),
// //                   //                         );
// //                   //                       },
// //                   //                     ),
// //                   //                   ),
// //                   //                 ),
// //                   //               ),
// //                   //             // Container(
// //                   //             //   height: 50,
// //                   //             //   width: 400,
// //                   //             //   decoration: BoxDecoration(
// //                   //             //     color: Color.fromARGB(255, 21, 200, 45),
// //                   //             //     borderRadius: const BorderRadius.all(
// //                   //             //       Radius.circular(10),
// //                   //             //     ),
// //                   //             //   ),
// //                   //             // ),
// //                   //             // Icon(
// //                   //             //   Icons.shopping_cart,
// //                   //             //   size: 36.0,
// //                   //             // ),
// //                   //           ],
// //                   //         ),
// //                   //         onTap: () {
// //                   //           if (selectedchoices.isEmpty) {
// //                   //             //toast message
// //                   //             Fluttertoast.showToast(
// //                   //                 msg: "Please select an item");
// //                   //           } else {
// //                   //             Navigator.pushNamed(context, '/third');
// //                   //           }
// //                   //         }),
// //                   //   ),
// //                   // ),
// //                   Expanded(
// //                     flex: 1,
// //                     child: Container(
// //                       height: 8.h,
// //                       color: Colors.white,
// //                       width: double.infinity,
// //                       child: Row(
// //                         crossAxisAlignment: CrossAxisAlignment.end,
// //                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                         children: [
// //                           Expanded(
// //                             child: Padding(
// //                               padding: const EdgeInsets.fromLTRB(20, 8, 10, 8),
// //                               child: TextButton(
// //                                   onPressed: () {
// //                                     Navigator.pop(context);
// //                                   },
// //                                   child: Container(
// //                                       height: 8.h,
// //                                       width: 40.w,
// //                                       child: Center(
// //                                           child: Padding(
// //                                         padding:
// //                                             EdgeInsets.fromLTRB(0, 2.h, 0, 2.h),
// //                                         child: Text(
// //                                           "Cancel Order",
// //                                           style: TextStyle(
// //                                               fontSize: 12.sp,
// //                                               color: Colors.red),
// //                                         ),
// //                                       ))),
// //                                   style: ButtonStyle(
// //                                       shape: MaterialStateProperty.all<
// //                                           RoundedRectangleBorder>(
// //                                     RoundedRectangleBorder(
// //                                       borderRadius: BorderRadius.all(
// //                                           Radius.circular(1.h)),
// //                                       side: BorderSide(
// //                                         color: Colors.red,
// //                                         width: 0.4.h,
// //                                       ),
// //                                     ),
// //                                   ))),
// //                             ),
// //                           ),
// //                           Expanded(
// //                             child: Padding(
// //                               padding: const EdgeInsets.fromLTRB(10, 8, 20, 8),
// //                               child: GestureDetector(
// //                                 child: Stack(
// //                                   alignment: Alignment.center,
// //                                   children: <Widget>[
// //                                     Expanded(
// //                                       child: Container(
// //                                         height: 8.h,
// //                                         width: double.infinity,
// //                                         child: TextButton.icon(
// //                                           icon: Icon(
// //                                             Icons.shopping_cart_outlined,
// //                                             size: 5.h,
// //                                           ),
// //                                           label: Text(
// //                                             "Check Cart",
// //                                             style: TextStyle(
// //                                               fontSize: 12.sp,
// //                                             ),
// //                                           ),
// //                                           onPressed: () {
// //                                             if (selectedchoices.isEmpty) {
// //                                               //toast message
// //                                               Fluttertoast.showToast(
// //                                                   msg: "Please select an item");
// //                                             } else {
// //                                               Navigator.pushNamed(
// //                                                   context, '/third');
// //                                             }
// //                                           },
// //                                           style: TextButton.styleFrom(
// //                                             backgroundColor: Color.fromARGB(
// //                                                 255, 21, 200, 45),
// //                                             primary: Colors.white,
// //                                             shape: RoundedRectangleBorder(
// //                                               borderRadius: BorderRadius.all(
// //                                                 Radius.circular(1.h),
// //                                               ),
// //                                             ),
// //                                           ),
// //                                         ),
// //                                       ),
// //                                     ),
// //                                   ],
// //                                 ),
// //                               ),
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               ),
         