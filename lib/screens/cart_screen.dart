import 'package:flutter/material.dart';
import 'package:foodkiosk/providers/shopping_cart_provider.dart';
import 'package:provider/provider.dart';
import 'package:foodkiosk/widget/menu_item.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';
import 'package:foodkiosk/model/product_model.dart';

class CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "My Order List",
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      if (choices.length > 0)
                        CircleAvatar(
                          radius: 2.w,
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Consumer<ShoppingCart>(
                              builder: (context, provider, child) {
                                return Padding(
                                  padding: EdgeInsets.all(0.2.w),
                                  child: Text(
                                    '${context.watch<ShoppingCart>().ordersNumber}',
                                    key: Key('counterState'),
                                    style: TextStyle(
                                      fontSize: 7.sp,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                selectedchoices.isEmpty
                    ? Expanded(
                        child: Center(
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              "?",
                              style: TextStyle(
                                  color: Colors.grey.withOpacity(0.2),
                                  fontSize: 100.sp,
                                  fontWeight: FontWeight.w100),
                            ),
                          ),
                        ),
                      )
                    : Expanded(
                        child: Center(
                          child: ListView.builder(
                            itemCount: selectedchoices.length,
                            itemBuilder: (context, index) {
                              var item = selectedchoices[index];

                              return Padding(
                                padding: EdgeInsets.fromLTRB(2.w, 0, 2.w, 0),
                                child: Card(
                                    color: Colors.white,
                                    elevation: 4.0,
                                    child: Container(
                                        height: 6.h,
                                        child: Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              2.w, 0, 2.w, 0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Consumer<ShoppingCart>(
                                                    builder: (context, provider,
                                                        child) {
                                                      return GestureDetector(
                                                        onTap: () {
                                                          // provider
                                                          //     .decreaseAmountOfFood(
                                                          //   item.quantity,
                                                          // );

                                                          if (item.quantity! <=
                                                              1) {
                                                            provider
                                                                .removeselecteditem(
                                                                    index);
                                                            provider
                                                                .decreasOrderNumber();
                                                          } else {
                                                            provider
                                                                .decreasOrderNumber();
                                                          }
                                                          ;
                                                          provider.calculateSubTotalPrice(
                                                              item.quantity!,
                                                              double.parse(
                                                                  item.price));
                                                        },
                                                        child: Icon(
                                                          Icons.delete_rounded,
                                                          size: 4.h,
                                                          color:
                                                              Colors.red[600],
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                  // Text(
                                                  //   '${context.watch<ShoppingCart>().amountOfFood}',
                                                  //   style: TextStyle(
                                                  //     fontWeight:
                                                  //         FontWeight.w600,
                                                  //     fontSize: 14.sp,
                                                  //     color: Colors.grey[600],
                                                  //   ),
                                                  // ),
                                                  SizedBox(
                                                      height: 20.h,
                                                      width: 20.w,
                                                      child: Image.asset(
                                                          item.imageUrl)),
                                                  Consumer<ShoppingCart>(
                                                    builder: (context, provider,
                                                        child) {
                                                      return GestureDetector(
                                                        onTap: () {
                                                          provider
                                                              .increaseOrderNumber();
                                                          provider.calculateAddTotalPrice(
                                                              item.quantity!,
                                                              double.parse(
                                                                  item.price));
                                                          provider
                                                              .addselecteditem(
                                                                  item);
                                                        },
                                                        child: Icon(
                                                          Icons.add,
                                                          size: 4.h,
                                                          color:
                                                              Colors.green[600],
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 1.w),
                                                child: Text(
                                                  item.title,
                                                  style: TextStyle(
                                                      fontSize: 10.sp),
                                                ),
                                              ),
                                              Text(
                                                item.price,
                                                style:
                                                    TextStyle(fontSize: 10.sp),
                                              ),
                                            ],
                                          ),
                                        ))),
                              );
                            },
                          ),
                        ),
                      ),
              ],
            ),
          ),
          Expanded(
            flex: 0,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 30, 10),
              child: Container(
                alignment: Alignment.bottomRight,
                child: Text(
                  "Total Amount:        RM${context.watch<ShoppingCart>().totalPriceNumber.toStringAsFixed(2)}",
                  style:
                      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 0,
            child: Container(
              color: Colors.white,
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 8, 10, 8),
                      child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                              height: 8.h,
                              width: 20.w,
                              child: Center(
                                  child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 2.h, 0, 2.h),
                                child: Text(
                                  "Add More",
                                  style: TextStyle(
                                      fontSize: 12.sp, color: Colors.orange),
                                ),
                              ))),
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      side: BorderSide(
                                          width: 0.4.w,
                                          color: Colors.orange))))),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 8, 20, 8),
                      child: GestureDetector(
                        child: Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                height: 8.h,
                                width: double.infinity,
                                child: TextButton.icon(
                                  icon: Icon(
                                    Icons.payments_rounded,
                                    size: 5.h,
                                  ),
                                  label: Text(
                                    "Payment",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                  onPressed: () {
                                    if (selectedchoices.isEmpty) {
                                      //toast message
                                      Fluttertoast.showToast(
                                          msg: "Please select an item");
                                    } else {
                                      Navigator.pushNamed(context, '/fourth');
                                    }
                                  },
                                  style: TextButton.styleFrom(
                                    backgroundColor:
                                        Color.fromARGB(255, 11, 177, 5),
                                    primary: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ));

  // bottomNavigationBar: Container(
  //   color: Colors.yellow,
  //   height: 130,
  //   child: Column(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: [
  //       Padding(
  //         padding: const EdgeInsets.fromLTRB(0, 10, 20, 0),
  //         child: Container(
  //           alignment: Alignment.centerRight,
  //           child: Text(
  //             "Total Amount:        \RM${numbersOfOrders.totalNumber}",
  //             style: TextStyle(fontSize: 20),
  //           ),
  //         ),
  //       ),
  //       Expanded(
  //         child: Row(
  //           crossAxisAlignment: CrossAxisAlignment.end,
  //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //           children: [
  //             Expanded(
  //               child: Padding(
  //                 padding: const EdgeInsets.all(10.0),
  //                 child: Container(
  //                   height: 50,
  //                   width: 200,
  //                   child: MaterialButton(
  //                     child: Text("Add more"),
  //                     color: Colors.redAccent,
  //                     shape: RoundedRectangleBorder(
  //                       borderRadius: BorderRadius.circular(
  //                         30,
  //                       ),
  //                     ),
  //                     onPressed: () {
  //                       Navigator.of(context).pop();
  //                     },
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             Expanded(
  //               child: Padding(
  //                 padding: const EdgeInsets.all(10.0),
  //                 child: Container(
  //                   height: 50,
  //                   width: 200,
  //                   child: MaterialButton(
  //                     child: Text("Checkout"),
  //                     color: Colors.green,
  //                     shape: RoundedRectangleBorder(
  //                       borderRadius: BorderRadius.circular(
  //                         30,
  //                       ),
  //                     ),
  //                     onPressed: () {
  //                       Navigator.of(context).push(
  //                         MaterialPageRoute(
  //                           builder: (context) => PaymentMethodScreen(),
  //                         ),
  //                       );
  //                     },
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ],
  //   ),
  // ),
  // // appBar: AppBar(
  // //   title: Text(
  // //       'Order lists/Cart page (${context.watch<ShoppingCart>().ordersNumber})'),
  // // ),
  // // body: ListView.builder(
  // //   itemCount: context.watch<ShoppingCart>().ordersNumber,
  // //   itemBuilder: (context, index) {
  // //     var item = selectedchoices[index];
  // //     return Card(
  // //       elevation: 4.0,
  // //       child: ListTile(
  // //         leading: SizedBox(
  // //           child: Image.asset(
  // //             item.imageUrl,
  // //             height: 28,
  // //           ),
  // //         ),
  // //         title: Text(item.title),
  // //         trailing: GestureDetector(
  // //           child: Icon(
  // //             Icons.remove_circle,
  // //             color: Colors.red,
  // //           ),
  // //           // : Icon(
  // //           //     Icons.remove_circle,
  // //           //     color: Colors.red,
  // //           //   ),
  // //           onTap: () {
  // //             numbersOfOrders.decreasOrderNumber();
  // //             numbersOfOrders.calculateTotalPrice(
  // //                 numbersOfOrders.amountOfFood,
  // //                 double.parse(item.price));
  // //             numbersOfOrders.removeselecteditem(index);
  // //           },
  // //         ),
  // //       ),
  // //     );
  // //   },
  // // ),

}

