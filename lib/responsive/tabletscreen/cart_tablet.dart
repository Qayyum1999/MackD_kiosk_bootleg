import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:foodkiosk/main.dart';
import 'package:foodkiosk/model/product_model.dart';
import 'package:foodkiosk/widget/category_item.dart';
import 'package:foodkiosk/providers/shopping_cart_provider.dart';
import 'package:foodkiosk/widget/menu_item.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';
import 'package:foodkiosk/constants.dart';

class CartListScreenTablet extends StatelessWidget {
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
                                                  style:
                                                      TextStyle(fontSize: 8.sp),
                                                ),
                                              ),
                                              Text(
                                                item.price,
                                                style:
                                                    TextStyle(fontSize: 8.sp),
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
                      TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold),
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
                                      fontSize: responsive_Tablet_textsize,
                                      color: Colors.orange),
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
                            Container(
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
                                    fontSize: responsive_Tablet_textsize,
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
}

class CartListScreenTabletMedium extends StatelessWidget {
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
                            fontSize: 8.sp, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      if (choices.length > 0)
                        CircleAvatar(
                          radius: 4.sp,
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Consumer<ShoppingCart>(
                              builder: (context, provider, child) {
                                return Padding(
                                  padding: EdgeInsets.all(0.2.sp),
                                  child: Text(
                                    '${context.watch<ShoppingCart>().ordersNumber}',
                                    key: Key('counterState'),
                                    style: TextStyle(
                                      fontSize: 6.sp,
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
                                                    EdgeInsets.only(left: 2.w),
                                                child: Text(
                                                  item.title,
                                                  softWrap: false,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 2,
                                                  style:
                                                      TextStyle(fontSize: 7.sp),
                                                ),
                                              ),
                                              Text(
                                                item.price,
                                                style: TextStyle(
                                                  fontSize: 7.sp,
                                                ),
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
                  style: TextStyle(fontSize: 8.sp, fontWeight: FontWeight.bold),
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
                                      fontSize:
                                          responsive_Tablet_Medium_textsize,
                                      color: Colors.orange),
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
                            Container(
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
                                    fontSize: responsive_Tablet_Medium_textsize,
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
}
