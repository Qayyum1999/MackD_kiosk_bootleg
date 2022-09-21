import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:foodkiosk/providers/shopping_cart_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
class OrderMethod extends StatelessWidget {
  OrderMethod({Key? key}) : super(key: key);
  late String ordermethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 13, 138, 9),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 0),
            child: Container(
              alignment: Alignment.center,
              height: 20.h,
              width: 20.w,
              child: SvgPicture.asset(
                "assets/images/logo.svg",
              ),
              // decoration: const BoxDecoration(
              //     image: DecorationImage(
              //   image: SvgPicture("images/logo.svg"),
              //   fit: BoxFit.cover,
              // )), // button text
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.h),
            child: Text(
              "Choose",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 15.sp,
              ),
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    context.read<ShoppingCart>().reset();

                    ordermethod = "Dine In";
                    context
                        .read<ShoppingCart>()
                        .ordermethodprovider(ordermethod);
                    // Navigate to the second screen using a named route.
                    Navigator.pushNamed(context, '/second');
                  },
                  child: Container(
                    height: 30.h,
                    width: 40.w,
                    child: Card(
                      color: Colors.white,
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4.h)),
                        side: BorderSide(
                          color: Colors.grey.withOpacity(0.2),
                          width: 0.4.h,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.local_dining_outlined,
                            size: 15.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 1.h, horizontal: 1.h),
                            child: Text("DINE IN",
                                style: TextStyle(
                                  color: Colors.green.shade800,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10.sp,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                GestureDetector(
                  onTap: () {
                    context.read<ShoppingCart>().reset();

                    ordermethod = "Take Away";
                    context
                        .read<ShoppingCart>()
                        .ordermethodprovider(ordermethod);
                    // Navigate to the second screen using a named route.
                    Navigator.pushNamed(context, '/second');
                  },
                  child: Container(
                    height: 30.h,
                    width: 40.w,
                    child: Card(
                      color: Colors.white,
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4.h)),
                        side: BorderSide(
                          color: Colors.grey.withOpacity(0.2),
                          width: 0.4.h,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.takeout_dining_rounded,
                            size: 15.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 1.h, horizontal: 1.h),
                            child: Text("TAKE AWAY",
                                style: TextStyle(
                                  color: Colors.green.shade800,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10.sp,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          )
        ],
      ),
    );
  }
}
