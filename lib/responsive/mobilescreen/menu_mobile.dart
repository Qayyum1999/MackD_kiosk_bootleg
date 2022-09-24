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

//Normal mobile screen
class MenuScreenMobile extends StatefulWidget {
  @override
  State<MenuScreenMobile> createState() => _MenuScreenMobileState();
}

class _MenuScreenMobileState extends State<MenuScreenMobile> {
  var responsivetextsize = responsive_Mobile_textsize;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Column(
        children: [
          Stack(
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
                  width: 100.w,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage("assets/images/adsmcd.png"),
                    fit: BoxFit.cover,
                  )), // button text
                ),
              ),
            ],
          ),
          Consumer<ShoppingCart>(builder: (context, provider, child) {
            return Container(
              alignment: Alignment.topCenter,
              child: Text(
                provider.categoryname,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                ),
              ),
            );
          }),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // list of category
                Expanded(
                  flex: 2,
                  child: ListView(
                    primary: false,
                    children: <Widget>[
                      CategoryItem(
                        imageUrl: 'assets/images/combo_meal.png',
                        name: 'Main Menu',
                        categorychoice: choices,
                        responsivetextsize: responsivetextsize,
                      ),
                      CategoryItem(
                        imageUrl: 'assets/images/quarter_pounder.png',
                        name: 'Burgers',
                        categorychoice: burgerchoices,
                        responsivetextsize: responsivetextsize,
                      ),
                      CategoryItem(
                        name: "Beverages",
                        categorychoice: beveragechoices,
                        imageUrl: 'assets/images/beverages.png',
                        responsivetextsize: responsivetextsize,
                      ),
                      CategoryItem(
                        imageUrl: 'assets/images/bacon_ranch_salad.png',
                        name: 'Snacks & Sides',
                        categorychoice: choices,
                        responsivetextsize: responsivetextsize,
                      ),
                      CategoryItem(
                        name: "Happy Meal",
                        categorychoice: choices,
                        imageUrl: 'assets/images/happy_meal.png',
                        responsivetextsize: responsivetextsize,
                      ),
                      CategoryItem(
                        name: "Fries",
                        categorychoice: choices,
                        imageUrl: 'assets/images/snacks_and_sides.png',
                        responsivetextsize: responsivetextsize,
                      ),
                      CategoryItem(
                        imageUrl: 'assets/images/bacon_ranch_salad.png',
                        responsivetextsize: responsivetextsize,
                        name: 'Snacks & Sides',
                        categorychoice: choices,
                      ),
                      CategoryItem(
                        name: "Chicken",
                        categorychoice: choices,
                        imageUrl: 'assets/images/chicken.png',
                        responsivetextsize: responsivetextsize,
                      ),
                        ],
                  ),
                ),

                // grid of menu items
                Expanded(
                  flex: 6,
                  child: Consumer<ShoppingCart>(
                      builder: (context, provider, child) {
                    return GridView.builder(
                      itemCount: provider.selector.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          child: Menuitem(
                            choice: provider.selector[index],
                            responsivetextsize: responsivetextsize,
                          ),
                          onTap: () {
                            context.read<ShoppingCart>().increaseOrderNumber();
                            // int noquantity =
                            //     int.parse(choices[index].quantity);
                            // String squantity = '${noquantity++}';

                            context.read<ShoppingCart>().addselecteditem(
                                  Choice(
                                    title: provider.selector[index].title,
                                    imageUrl: provider.selector[index].imageUrl,
                                    price: provider.selector[index].price,
                                    quantity: provider.selector[index].quantity,
                                    category: provider.selector[index].category,
                                  ),
                                );

                            context.read<ShoppingCart>().calculateAddTotalPrice(
                                provider.selector[index].quantity!,
                                double.parse(provider.selector[index].price));
                          },
                        );
                      },
                    );
                  }),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
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
              padding: EdgeInsets.fromLTRB(3.w, 5, 3.w, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My Order - ${context.watch<ShoppingCart>().newordermethod}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: responsive_Mobile_textsize,
                    ),
                  ),
                  selectedchoices.isEmpty
                      ? Text(
                          'Please select an item',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: responsive_Mobile_textsize,
                          ),
                        )
                      : Consumer<ShoppingCart>(
                          builder: (context, provider, child) {
                          return Text(
                            '${provider.ordersNumber} items in list',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: responsive_Mobile_textsize,
                            ),
                          );
                        }),
                ],
              ),
            ),
          ),
          Container(
            height: 10.h,
            color: Colors.white,
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                    child: GestureDetector(
                      child: Center(
                        child: Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            Container(
                              height: 8.h,
                              width: double.infinity,
                              child: TextButton(
                                  child: Text(
                                    "Cancel Order",
                                    style: TextStyle(
                                        fontSize: responsive_Mobile_textsize,
                                        color: Colors.red),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(1.h)),
                                      side: BorderSide(
                                        color: Colors.red,
                                        width: 0.4.h,
                                      ),
                                    ),
                                  ))),
                            ),
                          ],
                        ),
                      ),
                    ),
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
                            Container(
                              height: 8.h,
                              width: double.infinity,
                              child: TextButton.icon(
                                icon: Icon(
                                  Icons.shopping_cart_outlined,
                                  size: 4.h,
                                ),
                                label: Text(
                                  "Check Cart",
                                  style: TextStyle(
                                    fontSize: responsive_Mobile_textsize,
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
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
