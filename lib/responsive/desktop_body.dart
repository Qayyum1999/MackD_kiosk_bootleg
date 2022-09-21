import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:foodkiosk/main.dart';

import 'package:foodkiosk/model/product_model.dart';
import 'package:foodkiosk/widget/category_item.dart';
import 'package:foodkiosk/providers/shopping_cart_provider.dart';
import 'package:foodkiosk/widget/menu_item.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';

class MenuScreenDesktop extends StatefulWidget {
  @override
  State<MenuScreenDesktop> createState() => _MenuScreenDesktopState();
}

class _MenuScreenDesktopState extends State<MenuScreenDesktop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Column(
        children: [
          Expanded(
            flex: 0,
            child: Stack(
              children: [
                Container(
                  height: 10.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 177, 17, 5),
                          Color.fromARGB(255, 235, 33, 19),
                          Colors.red,
                          Colors.redAccent,
                          Colors.red,
                          Color.fromARGB(255, 235, 33, 19),
                          Color.fromARGB(255, 177, 17, 5),
                          //add more colors for gradient
                        ],
                        begin: Alignment.topLeft, //begin of the gradient color
                        end: Alignment.bottomRight, //end of the gradient color
                        stops: [
                          0,
                          0.1,
                          0.3,
                          0.5,
                          0.7,
                          0.9,
                          1
                        ] //stops for individual color
                        //set the stops number equal to numbers of color
                        ),
                  ),
                ),
                Center(
                  child: Container(
                    alignment: Alignment.center,
                    height: 10.h,
                    width: 50.w,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage("assets/images/adsmcd.png"),
                      fit: BoxFit.cover,
                    )), // button text
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 18.0, right: 80),
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Burgers",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      // list of category
                      Expanded(
                        flex: 3,
                        child: AspectRatio(
                          aspectRatio: 0.25,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 10.h,
                                width: 10.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.grey[200],
                                ),
                                child: ListView(
                                  children: <Widget>[
                                    CategoryItem(
                                      imageUrl:
                                          'assets/images/quarter_pounder.png',
                                      name: 'Burgers',
                                    ),
                                    CategoryItem(
                                      name: "Happy Meal",
                                      imageUrl: 'assets/images/happy_meal.png',
                                    ),
                                    CategoryItem(
                                      name: "Beverages",
                                      imageUrl: 'assets/images/beverages.png',
                                    ),
                                    CategoryItem(
                                      name: "Fries",
                                      imageUrl:
                                          'assets/images/snacks_and_sides.png',
                                    ),
                                    CategoryItem(
                                      imageUrl:
                                          'assets/images/bacon_ranch_salad.png',
                                      name: 'Snacks & Sides',
                                    ),
                                    CategoryItem(
                                      name: "Chicken",
                                      imageUrl: 'assets/images/chicken.png',
                                    ),
                                    CategoryItem(
                                      imageUrl:
                                          'assets/images/quarter_pounder.png',
                                      name: 'Burgers',
                                    ),
                                    CategoryItem(
                                      name: "Happy Meal",
                                      imageUrl: 'assets/images/happy_meal.png',
                                    ),
                                    CategoryItem(
                                      name: "Beverages",
                                      imageUrl: 'assets/images/beverages.png',
                                    ),
                                    CategoryItem(
                                      name: "Fries",
                                      imageUrl:
                                          'assets/images/snacks_and_sides.png',
                                    ),
                                    CategoryItem(
                                      imageUrl:
                                          'assets/images/bacon_ranch_salad.png',
                                      name: 'Snacks & Sides',
                                    ),
                                    CategoryItem(
                                      name: "Chicken",
                                      imageUrl: 'assets/images/chicken.png',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      // grid of menu items
                      Expanded(
                        flex: 20,
                        child: Padding(
                          padding: EdgeInsets.only(top: 10.0.h),
                          child: SizedBox(
                            width: double.infinity,
                            child: GridView.builder(
                              itemCount: choices.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 6),
                              itemBuilder: (BuildContext context, int index) {
                                return Center(
                                  child: GestureDetector(
                                    child: Container(
                                        height: 100.h,
                                        width: 100.h,
                                        child:
                                            Menuitem(choice: choices[index])),
                                    onTap: () {
                                      context
                                          .read<ShoppingCart>()
                                          .increaseOrderNumber();
                                      // int noquantity =
                                      //     int.parse(choices[index].quantity);
                                      // String squantity = '${noquantity++}';

                                      context
                                          .read<ShoppingCart>()
                                          .addselecteditem(
                                            Choice(
                                              title: choices[index].title,
                                              imageUrl: choices[index].imageUrl,
                                              price: choices[index].price,
                                              quantity: choices[index].quantity,
                                              category: choices[index].category,
                                            ),
                                          );

                                      context
                                          .read<ShoppingCart>()
                                          .calculateAddTotalPrice(
                                              choices[index].quantity!,
                                              double.parse(
                                                  choices[index].price));
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 0,
            child: Container(
              alignment: Alignment.topCenter,
              // color: Color.fromARGB(255, 0, 104, 9),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 5, 112, 2),
                      Color.fromARGB(255, 8, 146, 3),
                      Color.fromARGB(255, 11, 177, 5),
                      Color.fromARGB(255, 11, 177, 5),
                      Color.fromARGB(255, 11, 177, 5),
                      Color.fromARGB(255, 8, 146, 3),
                      Color.fromARGB(255, 5, 112, 2),
                      //add more colors for gradient
                    ],
                    begin: Alignment.topLeft, //begin of the gradient color
                    end: Alignment.bottomRight, //end of the gradient color
                    stops: [
                      0,
                      0.2,
                      0.3,
                      0.5,
                      0.7,
                      0.8,
                      1
                    ] //stops for individual color
                    //set the stops number equal to numbers of color
                    ),
              ),
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.fromLTRB(2.w, 4, 2.w, 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'My Order - ${context.watch<ShoppingCart>().newordermethod}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 3.sp,
                      ),
                    ),
                    selectedchoices.isEmpty
                        ? Text(
                            'Please select an item',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 3.sp,
                            ),
                          )
                        : Consumer<ShoppingCart>(
                            builder: (context, provider, child) {
                            return Text(
                              '${provider.ordersNumber} items in list',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 3.sp,
                              ),
                            );
                          }),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 0,
            child: Container(
              height: 8.h,
              color: Colors.white,
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(flex: 5, child: SizedBox(width: double.infinity)),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                      child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                              child: Center(
                                  child: Text(
                            "Cancel Order",
                            style: TextStyle(fontSize: 4.sp, color: Colors.red),
                          ))),
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(1.h)),
                              side: BorderSide(
                                color: Colors.red,
                                width: 0.4.h,
                              ),
                            ),
                          ))),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                      child: GestureDetector(
                        child: Center(
                          child: Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  height: 8.h,
                                  width: 50.w,
                                  child: TextButton.icon(
                                    icon: Icon(
                                      Icons.shopping_cart_outlined,
                                      size: 4.h,
                                    ),
                                    label: Text(
                                      "Check Cart",
                                      style: TextStyle(
                                        fontSize: 4.sp,
                                      ),
                                    ),
                                    onPressed: () {
                                      if (selectedchoices.isEmpty) {
                                        //toast message
                                        Fluttertoast.showToast(
                                            msg: "Please select an item");
                                      } else {
                                        Navigator.pushNamed(context, '/third');
                                      }
                                    },
                                    style: TextButton.styleFrom(
                                      backgroundColor:
                                          Color.fromARGB(255, 11, 177, 5),
                                      primary: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(1.h),
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CartListScreenDesktop extends StatelessWidget {
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
                  height: 5.h,
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
                                                      TextStyle(fontSize: 5.sp),
                                                ),
                                              ),
                                              Text(
                                                item.price,
                                                style:
                                                    TextStyle(fontSize: 5.sp),
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
                  style: TextStyle(fontSize: 6.sp, fontWeight: FontWeight.bold),
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
                  Expanded(flex: 5, child: SizedBox(width: double.infinity)),
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
                                      fontSize: 4.sp, color: Colors.orange),
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
                                    size: 4.h,
                                  ),
                                  label: Text(
                                    "Payment",
                                    style: TextStyle(
                                      fontSize: 4.sp,
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
}
